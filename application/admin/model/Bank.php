<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-16
 * Time: 14:09
 */

namespace app\admin\model;


use think\Model;

class Bank extends Model
{
    static function getByUserId($id)
    {
        $data = self::where('user_id',$id)->find();
        return $data;
    }

}