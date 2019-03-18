<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-12-12
 * Time: 11:28
 */

namespace app\admin\validate;


use think\Validate;

class Agent extends Validate
{
    protected $rule = [
        'nickname' => 'require|length:2,16|unique:agent',
        'username' => 'require|chsDash|unique:agent',
        'password' => 'require|min:6',
        'phone' => 'require|checkIsMobile'
    ];

    protected $message = [
        'nickname.require' => '昵称不能为空！',
        'nickname.unique' => '昵称已存在！',
        'nickname.length:2,16' => '昵称长度不正确',
        'username.require' => '账号不能为空!',
        'username.unique' => '账号已存在!',
        'password.require' => '密码不能为空',
        'password.min' => '管理员密码不能少于6位！',
        'phone.require' => '手机号码不能为空',
        'phone.checkIsMobile' => '手机号码不正确',
        'nickname.chsAlpha' => '昵称只能是字母加汉字',
        'username.chsDash' => '只能是汉字、字母、数字和下划线_及破折号-',
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
}