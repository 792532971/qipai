<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-12
 * Time: 14:37
 */

namespace app\admin\controller;

use app\admin\model\User as Muser;
use app\admin\model\DetailLog;
use app\admin\model\DetailAction as Maction;
use app\admin\model\GameList as MgameList;
use app\admin\model\GamePlayLog as MgamePlayLog;
use poker\Poker;
use think\Config;

/**
 * Class 资金明细
 * @package app\admin\controller
 */
class Detail extends Base
{

    /**
     * 资金明细数据
     * @param string $nickname
     * @param string $game
     * @param string $action
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index($nickname = '', $game = '', $action = '', $start = '', $end = '')
    {
        $DetailLog = new DetailLog();
        if ($nickname) {
            $User = new Muser();
            $data = $User->where('nickname', trim($nickname))->find();
            if ($data) {
                $id = $data->id;
                $DetailLog->where('user_id', $id);
            }
        }
        if ($game) {
            $GameList = new MgameList();
            $data = $GameList->where('name', trim($game))->find();
            if ($data) {
                $id = $data->id;
                $DetailLog->where('game_id', $id);
            }
        }
        if ($action) {
            $DetailAction = new Maction();
            $data = $DetailAction->where('name', trim($action))->find();
            if ($data) {
                $id = $data->id;
                $DetailLog->where('action_id', $id);
            }
        }
        if ($start && !$end) {
            $DetailLog->where('create_time', 'egt', $start);
        }
        if ($end && !$start) {
            $DetailLog->where('create_time', 'elt', $end);
        }
        if ($start && $end) {
            $DetailLog->where('d.create_time', 'between', [$start, $end]);
        }
        if ($nickname != '' || $game != '' || $action != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $result = $DetailLog->order('create_time desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => request()->param()]);
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
        $this->redirect('detail/index');
    }

    /**
     *  对局流水
     * @param $id
     * @return mixed
     */
    public function runningWater($id)
    {
        $User = new Muser();
        $GamePlayLogModel = new MgamePlayLog();
        $result = $GamePlayLogModel->where('room_id', $id)->find();
        if (!$result) {
            $this->error('数据有误或不存在');
        }
        $rows = json_decode($result->info, true);
        $be = array_keys($rows['bet_mul']);
        $implode = implode(',', $be);
        $exp = new \think\db\Expression("field(id,$implode)");
        $key = $User->where(['id' => ['in', $implode]])->order($exp)->select()->toArray();
        if (!$key) {
            $this->error('数据有误或不存在');
        }
        foreach ($key as $val) {
            $arra[] = $val['nickname'];
        }
        $arrays = [];
        foreach ($rows['bet_mul'] as $k => $v) {
            $arrays[] = $v;
        }
        $poker = [];
        foreach ($rows['win'] as $win) {
            $poker[] = $win['poker'];
        }
        $poker_key = array_keys($poker);
//        halt($poker_key);
        $pok_keys = $User->where('id', 'in', $poker_key)->select()->toArray();
        if ($pok_keys) {
            $this->error('数据有误');
        }
        $arr1 = [];
        foreach ($pok_keys as $ke => $value) {
            $arr1[] = $value['nickname'];
        }
        $arrayPoker = array_combine($arr1, $rows['poker']);
        $rows['poker'] = $arrayPoker;

        $array_bal = array_combine($arra, $arrays);
        $rows['bet_mul'] = $array_bal;
        $banker_name = $User->where('id', $rows['banker_id'])->field('nickname')->find();
        if (!$banker_name) {
            $this->error('数据有误或不存在');
        }
        if (!$banker_name) {
            $rows['banker_id'] = '';
        } else {
            $rows['banker_id'] = $banker_name->nickname;
        }
        $Poker = new Poker();
        foreach ($rows['poker'] as &$things) {
            if (is_array($things)) {
                foreach ($things['poker'] as $k => &$v) {
                    $v = ($Poker->indexToPoker($v)[1] != 1 ? $Poker->indexToPoker($v)[1] != 2 ? $Poker->indexToPoker($v)[1] != 3 ? "<span style='font-size: 25px;color: #F00'>♦</span>" : "<span style='font-size: 26px;color:#000'>♠</span>" : "<span style='color: #FF0000;font-size: 23px;'>♥</span>" : "<span style='font-size: 23px;color:#000'>♣</span>") . '<span style="font-size: 20px;">' . $Poker->indexToPoker($v)[2] . '</span>';
                }
            }
        }
        $this->assign('data', $rows);
        $this->assign('level', $result->level);
        return $this->fetch();
    }

    public function getGameDetails($id = 'fd43e76ec5345c9d6b82cf57e87f4de5')
    {
        $User = new Muser();
        $GamePlayLogModel = new MgamePlayLog();
        $result = $GamePlayLogModel->where('room_id', $id)->find();
        switch ($result) {
            //德州扑克
            case $result->game_id == 4:
                $data = self::TexasHold($result);
//                $nickname=$User->where('id',array_keys($data['lost'])[0])->find()->nickname;
//                $this->assign('lost',$nickname);
//                $arry = [];
//                foreach ($data['bet_num'] as $k=>$v){
//                    if(is_array($v)){
//                        $arry[] = $v;
//                    }
//                }
//                $this->assign('bet_num',$arry);
//                $this->assign('data',$data);
//                return $this->fetch();
                break;
            //炸金花
            case $result->game_id == 3:
//                self::TexasHold($result);
                break;
            //抢庄牛牛
            case $result->game_id == 2:
                echo "Number 3";
                break;
            //百人牛牛
            case $result->game_id == 1:
                echo "Number 3";
                break;
            default:
                echo "No number between 1 and 3";
        }
    }

    /**
     *  德州扑克
     * @param $result
     */
    public function TexasHold($result)
    {
        $User = new Muser();
        $data = json_decode($result->info, true);
        $user_id = array_keys($data['lost']);
        $nickname = $User->where('id', $user_id[0])->field('nickname')->find()->nickname;
        $data['lost'] = $nickname;
        $b = [];
        foreach ($data['bet_num'] as $k => &$v) {
            if (is_array($v)) {
                foreach ($v as $a => $c) {
                    $b[] = $User->where('id', $a)->field('nickname')->find()->nickname;
                }
            }
        }
        $bb = [];
        foreach ($data['bet_num'] as $k => &$v) {
            if (is_array($v)) {
                foreach ($v as $a => $c) {
                    $bb[] = $c;
                }
            }
        }
        $res = array_combine($b,$bb);
        dump($res);die;
        return json_decode($result->info, true);


    }

    /**
     * 用户下注获取上三级收益下注收益
     */
    public function betCoin()
    {
        $log = new DetailLog();
        $User = new \app\admin\model\User();
        $Agent = new \app\admin\model\Agent();
        $datas = $log->query("select b.user_id,sum(coin) coin from (select * from detail_log where action_id=2 and YEARWEEK(date_format(create_time,'%Y-%m-%d %H:%i:%s')) = YEARWEEK(now())-1) as b GROUP BY b.user_id
");
        $fees_1 = 0.01;
        $fees_2 = 0.05;
//        foreach ($datas as $data) {
//            $parent_id = $User->where('id', $data['user_id'])->find()->parent_id;
//            $agent_parent = $Agent->where('id', $parent_id)->find();
//            $agent_parent->coin += $data['coin'] * $fees_1;
//            $agent_parent->save();
//            $User->where('id', $data['user_id'])->setDec('coin', $data['coin'] * $fees_1);
//            $remain_coins = $data['coin'] - $data['coin'] * $fees_1;
//            if ($agent_parent->parent_id > 0) {
//                $agent_parent2 = $Agent->where('id', $agent_parent->parent_id)->find();
//                $agent_parent2->coin += $remain_coins * $fees_2;
//                $agent_parent2->save();
//                $User->where('id', $data['user_id'])->setDec('coin', $remain_coins * $fees_2);
//            }
//        }
        foreach ($datas as $data) {
            if (!$user = $User->where('id', $data['user_id'])->find()) { //d代理处理
                $Agent = $Agent->where('id', $data['user_id'])->find();
                if (!is_null($parent_id = $Agent['parent_id'])) {
                    $coin = $data['coin'] * $fees_1;
                    $coin2 = $fees_2 * $coin;
                    $con3 = $coin - $coin2;
                    if ($parent_agent = db('agent')->where('id', $parent_id)->find()) {
                        db('agent')->where('id', $parent_id)->setInc('coin', $con3);
                        db('agent')->where('id', $data['user_id'])->setDec('coin', $coin);
                        if ($parent_agent['parent_id'] > 0) {
                            if ($parent_agent2 = db('agent')->where('id', $parent_agent['parent_id'])->find()) {
                                db('agent')->where('id', $parent_agent['parent_id'])->setInc('coin', $coin2);
                            }
                        }
                    }
                }
            }
            //用户处理
            if ($user['parent_id'] > 0) {
                if (!is_null($agent_daili = \app\admin\model\Agent::get($user['parent_id']))) {
                    $coin = $data['coin'] * $fees_1;
                    $coin2 = $coin * $fees_2;
                    $con3 = $coin - $coin2;
                    db('agent')->where('id', $user['parent_id'])->setInc('coin', $con3);
                    db('user')->where('id', $data['user_id'])->setDec('coin', $coin);
                    if ($agent_daili->parent_id > 0) {
                        if ($agent_dai = db('agent')->where('id', $agent_daili->parent_id)->find()) {
                            db('agent')->where('id', $agent_daili->parent_id)->setInc('coin', $coin2);
                        }
                    }
                }
            }
        }

    }

}