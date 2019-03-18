<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-9-30
 * Time: 14:26
 */

namespace app\admin\validate;


use think\Validate;

class UserYh extends Validate
{
    protected $rule = [
        'nickname' => 'require',
        'phone' => 'require|checkIsMobile'
    ];

    protected $message = [
        'nickname.require' => '昵称不能是空',
        'phone' => '手机号不能是空',
        'phone.checkIsMobile' => '手机号格式不正确'
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