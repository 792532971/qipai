<?php

namespace app\admin\controller;

use think\Db;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-5
 * Time: 16:25
 */
class Index extends Base
{
    /**
     * 项目首页
     */
    public function index()
    {
        $version = Db::query('SELECT VERSION() AS ver');
        $config = [
            'url' => $_SERVER['SERVER_ADDR'] ?? null,  //获取当前域名
            'document_root' => $_SERVER['DOCUMENT_ROOT']  ?? null,  //网站目录
            'server_os' => PHP_OS  ?? null,                    //操作系统
            'server_port' => $_SERVER['SERVER_PORT']  ?? null,   //服务器端口
            'server_ip' => $_SERVER['SERVER_ADDR']  ?? null,      //服务器ip
            'server_soft' => $_SERVER['SERVER_SOFTWARE']  ?? null,  //web运行环境
            'php_version' => PHP_VERSION  ?? null,      //php版本
            'mysql_version' => $version[0]['ver']  ?? null,    //数据库版本
            'max_upload_size' => ini_get('upload_max_filesize')  ?? null,  //最大上传限制
            'accept' => $_SERVER['HTTP_ACCEPT_LANGUAGE']  ?? null,   //服务器语言
            'user_agent' => $_SERVER['HTTP_USER_AGENT']  ?? null,   //当前浏览器user_agent
            'system_root' => $_SERVER['SystemRoot']  ?? null,   //服务器系统目录
            'zend_banben' => Zend_Version()  ?? null,    //Zend版本
            'apa_ngi' => PHP_SAPI  ?? null    //web服务器
        ];
        $this->assign('config', $config);
        return $this->fetch();
    }

    /**
     * 空操作
     */
    public function _empty()
    {
        $this->redirect('index/index');
    }

    public function cleanCache()
    {
        if (request()->isPost()){
            deldir(RUNTIME_PATH);
            return json(['code'=>1,'msg'=>'清除成功']);
        }else{
            deldir(RUNTIME_PATH);
            return json(['code'=>0,'msg'=>'清除失败']);
        }
    }

}