<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-11-6
 * Time: 17:56
 */

namespace app\admin\controller;

use app\admin\model\TopInfo as TopInfoModel;
use think\Config;

class TopInfo extends Base
{

    /**
     * 顶部浮动消息列表首页
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $TopInfo = new TopInfoModel();
        $result = $TopInfo->order('id desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     *  浮动消息删除
     * @param $id
     * @return array
     */
    public function del($id)
    {
        $TopInfo = new TopInfoModel();
        if (empty($id)) {
            return ['code' => 0, 'msg' => '数据有误'];
        }
        $res = $TopInfo->where('id', $id)->delete();
        if ($res) {
            return ['code' => 1, 'msg' => '删除成功'];
        } else {
            return ['code' => 0, 'msg' => '删除失败'];
        }
    }

    /**
     *  浮动消息添加页面
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     *  顶部浮动消息保存
     * @param int $type
     * @param string $information
     * @return array
     */
    public function info_save($type=0, $information='')
    {
        $TopInfo = new TopInfoModel();
        if(empty($information)){
            return ['code'=>0,'msg'=>'不能是空哦'];
        }
        $result = $TopInfo->save(['type'=>$type,'information'=>$information,'create_time'=>date('Y-m-d H:i:s',time())]);
        if($result){
            return ['code'=>1,'msg'=>'添加成功'];
        }else{
            return ['code'=>0,'msg'=>'添加失败'];
        }
    }

}