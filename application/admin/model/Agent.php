<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-9
 * Time: 10:51
 */

namespace app\admin\model;

use think\Model;

class Agent extends Model
{

    /**
     *  统计用户下注总coin
     * @param $value
     * @param $data
     * @return float|int
     */
    public function getTongJiAttr($value, $data)
    {
        $Detail_log = new DetailLog();
        $result = $Detail_log->where('user_id',$data['id'])->where('action_id',2)->sum('coin');
        return $result;
    }

    /**
     *  获取上级代理
     * @param $value
     * @param $data
     * @return mixed|string
     */
    public function getParentAgentAttr($value, $data)
    {
        if ($data['parent_id'] == 0) {
            return '顶级';
        }
        $result = $this->where('parent_id', $data['id'])->find()['nickname'];
        if ($result == null) {
            return '无上级';
        } else {
            return $result;
        }

    }

    /**
     *  用户数量统计
     * @param $value
     * @param $data
     * @return int
     */
    public function getUserNumAttr($value, $data)
    {
        $User = new User();
        $result = $User->where('parent_id', $data['id'])->count();
        return $result;

    }

    /**
     *  下级代理num获取器统计
     * @param $value
     * @param $data
     * @return int
     */
    public function getDaiLiNumAttr($value, $data)
    {
        $result = $this->where('parent_id', $data['id'])->count();
        return $result;
    }

    public function getBanksAttr($value, $data)
    {
        $Bank = new Bank();
        $result = $Bank->field('coin')->where('user_id', $data['id'])->find()->toArray();
        return $result;

    }

    /**
     * @param $data
     * @return array|string
     * 代理信息保存
     */
    public function agentSave($data)
    {
        $maxRgt = $this->max('rgt');//1 2
        //左值=最大右值+1，右值=最大右值+2
        $lft = $maxRgt + 1;
        $rgt = $maxRgt + 2;
        $data['lft'] = $lft;
        $data['rgt'] = $rgt;
        $data['create_time'] = time();
        $data['create_ip'] = request()->ip();
        $data['password'] = md5($data['password']);
        $data['status'] = 1;
        $result = $this->insert($data);
        return $result;
    }

    /**
     * 根据id获取用户信息
     */
    public function getUserInfoEdit($id, $aid)
    {
        $result = $this->get($id);
        if ($aid == 1) {
            $User = new User();
            $res = $User->where('id', $id)->find();
            return $res;
        }
        return $result;
    }

    /**
     * @param $id
     * @return null|static
     * 通过ID获取代理密码信息
     */
    public function getAgentPasswordInfo($id)
    {
        $data = $this->get($id);
        return $data;
    }

    /**
     *  通过ID获取用户密码信息
     * @param $id
     * @return array|false|\PDOStatement|string|Model
     */
    public function getUserPasswordInfo($id)
    {
        $User = new User();
        $result = $User->find($id);
        return $result;
    }

    /**
     * @param $password
     * @param $id
     * @param $aid
     * @return bool
     * 更改用户密码
     */
    public function changePasswordPross($password, $id, $aid)
    {
        if ($aid == 0) {
            $result = $this->update(['id' => $id, 'password' => $password]);
            $res = $this->res($result);
            return $res;
        }
        if ($aid == 1) {
            $User = new User();
            $result = $User->update(['id' => $id, 'password' => $password]);
            $res = $this->res($result);
            return $res;
        }
    }

    /**
     *  结果处理
     * @param $result
     * @return bool
     */
    public function res($result)
    {
        if ($result) {
            return true;
        } else {
            return false;
        }
    }


    /**
     *  用户编辑保存
     * @param string $id
     * @param string $aid
     * @param string $nickname
     * @param string $username
     * @param string $phone
     * @param string $status
     * @param int $lock
     * @return array|string
     */

    public function editSave($id, $aid, $nickname, $username, $phone, $status, $lock)
    {
        $data = ['nickname' => $nickname, 'username' => $username, 'phone' => $phone, 'status' => $status, 'lock' => $lock];
        $Agent = new Agent();
        if ($aid == 0) {
            $result = $Agent->validate(true)->where('id', $id)->update($data);
            if (false === $result && $result === 0) {
                // 验证失败 输出错误信息
                return ['code'=>0,'msg'=>$Agent->getError()];
            }
        }
        if ($aid == 1) {
            $User = new User();
            $result = $User->validate(true)->where('id', $id)->update($data);
            if (false === $result) {
                // 验证失败 输出错误信息
                return ['code'=>0,'msg'=>$User->getError()];
            }
        }

    }

    /** 删除代理更新左右值
     * @param $id
     * @return array|int
     */
    public function userLftRgtDelete($id)
    {
        $data = $this->where('id', $id)->field('lft,rgt')->find()->toArray();
        $middle = $data['rgt'] - $data['lft'] + 1;
        $this->where('lft', 'between', [$data['lft'], $data['rgt']])->delete();
        db('user')->where('lft', 'between', [$data['lft'], $data['rgt']])->delete();
        $this->execute("UPDATE `agent` SET rgt = rgt-{$middle} WHERE rgt > {$data['rgt']}");
        $this->execute("UPDATE `agent` SET lft = lft-{$middle} WHERE lft > {$data['rgt']}");
        $this->execute("UPDATE `user` SET rgt = rgt-{$middle} WHERE rgt > {$data['rgt']}");
        $this->execute("UPDATE `user` SET lft = lft-{$middle} WHERE lft > {$data['rgt']}");
        return $data;
    }

    /** 用户转移
     * @param $pid
     * @param $id
     * @return int
     */
    public function userMoveNode($pid, $id)
    {
        //软删除当前节点状态设置为1
        $User = new User();
        $data = $User->where('id', $id)->field('lft,rgt')->find()->toArray();
        //查询下级有没有
//        $xiaji = $User->where('lft', 'between', [$data['lft'], $data['rgt']])->select()->toArray();
//        $arr = [];
//        foreach ($xiaji as $x){
//            $arr[] = $x['id'];
//        }
        $middle = $data['rgt'] - $data['lft'] + 1;  //2
        $this->execute("update `user` set `node_status`=1,`lft`=0,`rgt`=0 WHERE id = {$id}");
//        $User->where('id','in',$arr)->update(['node_status'=>1,'lft'=>0,'rgt'=>0]);
        //更新所有节点

        $this->execute("UPDATE `user` SET rgt = rgt-{$middle} WHERE rgt > {$data['rgt']} AND `node_status`=0");
        $this->execute("UPDATE `user` SET lft = lft-{$middle} WHERE lft > {$data['rgt']} AND `node_status`=0");
        $this->execute("UPDATE `agent` SET rgt = rgt-{$middle} WHERE rgt > {$data['rgt']} AND `node_status`=0");
        $this->execute("UPDATE `agent` SET lft = lft-{$middle} WHERE lft > {$data['rgt']} AND `node_status`=0");
        //当前节点设置为0再把当前节点添加到父节点并更新左右值
        $node = $this->where('id', $pid)->field('lft,rgt')->find()->toArray();
        $lft = $node['rgt'];
        $rgt = $lft + 1;
        $this->execute("update `user` set rgt = rgt+2 where rgt >= {$node['rgt']} AND `node_status`=0");
        $this->execute("update `user` set lft = lft+2 where lft > {$node['rgt']} AND `node_status`=0");
        $this->execute("update `agent` set rgt = rgt+2 where rgt >= {$node['rgt']} AND `node_status`=0");
        $this->execute("update `agent` set lft = lft+2 where lft > {$node['rgt']} AND `node_status`=0");
        $User->execute("update `user` set lft={$lft},rgt={$rgt},`node_status`=0,`parent_id`={$pid} where id={$id}");
        return 1;
    }
}