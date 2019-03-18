<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-12-28
 * Time: 14:50
 */

namespace app\admin\controller;

use app\admin\model\LotteryCate;
use app\admin\model\LotteryHigh;
use app\admin\model\LotteryLog;
use app\admin\model\Lottery as LotteryModel;
use app\admin\model\LotteryMiddle;
use think\Config;
use think\helper\Time;
use think\Validate;


/**
 *  大转盘抽奖类
 * Class Lottery
 * @package app\admin\controller
 */
class Lottery extends Base
{
    /**
     * 抽奖栏目
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function cate()
    {
        $data = LotteryCate::all();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  大转盘状态改变
     * @param int $id
     * @param int $status
     * @return \think\response\Json
     */
    public function changeShow($id = 0, $status = 0)
    {
        $LotteryCate = new LotteryCate();
        if ($this->request->isPost()) {
            $data['id'] = $id;
            $data['status'] = $status;
            $data = $LotteryCate->allowField(true)->update($data);
            if ($data['status'] == 1) {
                $msg = '游戏开启成功';
                return json(['code' => 1, 'msg' => $msg]);
            } elseif ($data['status'] == 0) {
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
     * 转盘编辑
     */
    public function lottery_edit($id)
    {
        $data = LotteryCate::get($id);
        $this->assign('data', $data);
        return $this->fetch();
    }

    public function lotteryEditSave($id = 0, $lottery_name = '', $req_exp = 0)
    {

        $validate = new Validate([
            'lottery_name' => 'require|length:3,6',
            'req_exp' => 'require|min:1|max:10000'
        ]);
        $data = [
            'lottery_name' => $lottery_name,
            'req_exp' => $req_exp
        ];
        if (!$validate->check($data)) {
            return json(['code' => 0, 'msg' => $validate->getError()]);
        }

        $LotteryCate = new LotteryCate();

        if (!$data_s = $LotteryCate->where('id', $id)->find()) {
            return json(['code' => 0, 'msg' => '数据有误请检查']);
        }
        if (!is_null($m_cate = $LotteryCate->where('id', '>', $id)->limit(1)->find())) {
            if ($req_exp >= $m_cate->req_exp) {
                return json(['code' => 0, 'msg' => '不能大于' . $m_cate->lottery_name . '(' . $m_cate->req_exp . ')']);
            }
        }
        if (!is_null($x_cate = $LotteryCate->where('id', '<', $id)->limit(1)->find())) {
            if ($req_exp <= $x_cate->req_exp) {
                return json(['code' => 0, 'msg' => '不能小于' . $x_cate->lottery_name . '(' . $x_cate->req_exp . ')']);
            }
        }
        $data_s->lottery_name = $lottery_name;
        $data_s->req_exp = $req_exp;
        $res = $data_s->save();
        if ($res) {
            return json(['code' => 1, 'msg' => '编辑成功']);
        } else {
            return json(['code' => 0, 'msg' => '编辑失败']);
        }

    }

    /**
     * lottery配置
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function setting()
    {
        $LotteryPrimary = (new LotteryModel())->select();
        foreach ($LotteryPrimary as $k => &$v) {
            $v->pro = floatval($v->pro);
        }
        $LotteryMiddle = (new LotteryMiddle())->select();
        foreach ($LotteryMiddle as $k => &$v) {
            $v->pro = floatval($v->pro);
        }
        $LotteryHigh = (new LotteryHigh())->select();
        foreach ($LotteryHigh as $k => &$v) {
            $v->pro = floatval($v->pro);
        }
        $this->assign('lottery_pri', $LotteryPrimary);
        $this->assign('lottery_mid', $LotteryMiddle);
        $this->assign('lottery_hig', $LotteryHigh);
        return $this->fetch();
    }

    /**
     * 渲染转盘配置页面
     * @param $id
     * @param $lev
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function lottery_setting($id, $lev)
    {
        $Lottery = new LotteryModel();
        $sql = $Lottery->tableN($lev);
        $data = $sql->where('id', $id)->find();
        $this->assign('data', $data);
        $this->assign('lev', $lev);
        return $this->fetch();
    }

    /**
     * 配置编辑保存
     * @param int $id
     * @param int $pro
     * @param int $num
     * @param string $prize_name
     * @param int $lev
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function settingEditSave(int $id = 0, int $pro = 0, int $num = 0, string $prize_name = '', int $lev = 0)
    {
        if (!preg_match('/^([1-9]\d*|0)(\.\d{1,2})?$/', $pro)) {
            return json(['code' => 0, 'msg' => '请输入正确的概率']);
        }
        $validate = new Validate([
            'num' => 'require|number|max:9999',
//            'prize_name' => 'require|length:2,18'  //TODO:名称验证
        ]);
        $data = [
            'num' => $num,
//            'prize_name' => $prize_name
        ];
        if (!$validate->check($data)) {
            return json(['code' => 0, 'msg' => $validate->getError()]);
        }
        $Lottery = new LotteryModel();
        $sql = $Lottery->tableN($lev);
        $self_pro = $sql->where('id', $id)->find();  //自己的概率
        //剩余的概率
        $last_pro = 100 - $self_pro->pro;
        $total = $pro + $last_pro;
        if ($total > 100) {
            return json(['code' => 0, 'msg' => '概率不能大于100%']);
        }
        $self_pro->pro = $pro;
        $self_pro->num = $num;
        $self_pro->prize_name = $prize_name;
        $result = $self_pro->save();
        if ($result) {
            return json(['code' => 1, 'msg' => '更新成功']);
        } else {
            return json(['code' => 0, 'msg' => '更新失败']);
        }

    }

    /**
     * 抽奖记录
     * @param int $user_id
     * @param string $startTime
     * @param string $endTime
     * @param int $lottery_cate
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function record($user_id = 0, $startTime = '', $endTime = '', $lottery_cate = 0)
    {
        $LotteryLog = new LotteryLog();
        list($start, $end) = Time::today();
        if ($user_id > 0) {
            $LotteryLog->where('user_id', $user_id);
            $data = LotteryLog::get_user_sum($user_id);
            $this->assign('user_s', $data);  //总扣除经验
        }
        if ($lottery_cate > 0) {
            $LotteryLog->where('type', $lottery_cate);
        }
        if (!empty($startTime)) {
            $LotteryLog->whereTime('create_time', '>=', $startTime);
        }
        if (!empty($endTime)) {
            $LotteryLog->whereTime('create_time', '<', $endTime);
        }
        if (!empty($startTime) || !empty($endTime) || $user_id > 0 || $lottery_cate > 0) {
            $this->assign('quick', '<a class="btn btn-default radius" href="/admin.php/admin/lottery/record">返回</a>');
        }
        $data = $LotteryLog->order('id desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $data->render();
        $today_exp = db('lottery_log')->whereTime('create_time', 'between', [$start, $end])->sum('exp');
        $LotteryCate = LotteryCate::all();
        $this->assign('lottery_cate', $LotteryCate);
        $this->assign('today_exp', $today_exp);
        $this->assign('data', $data);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 删除指定记录
     * @param int $id
     * @return \think\response\Json
     * @throws \think\exception\DbException
     */
    public function delete(int $id)
    {
        if (!$col = LotteryLog::get($id)) {
            return json(['code' => 0, 'msg' => '数据有误,或不存在请检查']);
        }
        LotteryLog::destroy($id);
        return json(['code' => 1, 'msg' => '删除成功']);

    }

    /**
     *  批量删除抽奖记录
     * @return \think\response\Json
     */
    public function batch_deletion()
    {
        $ids = input('ids/a');
        $result = LotteryLog::checkDel($ids);
        if ($result) {
            return json(['code' => 1, 'msg' => '删除成功']);
        } else {
            return json(['code' => 0, 'msg' => '删除失败']);
        }
    }


}