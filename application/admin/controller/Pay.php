<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-12-4
 * Time: 14:36
 */

namespace app\admin\controller;


class Pay extends Base
{
    public function index()
    {
        return $this->fetch('pay');
    }
}