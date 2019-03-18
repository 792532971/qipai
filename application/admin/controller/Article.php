<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-8
 * Time: 11:23
 */

namespace app\admin\controller;


use app\admin\model\ArticleCate;
use app\admin\model\ArticleList;
use think\Config;

/**
 * Class Article
 * @package app\admin\controller
 * 文章控制器
 */
class Article extends Base
{
    /**
     * 文章列表显示
     * @param string $title
     * @param string $cate
     * @param int $status
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function index($title = '', $cate = '', $status = 0, $start = '', $end = '')
    {
        $Article = new ArticleList();
        if ($title) {
            $Article->where('title', trim($title));
        }
        if ($status) {
            $Article->where('status', $status);
        }
        if ($cate) {
            $data = ArticleCate::get(['catename' => trim($cate)])->toArray()['id'];
            $Article->where('cate_id', $data);
        }
        if ($cate && $status) {
            $data = ArticleCate::get(['catename' => trim($cate)])->toArray()['id'];
            $Article->where('cate_id', $data)->where('status', $status);
        }
        if ($start && !$end) {
            $startTime = strtotime($start);
            $Article->where('create_time', 'egt', trim($startTime));
        }
        if (!$start && $end) {
            $endTime = strtotime($end);
            $Article->where('create_time', 'elt', trim($endTime));
        }
        if ($start && $end) {
            $Article->where('create_time', 'between', [$start, $end]);
        }
        if ($title != '' || $start != '' || $end != '' || $status != '' || $cate != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $Article = $Article->order('id desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $Article->render();
        $this->assign('ArticleList', $Article);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('article/index');
    }

    /**
     *  文章添加
     * @param string $uid
     * @param string $title
     * @param string $s_title
     * @param string $cate_id
     * @param int $status
     * @return mixed
     */
    public function add($uid = '', $title = '', $s_title = '', $cate_id = '', $status = 0)
    {
        if (request()->isPost()) {
            //图片处理
            $file = request()->file('file');
            $fileP = [];
            if ($file) {
                $info = $file->validate(['ext' => 'jpg,jpeg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
                if ($info) {
                    //文件的保存路径
                    $filePath = request()->domain() . '/' . 'uploads/' . $info->getSaveName();
                    $fileP = $filePath;
                }
            }
            $filePa = str_replace('\\', "/", $fileP);
            $ArticleList = new ArticleList();
            $result = $ArticleList->articleProcessing($uid, $title, $s_title, $cate_id, $status, $filePa);
            if ($result) {
                $this->success('文章添加成功');
            } else {
                $this->error('文章添加失败');
            }
        }
        $Cate = new ArticleCate();
        $data = $Cate->getArticleCate();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 文章编辑处理
     * @param string $id
     * @param string $uid
     * @param string $title
     * @param string $s_title
     * @param string $cate_id
     * @param int $status
     * @return mixed
     * @throws \think\Exception
     */
    public function edit($id = '', $uid = '', $title = '', $s_title = '', $cate_id = '', int $status = 0)
    {
        if (request()->isPost()) {
            //图片处理
            $file = request()->file('file');
            $fileP = [];
            if ($file) {
                $info = $file->validate(['ext' => 'jpg,jpeg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
                if ($info) {
                    //文件的保存路径
                    $filePath = request()->domain() . '/' . 'uploads/' . $info->getSaveName();
                    $fileP = $filePath;
                }
            }
            $filePa = str_replace('\\', "/", $fileP);
            $ArticleList = new ArticleList();
            $result = $ArticleList->articleEditProcessing($id, $uid, $title, $s_title, $cate_id, $status, $filePa);
            if ($result) {
                $this->success('文章更新成功');
            } else {
                $this->error('文章更新失败');
            }
        }
        $Cate = new ArticleCate();
        $ArticleList = new ArticleList();
        $result = $ArticleList->getContent($id)->toArray();
        $data = $Cate->getArticleCate();
        $this->assign('cate', $data);
        $this->assign('data', $result);
        return $this->fetch();
    }


    /**
     *  根据id删除文章
     * @param int $id
     * @return \think\response\Json
     */
    public function del(int $id)
    {
        if ($id) {
            $ArticleList = new ArticleList();
            $result = $ArticleList->deleteArticle($id);
            if ($result === true) {
                return json(['code' => 1, 'msg' => '删除成功']);
            } else {
                return json(['code' => 0, 'msg' => '删除失败']);
            }
        } else {
            return json(['code' => 0, 'msg' => '对不起,数据不存在!']);
        }

    }


}