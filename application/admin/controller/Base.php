<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-8
 * Time: 10:53
 */

namespace app\admin\controller;

use think\Controller;
use think\Request;

/**
 * Class Base
 * @package app\admin\controller
 * 权限认证登录基础类
 */
class Base extends Controller
{
    public function _initialize()
    {
        //初始化判断用户是否已经登录
        if (!session('admin_id')) {
            $this->error('你还未登录请先登录', 'login/index');
        }
        $request = Request::instance();
        $con = $request->controller(); // 获取当前控制器名称
        $action = $request->action();  // 获取当前方法名称
        $rules = $con . '/' . $action;  // 组合:控制器/方法
        $auth = new Auth(); // 实例化auth类
        $notCheck = ['index/index'];  // 都可以访问的页面
        if (session('admin_id') != 1) {  // 不是超级管理员才进行权限判断(超级管理员拥有绝对权限)
            if (!in_array($rules, $notCheck)) {  // 是否在开放权限里面
                if (!$auth->check($rules, session('admin_id'))) {   // 第一个参数  控制/方法   第二个参数：当前登陆会员的id
                    $this->error('没有权限');
                };
            }
        }
        $menu=db('setting')->where('name','menu_tree')->find()['value'];
        $menu_tree = json_decode($menu,true);
        $this->assign('menu_tree', $menu_tree);
    }

}