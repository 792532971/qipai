<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 15:23
 */

namespace app\admin\controller;

use app\admin\model\Suggest as SuggestModel;

/**
 * Class Suggest
 * 用户反馈类
 * @package app\admin\controller
 */
class Suggest extends Base
{
    /**
     * @return mixed
     * 渲染反馈列表
     */
    public function index()
    {
        $Suggest = new SuggestModel();
        $data = $Suggest->getSuggestInfo();
        $page = $data->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * @return \think\response\Json
     * 根据id删除反馈列
     */
    public function del($id)
    {
        $Suggest = new SuggestModel();
        $result = $Suggest->suggestDel($id);
        if ($result) {
            return json(['code' => 1, 'msg' => '删除成功']);
        } else {
            return json(['code' => 0, 'msg' => '删除失败']);
        }
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('suggest/index');
    }

    /**
     * @return \think\response\Json
     * 接受checkbox选中批量删除
     */
    public function checkboxdel()
    {
        $checks = input('ids/a');
        $ids = implode(",", $checks);
        $Suggest = new SuggestModel();
        $result = $Suggest->checkDel($ids);
        if ($result) {
            return json(['code' => 1, 'msg' => '删除成功']);
        } else {
            return json(['code' => 0, 'msg' => '删除失败']);
        }
    }

}