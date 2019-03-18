<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 16:36
 */

namespace app\admin\controller;

//use GatewayClient\Gateway;
use app\admin\model\Email as EmailModel;
use GatewayClient\Gateway;

/**
 * Class Email
 * @package app\admin\controller
 * 邮件处理类
 */
class Email extends Base
{

    /**
     * @return mixed
     * 邮件列表首页
     */
    public function index()
    {
        $Email = new EmailModel();
        $result = $Email->getEmailInfo();
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('email/index');
    }

    /**
     *  邮件添加处理
     * @param string $user_id
     * @param string $context
     * @param string $name
     * @param int $status
     * @return mixed
     */
    public function add($user_id = '', string $context = '', $name = '', $status = 0)
    {
        if (request()->isPost()) {
            if (!is_numeric($user_id)) {
                $this->error('请输入正确的用户id');
            }
            if (!$name) {
//                return ['code' => 0, 'msg' => '请输入标题'];
                $this->error('请输入标题');
            }
            $Email = new EmailModel();
            $result = $Email->saveEmailData($user_id, $context, $name);
            if ($result === 1) {
//                return ['code' => 0, 'msg' => '对不起用户不存在,请检查!'];
                $this->error('对不起用户不存在,请检查!');
            }
            if ($result !== true) {
//                return ['code' => 0, 'msg' => '邮件添加失败,请输入正确信息!'];
                $this->error('邮件添加失败,请输入正确信息!');
            } else {
//                Gateway::$registerAddress = '192.168.4.146:1238';
//                $res = [
//                    'id' => $user_id,
//                    'name' => $name,
//                    'status' => $status,
//                    'context' => $context,
//                    'item' => []
//                ];
//                $data = parseSocketData('email_new', $res);
//                Gateway::sendToUid($user_id, $data);
////                return ['code' => 1, 'msg' => '邮件添加成功'];
                $this->success('邮件添加成功');
//                return json(['data'=>$res]);
            }
        }
        return $this->fetch();
    }

    /**
     *  邮件编辑处理
     * @param string $id
     * @param string $user_id
     * @param string $context
     * @param int $status
     * @return mixed
     */
    public function edit($id = '', $user_id = '', $context = '', $status = 0)
    {
        $Email = new EmailModel();
        if (request()->isAjax()) {
            $result = $Email->editDataSave($id, $user_id, $context, $status);
            if ($result === 1) {
                return ['code' => 0, 'msg' => '对不起用户不存在,请重新输入'];
            }
            if ($result === false) {
                return ['code' => 0, 'msg' => '邮件更新失败'];
            } else {
                return ['code' => 1, 'msg' => '邮件更新成功'];
            }
        }

        $result = $Email->getEditData($id);
        if ($result === false) {
            $this->error('对不起,数据不存在,请刷新页面');
        }
        $this->assign('data', $result);
        return $this->fetch();
    }

    /**
     *  邮件删除处理
     * @param $id
     * @return \think\response\Json
     */
    public function del($id)
    {
        $Email = new EmailModel();
        $result = $Email->emailDel($id);
        if ($result === false) {
            return json(['code' => 0, 'msg' => '数据删除失败,请检查']);
        } else {
            return json(['code' => 1, 'msg' => '数据删除成功']);
        }

    }

}