<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 14:59
 */

namespace app\admin\model;


use think\Config;
use think\Model;

class AdminLoginLog extends Model
{
    public function admin()
    {
        return $this->hasOne('admin', 'id', 'admin_id');
    }

    public function getAdminLoginLogInfo()
    {
        $result = self::with('admin')->order('create_time desc')->paginate(Config::get('myConfig.page_num', false, ['query' => $_GET]));
        return $result;
    }
}