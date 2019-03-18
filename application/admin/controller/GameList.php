<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-12
 * Time: 11:23
 */

namespace app\admin\controller;

use \app\admin\model\GameList as GModel;
use think\Config;

/**
 *  游戏列表处理类
 * Class GameList
 * @package app\admin\controller
 */
class GameList extends Base
{
    /**
     * 主页数据渲染
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $GameList = new GModel();
        $result = $GameList->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $result->render();
        $this->assign('data', $result);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 修改配置页面
     * @param string $id
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function changeSetting($id = '')
    {
        $GameList = new GModel();
        $data = $GameList->field('setting')->where('id', $id)->find()->toArray();
        $this->assign('data', $data);
        $this->assign('id', $id);
        return $this->fetch();
    }

    /**
     * 配置数据处理
     * @param string $id
     * @param string $setting
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function changeSettingSave($id = '', $setting = '')
    {
        $GameList = new GModel();
        $res = $GameList->where('id', $id)->field('setting')->find()->toArray()['setting'];
        if ($setting == $res) {
            return ['code' => 0, 'msg' => '配置相同,请重新输入'];
        }
        $result = $GameList->settingUpdate($id, $setting);
        if ($result) {
            $this->success('配置编辑成功');
            return ['code' => 1, 'msg' => '配置编辑成功'];
        } else {
            return ['code' => 0, 'msg' => '配置编辑失败'];
        }
    }

    /**
     * 游戏开关
     * @return \think\response\Json
     */
    public function changeShow()
    {
        $GameList = new GModel();
        if ($this->request->isPost()) {
            $data['id'] = $this->request->param('id');
            $data['status'] = $this->request->param('status');

            $data = $GameList->allowField(true)->update($data);
            if ($data['status'] == 1) {
                $msg = '游戏开启成功';
                return json(['code' => 1, 'msg' => $msg]);
            } elseif ($data['status'] == 0) {
                $msg = '游戏关闭成功';
                return json(['code' => 1, 'msg' => $msg]);
            }
        } else {
            $res['code'] = 0;
            $res['msg'] = '这是个意外！';
            return $res;
        }
    }
}