<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-12-21
 * Time: 11:11
 */

namespace app\admin\controller;

use app\admin\model\Level as LevelModel;
use think\Loader;

/**
 *  等级类
 * Class Level
 * @package app\admin\controller
 */
class Level extends Base
{
    /**
     * 等级列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $data = LevelModel::all();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  添加等级页面
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     *  会员级别保存
     * @param string $level_name
     * @param int $exp
     * @return array
     */
    public function level_save($level_name = '', $exp = 0)
    {
        $LevelModel = new LevelModel;
        $max_exp = $LevelModel->max('exp');
        if ($exp <= $max_exp) {
            return ['code' => 0, 'msg' => '不能低余' . $max_exp];
        }
        $result = $LevelModel->insert(['level_name' => $level_name, 'exp' => $exp ,'create_time'=>now()]);
        if($result){
            return ['code'=>1,'msg'=>'添加成功'];
        }else{
            return ['code'=>0,'msg'=>'添加失败'];
        }

    }

    /**
     * 等级删除
     * @param int $id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function del($id = 0)
    {
        $LevelModel = new LevelModel;
        $data = $LevelModel->where('id',$id)->find();
        if($data){
            $res = $LevelModel->where('id',$id)->delete();
            if($res){
                return ['code'=>1,'msg'=>'删除成功'];
            }else{
                return ['code'=>0,'msg'=>'删除失败'];
            }
        }else{
            return ['code'=>0,'msg'=>'数据有误,请刷新页面'];
        }
    }

    /**
     * 等级编辑
     * @param int $id
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function level_edit($id=0)
    {
        $data = LevelModel::get($id);
        $this->assign('data',$data);
        return $this->fetch();
    }

    /**
     *  等级更新
     * @param int $id
     * @param string $level_name
     * @param int $exp
     * @return array
     */
    public function level_update($id = 0, $level_name = '', $exp = 0)
    {
        $LevelModel = new LevelModel;
        $validate = Loader::validate('Level');
        if(!$validate->check(['level_name'=>$level_name,'exp'=>$exp])){
            return ['code'=>0,'msg'=>$validate->getError()];
        }
        $result = $LevelModel->save(['level_name'=>$level_name,'exp'=>$exp],['id'=>$id]);
        if($result !== false){
            return ['code'=>1,'msg'=>'更新成功'];
        }else{
            return ['code'=>0,'msg'=>'更新失败'];
        }


    }



}