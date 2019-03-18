<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-12-4
 * Time: 14:51
 */

namespace app\admin\controller;


use think\Controller;
use think\Db;
use \app\admin\model\User as Muser;

class Order extends Base
{
    public function index()
    {
        $Order = new \app\admin\model\Order();
        $data = $Order->select();
        $this->assign('data',$data);
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    /**
     *  数据提交
     * @param string $amount
     */
    public function check($amount='')
    {
        $account_id='1000000';
        $trade_no = date("YmdHis") . mt_rand(10000,99999);  //订单号
        $callback_url = 'http://192.168.4.109/admin.php/admin/order/call';
        $success_url = 'http://www.baidu.com';
        $error_url = 'http://www.baidu.com';
        $sign = md5("bb17fbb7c1393e2fd2157bbd4be29760&amount={$amount}&trade_no={$trade_no}");
        $data = [
            'user_id'=>session('admin_id'),
            'trade_no'=>$trade_no,
        ];
        Db::table('order')->insert($data);
        header("location:http://test.pay.cn:86/api/order/create?sign={$sign}&account_id={$account_id}&amount={$amount}&trade_no={$trade_no}&callback_url={$callback_url}&success_url={$success_url}&error_url={$error_url}");

    }

    /**
     * 回调
     * @param string $sign
     * @param string $amount
     * @param string $trade_no
     * @param string $order_id
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function call($sign='',$amount='',$trade_no='',$order_id = '')
    {
        $sys_sign = $this->sign('bb17fbb7c1393e2fd2157bbd4be29760', [
            'amount' => $amount,
            'order_id' => $order_id,
            'trade_no' => $trade_no
        ]);
        if($sys_sign != $sign){
            return '验签失败';
        }
        if(!$result = Db::table('order')->where('trade_no',$trade_no)->find()){
            return '数据有误';
        }
        Db::table('admin')->where('id',$result['user_id'])->setInc('coin',$amount);

    }

    public function charge()
    {
        return $this->fetch();
    }

    function sign($key, $param)
    {
        ksort($param);
        $paramArr = [];
        foreach ($param as $k => $v) {
            $paramArr[] = $k . '=' . $v;
        }
        $sign_str = $key . "&" . implode('&', $paramArr);
        $sign = md5($sign_str);
        return $sign;
    }

}