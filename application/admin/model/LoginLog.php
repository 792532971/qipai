<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 11:58
 */

namespace app\admin\model;


use think\Model;

class LoginLog extends Model
{
    public function user()
    {
        return $this->hasOne('User', 'id', 'user_id');
    }

    /**
     * 获取用户信息
     */
    public function getLogingLogInfo()
    {
        $result = $this->with('user')->order('create_time desc')->paginate(10);
        return $result;

    }
}