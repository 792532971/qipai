<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-5
 * Time: 17:24
 */

namespace app\admin\controller;

use app\admin\model\AdminLoginLog;
use app\admin\model\AuthGroup;
use app\admin\model\Admin as AdminModel;
use think\Config;
use think\Db;
use think\helper\Time;
use think\Loader;

/**
 * Class Admin
 * @package app\admin\controller
 * 管理员控制器类
 */
class Admin extends Base
{


    /**
     * 管理员列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $Admin = new AdminModel();
        $adminRes = $Admin->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $this->assign('data', $adminRes);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('admin/index');
    }

    /**
     * 管理员添加
     * @param string $username
     * @param string $password
     * @param int $sex
     * @param string $mobile
     * @param string $email
     * @param int $groupid
     * @param string $note
     * @return array|mixed
     */
    public function add($username = '', $password = '', $sex = 0, $mobile = '', $email = '', $groupid = 0, $note = '')
    {

        if (request()->isAjax()) {
            $data = ['username' => $username, 'password' => $password, 'sex' => $sex, 'mobile' => $mobile, 'email' => $email, 'groupid' => $groupid, 'note' => $note];
            $validate = validate('Admin');
            if (!$validate->check($data)) {
                return ['code' => 0, 'msg' => $validate->getError()];
            }
            $data['password'] = md5($data['password']);
            $data['create_time'] = date('Y-m-d H:i:s', time());
            $add = Db::table('admin')->insertGetId($data);
            $_data = [];
            $_data['uid'] = $add;
            $_data['group_id'] = $data['groupid'];
            $addGroupAccess = Db::table('auth_group_access')->insert($_data);
            if ($add && $addGroupAccess) {
                return ['code' => 1, 'msg' => '添加管理员成功'];
            } else {
                return ['code' => 0, 'msg' => '添加管理员失败'];
            }
        }
        //所属用户组
        $group = new AuthGroup();
        $groupInfo = $group->getGroupInfo();
        $this->assign('role', $groupInfo);
        return $this->fetch();
    }


    /**
     *  管理员编辑
     * @param string $id
     * @param string $username
     * @param string $mobile
     * @param string $email
     * @param int $groupid
     * @param string $note
     * @return mixed
     */
    public function edit($id = '', $username = '', $mobile = '', $email = '', $groupid = 0, $note = '')
    {
        if (request()->isAjax()) {
            $Admin = new AdminModel();
            $data = ['id' => $id, 'username' => $username, 'mobile' => $mobile, 'email' => $email, 'groupid' => $groupid, 'note' => $note];
            if(session('admin')->username != 'admin' && $data['username'] == 'admin'){
                return ['code'=>0,'msg'=>'管理员不允许修改'];
            }
            $validate = Loader::validate('Admin');
            if (!$validate->scene('edit')->check($data)) {
                $this->error($validate->getError());
            }
            $result = $Admin->editUserInfo($id, $username, $mobile, $email, $groupid, $note);
            if ($result) {
                return ['code' => 1, 'msg' => '编辑成功'];
            } else {
                return ['code' => 0, 'msg' => '编辑失败'];
            }
        } else {
            $group = new AuthGroup();
            $groupInfo = $group->getGroupInfo();
            $User = new AdminModel();
            $result = $User->getUserInfoOne($id);
            $this->assign('role', $groupInfo);
            $this->assign('data', $result);
            return $this->fetch();
        }
    }

    /**
     * 管理员删除
     * @param int $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del(int $id)
    {
        if ($id === 1) {
            return json(['code' => 3, 'msg' => '超级管理员不允许删除']);
        }
        $result = Db::table('admin')->where('id', 'eq', $id)->delete();
        if ($result) {
            return json(['code' => 0, 'msg' => '管理员删除成功']);
        } else {
            return json(['code' => 1, 'msg' => '管理员删除失败']);
        }

    }

    /**
     * 管理员登录日志
     * @param string $username
     * @param string $startTime
     * @param string $endTime
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function loginlog($username = '', $startTime='',$endTime='')
    {
        $Admin = new AdminLoginLog();
        if($username){
            $Admin_u = new AdminModel();
            $admin_user = $Admin_u->where('username',trim($username))->find();
            $Admin->where('admin_id',$admin_user->id);
        }
        if($startTime){
            $Admin->where('create_time','>=',$startTime);
        }
        if($endTime){
            $Admin->where('create_time','<=',$startTime);
        }
        if($startTime && $endTime){
            $Admin->where('create_time','between',[$startTime,$endTime]);
        }
        if($username != '' || $startTime!='' || $endTime!=''){
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onClick="javascript:window.history.back();return false;" value="返回">');
        }
        $result = $Admin->order('create_time desc')->paginate(10,false,['query'=>$_GET]);
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }


    /**
     * 清理管理员7天前登录日志
     */
    public function clearAdminLog()
    {
//        $seven_days_ago_strtotime = Time::daysAgo(7);
//        $seven_days_ago = date('Y-m-d H:i:s',$seven_days_ago_strtotime);
        $Admin = new AdminLoginLog();
        $result = $Admin->execute("delete From `admin_login_log` where DATE(create_time) <= DATE(DATE_SUB(NOW(),INTERVAL 7 day))");
        if ($result) {
            return ['code' => 1, 'msg' => '日志清除成功'];
        } else {
            return ['code' => 0, 'msg' => '不存在七天前登录日志'];
        }

    }


    /**
     *  管理员密码修改页面
     * @param $id
     * @return mixed
     */
    public function adminChangePasswords($id)
    {
        $this->assign('id', $id);
        return $this->fetch();
    }

    /**
     * 管理员密码更新
     * @param string $id
     * @param string $password
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminChangePasswordSave($id = '', $password = '')
    {

        $Admin = new AdminModel();
        if (mb_strlen($password) < 6 || mb_strlen($password) > 12) {
            return ['code' => 0, 'msg' => '密码长度必须大于6位数小于12位'];
        }
        $passwords = md5($password);
        $password_com = $Admin->where('id', $id)->field('password')->find();
        if ($passwords === $password_com->password) {
            $this->error('新密码不能和旧密码相同');
            return ['code' => 0, 'msg' => '新密码不能和旧密码相同'];
        }
        $result = $Admin->changeAdminPassword($id, $passwords);
        if ($result) {
            return ['code' => 1, 'msg' => '管理员密码更新成功'];
        } else {
            return ['code' => 0, 'msg' => '管理员密码更新失败'];
        }
    }

}