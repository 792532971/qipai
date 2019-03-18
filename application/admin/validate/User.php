<?php

namespace app\admin\validate;

use \think\Validate;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-6
 * Time: 9:37
 */
class User extends Validate
{
    protected $rule = [
        'username' => 'require|chsDash|unique:user',
        'nickname' => 'require|length:2,16',
        'password' => 'require|length:6,12',
        'phone' => 'require|checkIsMobile'
    ];

    protected $message = [
        'nickname.require' => '昵称不能为空！',
        'username.require' => '账号不能为空!',
        'password.require' => '密码不能为空',
        'password.length' => '管理员密码6-12位！',
        'phone.require' => '手机号码不能为空',
        'phone.checkIsMobile' => '手机号码不正确',
        'nickname.length' => '长度不正确',
        'username.chsDash' => '只能是汉字、字母、数字和下划线_及破折号-',
        'username.unique' => '用户账号已存在'
    ];


    protected function checkIsMobile($value)
    {
        $rule = '/^0?(13|14|15|17|18)[0-9]{9}$/';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    protected $scene = [
        'robot_add' => ['username' => 'require|min:4|max:12', 'nickname' => 'require|length:2,16', 'password', 'phone'],
        'robot_edit_save' => ['nickname', 'phone'],
        'designated_user_save' => ['nickname', 'username', 'password', 'phone', 'id' => 'require'],
    ];
}