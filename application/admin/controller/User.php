<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-10
 * Time: 17:30
 */

namespace app\admin\controller;

use app\admin\model\Bank;
use app\admin\model\DetailAction;
use app\admin\model\DetailLog;
use app\admin\model\User as MUser;
use app\admin\model\Agent as MAgent;
use GatewayClient\Gateway;
use mptta\MPTTA;
use think\Config;
use think\Db;
use think\helper\Time;
use think\Loader;

/**
 * Class User
 * @package app\admin\controller
 * 用户处理类
 */
class User extends Base
{

    /**
     * 代理用户管理列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $Agent = new MAgent();
        $propList = $Agent->where('parent_id', 0)
            ->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET])->each(function ($item) {
                $Bank = new Bank();
                $bank_coin = $Bank->where('user_id', $item->id)->field('coin')->select()->toArray();
                foreach ($bank_coin as &$v) {
                    $item->coin = $v['coin'] + $item->coin;
                }
            });
        $page = $propList->render();
        $this->assign('data', $propList);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 所有用户列表
     * @param string $nickname
     * @param string $phone
     * @param string $username
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function user_list($nickname = '', $phone = '', $username = '')
    {
        $User = new MUser();
        if ($nickname) {
            $User->where('nickname', trim($nickname));
        }
        if ($username) {
            $User->where('username', trim($username));
        }
        if ($phone) {
            $User->where('phone', trim($phone));
        }
        if ($nickname != '' || $username != '' || $phone != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onClick="javascript:window.history.back();return false;" value="返回">');
        }
        $result = $User->where('status', 'neq', 2)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET])->each(function ($item) {
            $time = floor((time() - strtotime($item->active_time)) % 86400 / 60);
            if ($time < 8) {
                $item->active_time = '在线';
            } else {
                $item->active_time = '离线';
            }
        });
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('user/index');
    }

    /**
     * 用户列表
     * @param string $id
     * @param string $nickname
     * @param string $username
     * @param string $phone
     * @param int $status
     * @param int $sare
     * @param string $startTime
     * @param string $endTime
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index2($id = '', $nickname = '', $username = '', $phone = '', $status = 0, $sare = 0, $startTime = '', $endTime = '')
    {
        $User = new MUser();
        $start_time = strtotime($startTime);
        $end_time = strtotime($endTime);
        if ($nickname != '') {
            $User->where('u.nickname', $nickname);
        }
        if ($username != '') {
            $User->where('u.username', $username);
        }
        if ($phone != '') {
            $User->where('u.phone', $phone);
        }
        if ($status != '') {
            $User->where('u.status', $status);
        }
        if ($start_time && $end_time == '') {
            $User->whereTime('u.create_time', 'egt', $start_time);
        }
        if ($start_time && $end_time) {
            $User->whereTime('u.create_time', 'between', [$start_time, $end_time]);
        }
        if (!$start_time && $end_time) {
            $User->whereTime('u.create_time', 'elt', $end_time);
        }
        if ($id != '') {
            $User->where('u.parent_id', $id);
        }
        $useryh = $User->alias('u')->field('a.nickname as nick,u.id,u.nickname,u.username,u.sex,u.coin,u.phone,u.vip_exp,u.create_time,u.active_ip,u.status,u.lock')->join('agent a', 'a.parent_id=u.id', 'LEFT')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $userpage = $useryh->render();
        $this->assign('useryh', $useryh);
        $this->assign('userpage', $userpage);
        return $this->fetch('user');
    }

    /**
     *  转移页面
     * @param int $id
     * @return mixed
     */
    public function transfer($id = 0)
    {
        $this->assign('data', $id);
        return $this->fetch();
    }

    /**
     * 用户代理搜索
     * @param string $nickname
     * @param string $username
     * @param string $phone
     * @param int $status
     * @param int $sare
     * @param string $startTime
     * @param string $endTime
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function search($nickname = '', $username = '', $phone = '', $status = 0, $sare = 0, $startTime = '', $endTime = '')
    {
        $start_time = strtotime($startTime);
        $end_time = strtotime($endTime);
        $Agent = new MAgent();
        if ($nickname != '') {
            $Agent->where('nickname', trim($nickname));
        }
        if ($username != '') {
            $Agent->where('username', trim($username));
        }
        if ($phone != '') {
            $Agent->where('phone', trim($phone));
        }
        if ($status != '') {
            $Agent->where('status', $status);
        }
        if ($start_time && !$end_time) {
            $Agent->whereTime('create_time', 'egt', $start_time);
        }
        if ($start_time && $end_time) {
            $Agent->whereTime('create_time', 'between', [$start_time, $end_time]);
        }
        if (!$start_time && $end_time) {
            $Agent->whereTime('create_time', 'elt', $end_time);
        }
        $propList = $Agent->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        if (!$propList->items()) {
            $start_time = strtotime($startTime);
            $end_time = strtotime($endTime);
            $User = new MUser();
            if ($nickname != '') {
                $User->where('nickname', trim($nickname));
            }
            if ($username != '') {
                $User->where('username', trim($username));
            }
            if ($phone != '') {
                $User->where('phone', trim($phone));
            }
            if ($status != '') {
                $User->where('status', $status);
            }
            if ($start_time && !$end_time) {
                $User->whereTime('create_time', 'egt', $start_time);
            }
            if ($start_time && $end_time) {
                $User->whereTime('create_time', 'between', [$start_time, $end_time]);
            }
            if (!$start_time && $end_time) {
                $User->whereTime('create_time', 'elt', $end_time);
            }
            $propList = $User->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
            $page = $propList->render();
            $this->assign('data', $propList);
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onClick="javascript:window.history.back();return false;" value="返回">');
            $this->assign('page', $page);
            return $this->fetch('index');
        }
        $page = $propList->render();
        $this->assign('data', $propList);
        $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:window.history.back();return false;" value="返回">');
        $this->assign('page', $page);
        return $this->fetch('index');

    }

    /**
     * 代理转移
     * @param int $id
     * @param string $name
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function moveNode($id = 0, $name = '')
    {
        $User = new MUser();
        $mptta = new MPTTA();
        $data = $User->where('id|nickname|username', 'like', $name)->field('id, lft, rgt')->find();
        if ($data['id'] == $id) {
            $this->error('操作有误,请重新输入');
        }
        if (!$data) {
            $this->error('此用户不存在');
        }
        $row = $data->toArray();
        $pid = $row['id'];
        $mptta->moveNode($pid, $id);
    }

    /**
     * 添加用户页面
     * @param int $id
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add($id = 0)
    {
        $Agent = new Magent();
        $agentUser = $Agent->where('id', $id)->field('id,nickname')->find()->toArray();
        $this->assign('agent_user', $agentUser);
        return $this->fetch();
    }

    /**
     *  用户金币充值页面
     * @param $id
     * @return mixed
     */
    public function user_charge($id)
    {
        $this->assign('id',$id);
        return $this->fetch();
    }

    /**
     * 用户金币充值
     * @param $id
     * @param $coin
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function user_rechargeSave($id, $coin)
    {
        if(!$user = MUser::get($id)){
            return ['code'=>0,'msg'=>'用户不存在请检查'];
        }
        if (!preg_match('/^[0-9]+(.[0-9]{1,2})?$/', $coin)) {
            return ['code'=>0,'msg'=>'金币输入有误'];
        }
        $user->coin += $coin;
        $data = [
          'user_id' => $id,
            'action_id' => 1,
            'coin' => $coin,
            'before_coin' =>$user->coin,  //操作前余额,
            'after_coin' =>$user->coin + $coin,
            'info' => '充值',
            'create_time' => date('Y-m-d H:i:s',time()),
            'create_ip' => request()->ip()
        ];
        db('detail_log')->insert($data);
        $result = $user->save();
        $self_coin = $user->where('id',$id)->field('coin')->find()->coin;
        if($result){
            //更新用户游戏里面的金币
            Gateway::$registerAddress = '192.168.4.146:1238';
            $res = [
                'id' => $id,
                'coin' => $self_coin,
                'nickname' => $user->nickname,
                'photo' => $user->photo
            ];
            $data = parseSocketData('user_info', $res);
            Gateway::sendToUid($id, $data);
            return ['code'=>1,'msg'=>'充值成功'];
        }

    }

    /**
     * 添加用户到数据库
     * @param int $id
     * @param string $nickname
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param int $status
     * @param int $lock
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function user_save($id = 0, $nickname = '', $username = '', $password = '', $phone = '', $status = 0, $lock = 0)
    {
        $data = ['id' => $id, 'nickname' => $nickname, 'username' => $username, 'password' => $password, 'phone' => $phone, 'status' => $status, 'lock' => $lock];
        $validate = Loader::validate('User');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $User = new MUser();
        $nick = $User->where('nickname', $nickname)->field('nickname')->find();
        if ($nick) {
            $this->error('用户昵称已存在,请重新输入');
        }
        $user = $User->where('username', $username)->field('username')->find();
        if ($user) {
            $this->error('用户账号已存在,请重新输入');
        }
        $result = $User->userSave($id, $nickname, $username, $password, $phone, $status, $lock);
        if ($result) {
            $this->success('用户添加成功');
        } else {
            $this->success('用户添加失败');
        }
    }

    /**
     *  指定代理 添加用户页面
     */
    public function designated_user()
    {
        return $this->fetch();
    }

    /**
     * 指定上级代理,保存
     * @param int $id
     * @param string $nickname
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param int $status
     * @param int $lock
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function designated_user_save($id = 0, $nickname = '', $username = '', $password = '', $phone = '', $status = 0, $lock = 0)
    {
        $Agent = new MAgent();
        $result = $Agent->where('id', $id)->find();
        if ($result == null) {
            $this->error('上级代理ID不存在');
        }
        $data = ['id' => $id, 'nickname' => $nickname, 'username' => $username, 'password' => $password, 'phone' => $phone, 'status' => $status, 'lock' => $lock];
        $validate = Loader::validate('User');
        if (!$validate->scene('designated_user_save')->check($data)) {
            $this->error($validate->getError());
        }
        $User = new MUser();
        $result = $User->userSave($id, $nickname, $username, $password, $phone, $status, $lock);
        if ($result) {
            $this->success('用户添加成功');
        } else {
            $this->error('用户添加失败');
        }


    }

    /**
     *  用户更新
     * @return mixed
     */
    public function edit()
    {
        $User = new MUser();
        if (request()->isPost()) {
            $data = input('post.');
            $validate = validate('User');
            if (!$validate->scene('robot_edit_save')->check($data)) {
                $this->error($validate->getError());
            }
            $result = $User->editSave($data);
            if ($result) {
                $this->error($result);
            } else {
                $this->success('用户修改成功');
            }
        }
        $id = input('get.id');
        $User = new MUser();
        $result = $User->getUserInfoEdit($id);
        $this->assign('data', $result);
        return $this->fetch();
    }

    /**
     * 修改密码
     * @return mixed
     * @throws \think\Exception
     */
    public function changePassword()
    {
        $User = new MUser();
        if (request()->isPost()) {
            $id = input('id');
            $newPassword = md5(input('post.newpassword'));
            $password = md5(input('post.password'));
            if ($newPassword !== $password) {
                $this->error('对不起两次密码不相等,请重新输入');
            } else {
                $result = $User->changePasswordPross($password, $id);
                if ($result) {
                    $this->success('密码修改成功');
                } else {
                    $this->error('密码修改失败');
                }
            }

        }
        $id = input('id');
        $result = $User->getUserPasswordInfo($id)->toArray();
        $this->assign('data', $result);
        return $this->fetch();
    }

    /**
     * 点击查看下级
     * @param int $id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getChildReno($id = 0)
    {
        $Agent = new MAgent();
        $sqlarr = db('user')->field('u.id,u.phone,u.rgt,u.lft,u.nickname,u.username,u.vip_exp,u.create_time,u.active_ip,u.`status`,u.`lock`,u.parent_id,u.agent,u.coin,u.bank,u.bank_card')->alias('u')->where('u.parent_id', $id)->buildSql();
        $e = $Agent->alias('b')->field('b.id,b.phone,b.rgt,b.lft,b.nickname,b.username,b.vip_exp,b.create_time,b.active_ip,b.`status`,b.`lock`,b.parent_id,b.agent,b.coin,b.bank,b.bank_card')->union([$sqlarr])->buildSql();
        $row = Db::table($e . 'a')->where('a.parent_id', $id)->where('status', 'neq', 2)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET])->each(function ($item) {
            $item['coin'] = $item['coin'] + $item['bank'];
            return $item;
        });
        $page = $row->render();
        $pname = $Agent->where('id', $id)->find();
        $AgentInfo = $Agent->where('id', $id)->field('id,nickname')->find();
        if (empty($AgentInfo)) {
            $AgentInfo = (new MUser())->where('id', $id)->field('id,nickname')->find();
        }
        if ($pname['id']) {
            $pname['nickname'] = '上级id:&nbsp;&nbsp;' . $pname['id'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上级昵称:' . $pname['nickname'];
        } else {
            $pname['nickname'] = '上级id:&nbsp;&nbsp;' . $AgentInfo->id . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上级昵称:' . $AgentInfo->nickname;
        }
        $this->assign('pname', $pname['nickname']);
        $this->assign('data', $row);
        $this->assign('page', $page);
        $this->assign('child_id', $AgentInfo->id);
        $this->assign('child_nick', $AgentInfo->nickname);
        $this->assign('quick', '<a class="btn btn-warning radius" onClick="javascript:window.history.back();return; false;">返回</a>');
        return $this->fetch('index');
    }

    /**
     * 用户列表删除用户
     * @param $id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function del_user($id)
    {
        $User = new Muser();
        $data = $User->where('id', $id)->field('lft,rgt')->find();
        $row = $User->where('lft', 'between', [$data->lft, $data->rgt])->count();
        if ($row > 1) {
            return ['code' => 0, 'msg' => '存在下级用户,请先删除下级用户'];
        }
        $result = $User->userLftRgtDel($id);
        if ($result == 1) {
            return ['code' => 1, 'msg' => '删除成功'];
        } else {
            return ['code' => 0, 'msg' => '删除失败'];
        }
    }

    /**
     * 删除
     * @param $id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function delete_user($id)
    {
        $User = new Muser();
        $data = $User->where('id', $id)->find();
        if(!$data){
            return ['code' => 0, 'msg' => '数据有误,请刷新页面'];
        }
        $result = $User->userLftRgtDel($id);
        if ($result == 1) {
            return ['code' => 1, 'msg' => '删除成功'];
        } else {
            return ['code' => 0, 'msg' => '删除失败'];
        }

    }

    /**
     * 用户密码修改页面
     * @param $id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function user_change($id)
    {
        $User = new MUser();
        if (request()->isPost()) {
            $id = input('id');
            $newPassword = md5(input('post.newpassword'));
            $password = md5(input('post.password'));
            if ($newPassword !== $password) {
                $this->error('对不起两次密码不相等,请重新输入');
            } else {
                $result = $User->changePasswordPross($password, $id);
                if ($result === true) {
                    $this->success('密码修改成功');
                } else {
                    $this->error('密码修改失败');
                }
            }

        }
        $data = $User->where('id',$id)->find();
        $this->assign('data',$data);
        $this->assign('id',$id);
        return $this->fetch();
    }

    /**
     *  发送邮件页面显示
     * @param int $id
     * @return mixed
     */
    public function displayMail(int $id = 0)
    {
        $this->assign('id', $id);
        return $this->fetch();
    }

    /**
     *  发送邮件
     * @param int $user_id
     * @param string $context
     * @param string $name
     */
    public function sendMail(int $user_id = 0, $context = '', $name = '')
    {
        $result = $this->validate(
            ['name' => $name, 'context' => $context,],
            ['name' => 'require|max:15|min:4', 'context' => 'require',]);
        if (true !== $result) {
            $this->error($result);
        }
        $data = ['name' => $name, 'context' => $context, 'create_time' => date('Y-m-d H:i:s', time()), 'user_id' => $user_id];
        $Email = new \app\admin\model\Email();
        $result = $Email->insert($data);
        if ($result) {
            Gateway::$registerAddress = '192.168.4.146:1238';
            $res = [
                'id' => $user_id,
                'name' => $name,
                'context' => $context,
                'item' => []
            ];
            $data = parseSocketData('email_new', $res);
            Gateway::sendToUid($user_id, $data);
            $this->success('邮件添加成功');
        } else {
            $this->error('邮件添加失败');
        }
    }

    /**
     * 添加用户的下级用户
     * @param int $parent_id
     * @param string $nickname
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param int $status
     * @param int $lock
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add_user_subordinate($parent_id = 0, $nickname = '', $username = '', $password = '', $phone = '', $status = 1, $lock = 0)
    {
        $User = new MUser();
        if (request()->isPost()) {
            $result = $User::get(['id' => $parent_id]);
            if (!$result) {
                $this->error('上级用户id不存在,请重新输入');
            }
            $data = ['parent_id' => intval($parent_id), 'nickname' => $nickname, 'username' => $username, 'password' => $password, 'phone' => $phone, 'status' => intval($status), 'lock' => intval($lock)];
            $validate = Loader::validate('User');
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
            $nick = $User->where('nickname', $data['nickname'])->field('nickname')->find();
            if ($nick) {
                $this->error('当前输入昵称已存在,请重新输入');
            }
            $user = $User->where('username', $data['username'])->field('username')->find();
            if ($user) {
                $this->error('当前输入账号已存在,请重新输入');
            }
            $result = $User->user_subordinate($data);
            if ($result) {
                $this->error('下级用户添加成功');
            } else {
                $this->error('下级用户添加失败');
            }
        }
        return view();

    }

    /**
     *  用户邮件
     * @param $id
     * @return mixed
     */
    public function user_displayMail($id)
    {
        $this->assign('id',$id);
        return $this->fetch();
    }

    /**
     * 用户密码修改
     * @return mixed
     * @throws \think\Exception
     */
    public function change_password()
    {
        $Agent = new MUser();
        if (request()->isPost()) {
            $id = input('id');
            $newPassword = md5(input('post.newpassword'));
            $password = md5(input('post.password'));
            if ($newPassword !== $password) {
                $this->error('对不起两次密码不相等,请重新输入');
            } else {
                $result = $Agent->changePasswordPro($password, $id);
                if ($result) {
                    $this->success('密码修改成功');
                } else {
                    $this->error('密码修改失败');
                }
            }

        }
        $id = input('id');
        $result = $Agent->getUserPassword($id)->toArray();
        $this->assign('data', $result);
        return $this->fetch();
    }


    /**
     * 用户统计
     * @param string $nickname
     * @param string $username
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function userCount($nickname = '', $username = '', $start = '', $end = '')
    {
        $User = new MUser();
        $allUserBalances = $User->allUserBalances();
        if ($nickname) {
            $User->where('nickname', trim($nickname));
        }
        if ($username) {
            $User->where('username', trim($username));
        }
        if ($start && !$end) {
            $startTime = strtotime($start);
            $User->where('create_time', 'egt', $startTime);
        }
        if (!$start && $end) {
            $endTime = strtotime($end);
            $User->where('create_time', 'elt', $endTime);
        }
        if ($start && $end) {
            $startTime = strtotime($start);
            $endTime = strtotime($end);
            $User->where('create_time', 'between', [$startTime, $endTime]);
        }
        if ($nickname != '' || $username != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:window.history.back();return; false;" value="返回">');
        }

        $data = $User->where('status', 'neq', 2)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET])->each(function ($item) {
            $item->coin = $item->coin + $item->bank;
        });
        $page = $data->render();
        $this->assign('data', $data);
        $this->assign('balances', $allUserBalances);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 机器人列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function robot()
    {
        $User = new MUser();
        $result = $User->where('status', 'eq', 2)
            ->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     *  机器人添加页面
     */
    public function robot_add()
    {
        return $this->fetch();
    }

    /**
     * 机器人编辑页面渲染
     * @param int $id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function robot_edit($id = 0)
    {
        $User = new MUser();
        $data = $User->find($id);
        $this->assign('data', $data);
        return $this->fetch('robot_edit');
    }

    /**
     * 机器人编辑保存数据处理
     * @param int $id
     * @param string $nickname
     * @param string $phone
     * @param int $lock
     */
    public function robot_edit_save($id = 0, $nickname = '', $phone = '', $lock = 0)
    {
        $data = ['id' => $id, 'nickname' => $nickname, 'phone' => $phone, 'lock' => $lock];
        $validate = Loader::validate('User');
        if (!$validate->scene('robot_edit_save')->check($data)) {
            $this->error($validate->getError());
        }
        $User = new MUser();
        $result = $User->robotEditSave($data);
        if ($result) {
            $this->success('编辑成功');
        } else {
            $this->error('编辑失败,请编辑');
        }
    }

    /**
     *  机器人保存数据
     * @param string $nickname
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param int $lock
     */
    public function robot_add_save($nickname = '', $username = '', $password = '', $phone = '', $lock = 0)
    {
        $data = ['nickname' => $nickname, 'username' => $username, 'password' => md5($password), 'phone' => $phone, 'status' => 2, 'lock' => $lock, 'create_time' => date('Y-m-d H:i:s', time())];
        $validate = Loader::validate('User');
        if (!$validate->scene('robot_add')->check($data)) {
            $this->error($validate->getError());
        }
        $User = new MUser();
        $result = $User->save($data);
        if ($result) {
            $this->success('机器人添加成功');
        } else {
            $this->error('机器人添加失败');
        }

    }

    /**
     * 用户发送邮件
     * @param int $user_id
     * @param string $name
     * @param string $context
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function user_sendMail($user_id=0, $name='',$context='')
    {
        if(!is_numeric($user_id)){
            $this->error('请输入正确的用户id');
        }
        $User = new MUser();
        if(!$user_s = $User->where('id',$user_id)->find()){
            $this->error('用户不存在,请检查');
        }
        $Email = new \app\admin\model\Email();
        $data = [
            'user_id' => $user_id,
            'name' =>$name,
            'context' => $context,
            'create_time' => date('Y-m-d H:i:s',time()),
            'status' => 0
        ];
        $result = $Email->insert($data);
        if($result){
            Gateway::$registerAddress = '192.168.4.146:1238';
            $res = [
                'id' => $user_id,
                'name' => $name,
                'context' => $context,
            ];
            $data = parseSocketData('email_new', $res);
            Gateway::sendToUid($user_id, $data);
            $this->success('邮件发送成功');
        }else{
            $this->success('邮件发送失败');
        }
    }


    /**
     *  充值页面渲染
     * @param int $id
     * @return mixed
     */
    public function robot_recharge($id = 0)
    {
        $this->assign('id', $id);
        return $this->fetch();
    }

    /**
     * 金币充值数据处理
     * @param int $id
     * @param int $coin
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function robot_recharge_save($id = 0, $coin = 0)
    {
        $User = new MUser();
        if (preg_match('/^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/', $coin)) {
            $result = $User->where('id', $id)->setInc('coin', $coin);
            if ($result) {
                $ress = MUser::get($id);
                Gateway::$registerAddress = '192.168.4.146:1238';
                $res = [
                    'id' => $id,
                    'coin' => $ress->coin,
                    'nickname' => $ress->nickname,
                    'photo' => $ress->photo
                ];
                $data = parseSocketData('user_info', $res);
                Gateway::sendToUid($id, $data);
                $this->success('充值成功');
            } else {
                $this->error('充值失败');
            }
        } else {
            $this->error('金币格式不正确');
        }
    }

    /**
     *  机器人删除
     * @param int $id
     * @return array
     */
    public function robot_del($id = 0)
    {
        $User = new MUser();
        $result = $User->where('id', $id)->delete();
        if ($result) {
            return ['code' => 1, 'msg' => '机器人删除成功'];
        } else {
            return ['code' => 0, 'msg' => '机器人删除失败'];
        }
    }

    /**
     * 机器人输赢统计
     * @param string $nickname
     * @param string $game
     * @param string $action
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function robotWinOrLose($nickname = '', $game = '', $action = '')
    {
        $User = new MUser();
        $DetailLog = new DetailLog();
        if ($nickname) {
            $User->where('nickname', trim($nickname));
        }
        if ($game) {
            $Game = new \app\admin\model\GameList();
            $result = $Game->where('name', trim($game))->find();
            $DetailLog->where('game_id', $result->id);
        }
        if ($action) {
            $DetailAction = new DetailAction();
            $result = $DetailAction->where('name', trim($action))->find();
            $DetailLog->where('action_id', $result->id);
        }
        $result = $User->where('status', 2)->select()->toArray();
        $arr = [];
        foreach ($result as $v) {
            $arr[] = $v['id'];
        }
        $DetailLog = new DetailLog();
        $res = $DetailLog->where('user_id', 'in', $arr)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET])->each(function ($item) {
            $username = Db::name('user')->where('id', $item->user_id)->field('nickname')->select();
            foreach ($username as $user) {
                $item->user_id = $user['nickname'];
            }
            $gameName = Db::name('game_list')->where('id', $item->game_id)->field('name')->select();
            foreach ($gameName as $name) {
                $item->game_id = $name['name'];
            }
            $actionName = Db::name('detail_action')->where('id', $item->action_id)->field('name')->select();
            foreach ($actionName as $name) {
                $item->action_id = $name['name'];
            }
        });
        if ($nickname != '' || $game != '' || $action != '') {
            $this->assign('quick', '<a class="btn btn-warning radius" onclick="javascript:window.history.back();return; false;">返回</a>');
        }
        $this->assign('data', $res);
        return $this->fetch();
    }

    /**
     *  机器人自动充值开关
     * @return \think\response\Json
     */
    public function robot_auto_recharge_change()
    {
        $User = new MUser();
        if ($this->request->isPost()) {
            $data['id'] = $this->request->param('id');
            $data['auto'] = $this->request->param('auto');

            $data = $User->allowField(true)->update($data);
            if ($data['auto'] == 1) {
                $msg = '游戏开启成功';
                return json(['code' => 1, 'msg' => $msg]);
            } elseif ($data['auto'] == 0) {
                $msg = '游戏关闭成功';
                return json(['code' => 1, 'msg' => $msg]);
            }
        } else {
            $res['code'] = 0;
            $res['msg'] = '这是个意外！';
            return $res;
        }
    }




    /**
     * 资金日志表统计指定用户收益
     * detail_log表根据用户id统计上周一到上周日的coin之和
     * @param $id
     * @return float|int
     * @throws \think\exception\DbException
     */
    public function detailLogStatisticalUserRevenue($id)
    {
        $Detail = new DetailLog();
        list($start, $end) = Time::week();
        $thisWeekStart = date('Y-m-d H:i:s', $start);
        $thisWeekEnd = date('Y-m-d H:i:s', $end);
        $map['create_time'] = ['between', [$thisWeekStart, $thisWeekEnd]];
        $sql = $Detail->where('create_time', 'between', [$thisWeekStart, $thisWeekEnd])->buildSql();
        $data = Db::table($sql . 'a')->where('user_id', $id)->sum('coin');
        return $data;

    }

    public function daili_add($id)
    {
        $this->assign('pid',$id);
        return $this->fetch();
    }

    public function daili_save($username='',$nickname='',$password='',$phone='',$pid=0,$agent=0)
    {
        $data = ['username'=>$username,'nickname'=>$nickname,'password'=>$password,'phone'=>$phone,'pid'=>$pid];
        $validate = Loader::validate('Agent');
        if(!$validate->check($data)){
            $this->error($validate->getError());
        }
        $User = new MUser();
        $result = $User->daili_save($username,$nickname,$password,$pid,$agent,$phone);
        if($result){
            $this->error('添加失败');
        }else{
            $this->success('添加成功');
        }

    }

}