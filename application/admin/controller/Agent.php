<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-9
 * Time: 10:51
 */

namespace app\admin\controller;

use app\admin\model\DetailLog;
use mptta\MPTTA;
use app\admin\model\Agent as Magent;
use app\admin\model\User as Muser;
use think\Config;
use think\helper\Time;
use think\Loader;

class Agent extends Base
{
    public $coin;
    public $id;

    public function index()
    {
        $Agent = new Magent();
        $propList = $Agent->where('parent_id', 0)
            ->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $propList->render();
        $this->assign('data', $propList);
        $this->assign('page', $page);
        return $this->fetch();

    }

    /**
     * 修改银行卡信息
     * @param int $id
     * @param int $aid
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit_bank_card(int $id = 0, int $aid = 0)
    {
        if ($aid == 1) {
            $User = new Muser();
            $result = $User->where('id', $id)->field('id,bank_card')->find()->toArray();
            $this->assign('data', $result);
            $this->assign('aid', $aid);
        } elseif ($aid == 0) {
            $Agent = new Magent();
            $result = $Agent->where('id', $id)->field('id,bank_card')->find()->toArray();
            $this->assign('data', $result);
            $this->assign('aid', $aid);
        }
        return $this->fetch();
    }

    /**
     *  编辑银行卡并且保存
     * @param int $id
     * @param int $aid
     * @param string $bank_card
     */
    public function edit_bank_card_save($id = 0, $aid = 0, $bank_card = '')
    {
        if ($aid == 0) {
            $Agent = new Magent();
            $result = $Agent->save(['bank_card' => $bank_card], ['id' => $id]);
            if ($result) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        } elseif ($aid == 1) {
            $User = new Muser();
            $result = $User->save(['bank_card' => $bank_card], ['id' => $id]);
            if ($result) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }


    /**
     * 代理添加
     * @param string $nickname
     * @param string $username
     * @param string $password
     * @param string $phone
     * @param int $status
     * @param int $lock
     * @return array|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add($nickname = '', $username = '', $password = '', $phone = '', $status = 1, $lock = 0)
    {
        if (request()->isAjax()) {
            $data = ['nickname' => $nickname, 'username' => $username, 'password' => $password, 'phone' => $phone, 'status' => $status, 'lock' => $lock];
            $validate = Loader::validate('Agent');
            if (!$validate->scene('agent_add')->check($data)) {
                return ['code' => 0, 'msg' => $validate->getError()];
            }
            $Agent = new Magent();
            $nick = $Agent->where('nickname', $nickname)->field('nickname')->find();
            if ($nick) {
                return ['code' => 0, 'msg' => '用户昵称已存在,请重新输入'];
            }
            $user = $Agent->where('username', $username)->field('username')->find();
            if ($user) {
                return ['code' => 0, 'msg' => '用户账号已存在,请重新输入'];
            }
            $result = $Agent->agentSave($data);
            if ($result) {
                return ['code' => 1, 'msg' => '代理添加成功'];
            } else {
                return ['code' => 0, 'msg' => '代理添加失败'];
            }
        }
        return $this->fetch();
    }

    /**
     *  代理更新页面
     * @param int $id
     * @param int $aid
     * @return mixed
     */
    public function edit(int $id = 0, int $aid = 0)
    {
        $Agent = new Magent();
        $result = $Agent->getUserInfoEdit($id, $aid);
        $this->assign('data', $result);
        $this->assign('aid', $aid);
        return $this->fetch();
    }

    /**
     *  用户代理信息保存
     * @param int $id
     * @param int $aid
     * @param string $nickname
     * @param string $username
     * @param string $phone
     * @param string $status
     * @param int $lock
     * @return array
     */
    public function editSaves($id = 0, $aid = 0, $nickname = '', $username = '', $phone = '', $status = '', $lock = 0)
    {

        if (request()->isAjax()) {
            if (empty($phone)) {
                return ['code' => 0, 'msg' => '手机号码不能为空'];
            }
            $Agent = new Magent();
            $result = $Agent->editSave($id, $aid, $nickname, $username, $phone, $status, $lock);
            if ($result) {
                return ['code' => 0, 'msg' => $result];
            } else {
                return ['code' => 1, 'msg' => '用户修改成功'];
            }
        }

    }

    /**
     *  充值页面渲染a
     * @param int $id
     * @param int $aid
     * @return mixed
     */
    public function recharge(int $id = 0, int $aid = 0)
    {
        $this->assign('id', $id);
        $this->assign('aid', $aid);
        return $this->fetch();
    }

    /**
     * 充值
     * @param int $id
     * @param int $coin
     * @param int $aid
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function rechargeSave(int $id = 0, int $coin = 0, int $aid = 0)
    {
        $User = new Muser();
        $Agent = new Magent();
        if ($aid == 1) {
            $oldCoin = $User->where('id', $id)->find()->toArray()['coin'];
            $res = $User->where('id', $id)->setInc('coin', $coin);
            if ($res) {
                $resu = $this->coinChange(['user_id' => $id, 'coin' => $coin, 'action_id' => 1, 'before_coin' => $oldCoin]);
                if ($resu <= 0) {
                    return ['code' => 0, '日志记录失败'];
                }
                return ['code' => 1, 'msg' => '充值成功'];
            } else {
                return ['code' => 0, 'msg' => '充值失败'];
            }
        }
        $agent = $Agent->where('id',$id)->find();
        $detail_data = [
            'user_id' => $id,
            'action_id' => 1,
            'coin' => $coin,
            'before_coin' => $agent->coin,
            'after_coin' => $agent->coin + $coin,
            'create_time' => date('Y-m-d H:i:s', time()),
            'info' => '充值',
            'create_ip' => request()->ip()
        ];
        db('detail_log')->insert($detail_data);
        $res = $Agent->where('id', $id)->setInc('coin', $coin);
        if ($res) {
            return ['code' => 1, 'msg' => '余额充值成功'];
        } else {
            return ['code' => 0, 'msg' => '余额充值失败'];
        }
    }

    /**
     * 修改密码
     * @param string $id
     * @param string $aid
     * @return mixed
     * @throws \think\Exception
     */
    public function changePassword($id = '', $aid = '')
    {
        $Agent = new Magent();
        if ($aid == 0) {
            $result = $Agent->getAgentPasswordInfo($id)->toArray();
            $this->assign('data', $result);
            $this->assign('aid', $aid);
            return $this->fetch();
        }
        if ($aid == 1) {
            $result = $Agent->getUserPasswordInfo($id)->toArray();
            $this->assign('data', $result);
            $this->assign('aid', $aid);
            return $this->fetch();
        }
    }

    /**
     * 修改密码保存
     * @param string $id
     * @param string $aid
     */
    public function changePasswordSave($id = '', $aid = '')
    {
        $Agent = new Magent();
        $newPassword = md5(input('post.newpassword'));
        $password = md5(input('post.password'));
        if ($newPassword !== $password) {
            $this->error('对不起两次密码不相等,请重新输入');
        } else {
            $result = $Agent->changePasswordPross($password, $id, $aid);
            if ($result) {
                $this->success('密码修改成功');
            } else {
                $this->error('密码修改失败');
            }
        }
    }

    /**
     * 逻辑删除
     * @param string $id
     * @param string $aid
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function del($id = '', $aid = '')
    {
        $Agent = new Magent();
        if ($aid == 0) {
            if ($id) {
                $result = $Agent->userLftRgtDelete($id);
                if (!$result) {
                    return ['code' => 0, 'msg' => '删除失败'];
                } else {
                    return ['code' => 1, 'msg' => '删除成功'];
                }
            } else {
                return ['code' => 0, 'msg' => '数据异常请检查'];
            }
        }
        if ($aid == 1) {
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
    }

    /**
     *  转移页面
     * @param int $id
     * @param int $aid
     * @return mixed
     */
    public function transfer($id = 0, $aid = 0)
    {
        $this->assign('data', $id);
        $this->assign('aid', $aid);
        return $this->fetch();
    }

    /**
     * 代理转移
     * @param int $id
     * @param string $name
     * @param int $aid
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function moveNode(int $id = 0, $name = '', int $aid = 0)
    {
        $Agent = new Magent();
        $mpTta = new MPTTA();
        $data = $Agent->where('id|nickname|username', 'like', $name)->field('id, lft, rgt')->find();
        if (!$data) {
            $User = new Muser();
            $data = $User->where('id|nickname|username', 'like', $name)->field('id,lft,rgt')->find();
            if (!$data) {
                $this->error('用户或者代理不存在');
            }
        }
        $row = $data->toArray();
        $pid = $row['id'];
        if ($aid == 1) {
            $User = new Muser();
            $pidUser = $User->where('id', $pid)->find();
            if ($pidUser && $aid == 1) {
                $this->error('上级不能是用户');
            }
            $result = $Agent->userMoveNode($pid, $id);
            if ($result == 1) {
                $this->success('转移成功');
            } else {
                $this->error('转移失败');
            }
        } else {
            $Agent->where('lft', 'between', [$row['lft'], $row['rgt']])->select()->toArray();
            $result = $mpTta->moveNode($pid, $id);
            if ($result == 1) {
                $this->success('转移成功');
            } else {
                $this->error('转移失败');
            }
        }
    }

    /**
     * 代理统计列表
     * @param string $nickname
     * @param string $username
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function agentStatistics($nickname = '', $username = '', $start = '', $end = '')
    {
        $Agent = new Magent();
        if ($nickname) {
            $Agent->where('nickname', trim($nickname));
        }
        if ($username) {
            $Agent->where('username', trim($username));
        }
        if ($start && !$end) {
            $startTime = strtotime($start);
            $Agent->where('create_time', '>=', $startTime);
        }
        if (!$start && $end) {
            $endTime = strtotime($end);
            $Agent->where('create_time', '<=', $endTime);
        }
        if ($start && $end) {
            $startTime = strtotime($start);
            $endTime = strtotime($end);
            $Agent->where('create_time', 'between', [$startTime, $endTime]);
        }
        if ($nickname != '' || $username != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $res = $Agent->where('parent_id', 0)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $res->render();
        $this->assign('page', $page);
        $this->assign('data', $res);
        return $this->fetch();
    }


    /**
     * 用户统计列表
     * @param string $id
     * @param string $nickname 昵称
     * @param string $username 账号
     * @param string $start 开始时间
     * @param string $end 结束时间
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function user_statistics($id = '', $nickname = '', $username = '', $start = '', $end = '')
    {
        $User = new Muser();
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
            $User->where('end', 'elt', $endTime);
        }
        if ($start && $end) {
            $startTime = strtotime($start);
            $endTime = strtotime($end);
            $User->where('create_time', 'between', [$startTime, $endTime]);
        }
        if ($nickname != '' || $username != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $sum_coin = $User->field('sum(coin) as sum_coin')->where('parent_id', $id)->select()->toArray();
        $result = $User->where('parent_id', $id)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $result->render();
        $this->assign('sum_coin', $sum_coin[0]['sum_coin']);
        $this->assign('page', $page);
        $this->assign('data', $result);
        return $this->fetch();
    }

    /**
     * 用户搜索
     * @param string $nickname
     * @param string $username
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function user_search($nickname = '', $username = '', $start = '', $end = '')
    {
        $User = new Muser();
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
            $User->where('end', 'elt', $endTime);
        }
        if ($start && $end) {
            $startTime = strtotime($start);
            $endTime = strtotime($end);
            $User->where('create_time', 'between', [$startTime, $endTime]);
        }
        if ($nickname != '' || $username != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $result = $User->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        if (!$result->items()) {
            $this->error('你搜索的数据不存在哦。。');
        }
        $page = $result->render();
        $this->assign('page', $page);
        $this->assign('data', $result);
        return $this->fetch('user_statistics');
    }

    /**
     * 查看下一级
     * @param $id
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function look_lower($id)
    {
        $Agent = new Magent();
        $res = $Agent->where('parent_id', $id)->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $res->render();
        $this->assign('page', $page);
        $this->assign('quick', "<a class='btn btn-default radius' href='/admin.php/admin/agent/agentstatistics'>返回</a>");
        $this->assign('data', $res);
        return $this->fetch('agent_statistics');
    }

    /**
     *  金币充值添加日志记录
     * @param $data
     * @return int|string
     */
    public function coinChange($data)
    {
        $DetailLog = new DetailLog();
        $result = [
            'user_id' => $data['user_id'],
            'action_id' => 1,
            'coin' => $data['coin'],
            'before_coin' => $data['before_coin'],
            'after_coin' => $data['coin'] + $data['before_coin'],
            'create_time' => date('Y-m-d H:i:s', time()),
            'info' => '充值',
            'create_ip' => request()->ip()
        ];
        $res = $DetailLog->insert($result);
        return $res;
    }

    /**
     * 获取上周下注收益
     */
    public function getLastWeekCoin()
    {
        $log = new DetailLog();
        //上周
        $datas = $log->query("select b.user_id,sum(coin) coin from (select * from detail_log where action_id=2 and YEARWEEK(date_format(create_time,'%Y-%m-%d %H:%i:%s')) = YEARWEEK(now())-1) as b GROUP BY b.user_id
");
        //昨天
//        $datas = $log->query("select b.user_id,sum(coin) coin from (SELECT * FROM `detail_log` WHERE TO_DAYS( NOW( ) ) - TO_DAYS( create_time) <= 1) as b GROUP BY b.user_id
//");
        foreach ($datas as $data) {
            $this->getAgentIncome($data['user_id']);
        }
    }


    /**
     * 计算收益
     * @param string $data_id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAgentIncome($data_id = '')
    {

        $User = new Muser();
        $DetailLog = new DetailLog();
        list($start, $end) = Time::lastWeek();
        //先找出我的直推佣金
        $direct_commission = $DetailLog->where('create_time', 'between', [date('Y-m-d H:i:s', $start), date('Y-m-d H:i:s', $end)])->where('user_id', $data_id)->where('action_id', 2)->sum('coin');
        $Agent = new Magent();
        if ($lr = $Agent->where('id', $data_id)->find()) {
            $result = $Agent->where('lft', 'between', [$lr->lft, $lr->rgt])->field('id')->select()->toArray();
            unset($result[0]);
            $array_coin = [];
            $array_coin2 = [];
            foreach ($result as $res) {
                $array_coin[] = $DetailLog->where('create_time', 'between', [date('Y-m-d H:i:s', $start), date('Y-m-d H:i:s', $end)])->where('user_id', $res['id'])->where('action_id', 2)->field('SUM(coin) as coin,user_id')->select()->toArray();
            }
            foreach ($array_coin as $a_coin) {
                if (is_array($a_coin)) {
                    foreach ($a_coin as $a) {
                        $array_coin2[] = $a['coin'];
                    }
                }
            }
            $agent_sum_coin = array_sum($array_coin2); //代理下级 上周下注总数

            $result_user = $User->where('lft', 'between', [$lr->lft, $lr->rgt])->field('id')->select()->toArray();
            $array_coin_user = [];
            $array_coin_user2 = [];
            foreach ($result_user as $res_user) {
                $array_coin_user[] = $DetailLog->where('create_time', 'between', [date('Y-m-d H:i:s', $start), date('Y-m-d H:i:s', $end)])->where('user_id', $res_user['id'])->where('action_id', 2)->field('SUM(coin) as coin,user_id')->select()->toArray();
            }
            foreach ($array_coin_user as $user_coin) {
                if (is_array($array_coin)) {
                    foreach ($user_coin as $user_coin_s) {
                        $array_coin_user2[] = $user_coin_s['coin'];
                    }
                }
            }
            $user_sum_coin = array_sum($array_coin_user2); //代理下级用户 上周下注总数
            $total_sum_coin = $agent_sum_coin + $user_sum_coin;  //自己团队总收入
            $level_total = self::zhitui($total_sum_coin);
            $team_user_coin = [];
            foreach ($result as $res_c) {
                $team_user_coin[] = $DetailLog->where('create_time', 'between', [date('Y-m-d H:i:s', $start), date('Y-m-d H:i:s', $end)])->where('user_id', $res_c['id'])->where('action_id', 2)->field('SUM(coin) as coin,user_id')->select()->toArray();
            }
            $agent_coin_all = [];
            foreach ($team_user_coin as $team_coin) {
                if (is_array($team_coin)) {
                    foreach ($team_coin as $team) {
                        $level = self::zhitui($team['coin']);
                        $a = ($level_total['level'] - $level['level']) * $level['wan'];
                        $agent_coin_all[] = $a;
                        $Agent->where('id', $team['user_id'])->setInc('coin', $a);//资金明细表操作
                    }
                }
            }

            $all_dai_all = array_sum($agent_coin_all); //代理表下级总收益 + 用户表下面的总收益
            $user_team_coin_s = [];
            foreach ($result_user as $user_team) {
                $user_team_coin_s[] = $DetailLog->where('create_time', 'between', [date('Y-m-d H:i:s', $start), date('Y-m-d H:i:s', $end)])->where('user_id', $user_team['id'])->where('action_id', 2)->field('SUM(coin) as coin,user_id')->select()->toArray();
            }
            $user_coin_all = [];
            foreach ($user_team_coin_s as $user_team_coin_v) {
                if (is_array($user_team_coin_v)) {
                    foreach ($user_team_coin_v as $team_s) {
                        $level = self::zhitui($team_s['coin']);
                        $b = ($level_total['level'] - $level['level']) * $level['wan'];
                        $user_coin_all[] = $b;
                        $User->where('id', $team_s['user_id'])->setInc('coin', $b); //资金明细写入资金明细表
                        //写入资金明细表操作
                    }
                }
            }
            $all_yong_all = array_sum($user_coin_all); //用户表下级总收益 + 代理表下面的总收益 + 自己
            $self_coin = self::zhitui($direct_commission);
            $self_zhitui = $level_total['level'] * $self_coin['wan'];  //自己的直推佣金
            $self_total_shouyi = $self_zhitui + $all_dai_all + $all_yong_all;
            $self_result = $Agent->where('id', $data_id)->setInc('coin', $self_total_shouyi);//写入明细表操作
            if ($self_result === 0) {
                $User->where('id', $data_id)->setInc('coin', $self_total_shouyi);//写入明细表操作
            }
        }


    }


    /**
     *  获取收益等级在哪个段位
     * @param $subordinate_sum
     * @return array
     */
    public function zhitui($subordinate_sum)
    {
        $level = [];
        switch (true) {
            case $subordinate_sum < 100000;
                if ($subordinate_sum < 10000) {
                    $level = [
                        'level' => 10,
                        'wan' => 1
                    ];
                } else {
                    $level = [
                        'level' => 50,
                        'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                    ];
                }
                break;
            case $subordinate_sum >= 100000 && $subordinate_sum < 300000;
                $level = [
                    'level' => 60,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 300000 && $subordinate_sum < 600000;
                $level = [
                    'level' => 70,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 600000 && $subordinate_sum < 1000000;
                $level = [
                    'level' => 80,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 1000000 && $subordinate_sum < 2000000;
                $level = [
                    'level' => 100,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 2000000 && $subordinate_sum < 4000000;
                $level = [
                    'level' => 120,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 4000000 && $subordinate_sum < 6000000;
                $level = [
                    'level' => 140,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 6000000 && $subordinate_sum < 8000000;
                $level = [
                    'level' => 160,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 8000000 && $subordinate_sum < 10000000;
                $level = [
                    'level' => 180,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
            case $subordinate_sum >= 10000000;
                $level = [
                    'level' => 200,
                    'wan' => intval($subordinate_sum >= 10000 ? $subordinate_sum / 10000 : $subordinate_sum)
                ];
                break;
        }
        return $level;
    }

}

