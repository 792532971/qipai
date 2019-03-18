<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 12:53
 */

namespace app\admin\controller;

use app\admin\model\LoginLog as MloginLog;
use think\Config;

/**
 * Class LoginLog
 * @package app\admin\controller
 *用户日志类
 */
class LoginLog extends Base
{
    /**
     * 用户登录日志
     * @param string $nickname
     * @param string $startTime
     * @param string $endTime
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index($nickname='',$startTime='',$endTime='')
    {
        $LoginLog = new MloginLog();
        if($nickname){
            $User = new \app\admin\model\User();
            $user_s = $User->where('nickname',trim($nickname))->find();
            $LoginLog->where('user_id',$user_s->id);
        }
        if($startTime){
            $LoginLog->where('create_time','>=',$startTime);
        }
        if($endTime){
            $LoginLog->where('create_time','<=',$endTime);
        }
        if($endTime!='' || $startTime ){
            $LoginLog->where('create_time','between',[$startTime,$endTime]);
        }
        if($nickname !='' || $startTime!='' || $endTime!=''){
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onClick="javascript:window.history.back();return false;" value="返回">');
        }

        $result = $LoginLog->order('create_time desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch('login_log');
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('login_log/index');
    }

    public function clearLoginLog()
    {
        $LoginLog = new MloginLog();
        $days = date(strtotime("-7 day"));
        $result = $LoginLog->where('create_time', '<=', $days)->delete();
        if ($result) {
            $this->success('日志清楚成功', 'login_log/index');
        } else {
            $this->error('不存在七天前登录日志');
        }
    }


}