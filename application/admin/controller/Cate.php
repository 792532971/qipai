<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-10
 * Time: 15:57
 */

namespace app\admin\controller;


use app\admin\model\ArticleCate as ArticleM;
use think\Controller;

/**
 * Class Cate
 * @package app\admin\controller
 * 文章分类类
 */
class Cate extends Base
{
    public function index()
    {
        $ArticleCate = new ArticleM();
        $ArticleCates = $ArticleCate->getArticleCate()->toArray();
        $this->assign('data', $ArticleCates);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('cate/index');
    }

    /**
     *  添加分类
     * @param string $catename
     * @return mixed
     */
    public function add(string $catename = '')
    {
        if (request()->isAjax()) {
            $ArticleCate = new ArticleM();
            $result = $ArticleCate->saveCate($catename);
            if ($result) {
                return ['code' => 1, 'msg' => '分类添加成功'];
            } else {
                return ['code' => 0, 'msg' => '分类添加失败'];
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑分类
     * @param int $id
     * @param string $catename
     * @return array|mixed
     * @throws \think\Exception
     */
    public function edit(int $id, string $catename = '')
    {
        $ArticleCate = new ArticleM();
        if (request()->isAjax()) {
            $result = $ArticleCate->ArticleCateSave($id, $catename);
            if ($result !== false) {
                $this->success('数据更新成功');
                return ['code' => 1, 'msg' => '数据更新成功'];
            } else {
                $this->error('数据更新失败,请检查数据');
                return ['code' => 0, 'msg' => '数据更新失败,请检查数据'];
            }
        }
        $result = $ArticleCate->getCateInfo($id)->toArray();
        $this->assign('data', $result);
        return $this->fetch();
    }

    /**
     *  删除分类
     * @param int $id
     * @return \think\response\Json
     */
    public function del(int $id)
    {
        $ArticleCate = new ArticleM();
        $result = $ArticleCate->CateDel($id);
        if ($result) {
            return json(['code' => 0, 'msg' => '删除成功']);
        } else {
            return json((['code' => 1, 'msg' => '删除失败']));
        }

    }
}