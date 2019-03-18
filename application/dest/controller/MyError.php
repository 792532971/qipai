<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-11
 * Time: 9:55
 */

namespace app\dest\controller;


use think\Controller;

class MyError extends Controller
{
    public function index()
    {
        $this->error('操作有误','dest/index/index');
    }
}