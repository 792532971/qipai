<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:72:"D:\a_project\qipai\public/../application/admin\view\lottery\setting.html";i:1560325571;s:58:"D:\a_project\qipai\application\admin\view\common\meta.html";i:1560325571;s:60:"D:\a_project\qipai\application\admin\view\common\header.html";i:1560325571;s:58:"D:\a_project\qipai\application\admin\view\common\menu.html";i:1560325571;s:60:"D:\a_project\qipai\application\admin\view\common\footer.html";i:1560325571;}*/ ?>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="favicon.ico" >
    <link rel="Shortcut Icon" href="favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/static/admin/lib/html5.js"></script>
    <script type="text/javascript" src="/static/admin/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/static/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" href="/static/admin/static/h-ui.admin/skin/default/skin.css" type="text/css" id="skin">
    <link rel="stylesheet" type="text/css" href="/static/admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <!--<script type="text/javascript" src="/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="/static/menu/menu/jquery-3.2.1.min.js"></script>
    <![endif]-->

<title>游戏管理 - 百人牛牛 - TXCMS_V2</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="/static/admin/layui/dist/css/layui.css" />
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="<?php echo url('index/index'); ?>">TXCMS_后台管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#l">TXCMS_后台管理系统</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v2.0</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onclick="article_add('添加管理员','<?php echo url("admin/add"); ?>')"><i class="Hui-iconfont">&#xe616;</i> 新增管理员</a></li>
                            <li><a href="javascript:;" onclick="product_add('添加文章','<?php echo url('article/add'); ?>')"><i class="Hui-iconfont">&#xe620;</i> 新增文章</a></li>
                            <li><a href="javascript:;" onclick="member_add('添加分类','<?php echo url("cate/add"); ?>','','510')"><i class="Hui-iconfont">&#xe60d;</i> 新增分类</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A"><?php echo \think\Request::instance()->session('admin.username'); ?> <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a onclick="logout();">退出</a></li>
                        </ul>
                    </li>

                    <li class="dropDown dropDown_hover"> <a href="#" onclick="cleanCache();" class="dropDown_A" title="清空缓存">清空缓存<i class="badge badge-danger"></i></a> </li>


                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<script>
    /*退出*/
    function logout()
    {
        $.ajax({
            url:"<?php echo url('login/logout'); ?>",
            success:function (res) {
                if(res.code === 1){
                    //退出成功
                    layer.msg(res.msg,{icon:1});
                    setTimeout(function () {
                        window.location.href="<?php echo url('login/index'); ?>"
                    },2000)
                }else{
                    //退出失败
                    layer.msg(res.msg,{icon:2})
                }

            }
        })
    }
    /*
    清空缓存
     */
    function cleanCache()
    {
        $.ajax({
            url:"<?php echo url('index/cleanCache'); ?>",
            type:'post',
            success:function (res) {
                if(res.code === 1){
                    layer.msg(res.msg);
                }else{
                    layer.msg(res.msg);
                }
            }
        })
    }

    function article_add(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    function product_add(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    function member_add(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
</script>

<?php
    $title = '';
    foreach ($menu_tree as $item) {
        foreach($item['nav'] as $val) {
            if ($val['url'] == '/admin.php/' . request()->pathinfo()) {
                $title = $item['title'];
            }
        }
    }
?>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <?php if(is_array($menu_tree) || $menu_tree instanceof \think\Collection || $menu_tree instanceof \think\Paginator): $i = 0; $__LIST__ = $menu_tree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <dl>
            <dt class="<?php if($vo['title']==$title): ?>selected<?php endif; ?>"><i class="Hui-iconfont">&#xe63c;</i> <?php echo $vo['title']; ?><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd style="<?php if($vo['title']==$title): ?>display: block<?php endif; ?>">
                <ul>
                    <?php if(is_array($vo['nav']) || $vo['nav'] instanceof \think\Collection || $vo['nav'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['nav'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?>
                    <li><a href="<?php echo $nav['url']; ?>" title="<?php echo $nav['title']; ?>"><?php echo $nav['title']; ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </dd>
        </dl>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <dl id="menu-admin">
            <dt class="selected"><i class="Hui-iconfont">&#xe63c;</i> 栏目管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="<?php echo url('menu/index'); ?>" title="栏目管理">栏目列表</a></li>
                </ul>
            </dd>
        </dl>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<script>
</script>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="<?php echo url('index/index'); ?>">首页</a>
        <span class="c-gray en">&gt;</span>
        转盘管理
        <span class="c-gray en">&gt;</span>
        轮盘设置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div id="tab_demo" class="HuiTab">
        <div class="tabBar clearfix"><span>白银轮盘</span><span>黄金轮盘</span><span>钻石轮盘</span></div>
        <div class="tabCon">
            <!--房间配置-->
            <div class="table-responsive">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="10">id</th>
                        <th width="10">级别</th>
                        <th width="40">转盘概率</th>
                        <th width="40">数量(num)</th>
                        <th width="40">奖品名称</th>
                        <th width="40">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($lottery_pri) || $lottery_pri instanceof \think\Collection || $lottery_pri instanceof \think\Paginator): $i = 0; $__LIST__ = $lottery_pri;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo_1): $mod = ($i % 2 );++$i;?>
                    <tr class="text-c">
                        <td><?php echo $vo_1['id']; ?></td>
                        <td><?php echo $vo_1['prize']; ?></td>
                        <td><?php echo $vo_1['pro']; ?>%</td>
                        <td><?php echo $vo_1['num']; ?></td>
                        <td><?php echo $vo_1['prize_name']; ?></td>
                        <td>
                            <a title="编辑" href="javascript:;" onclick="edit_lottery_setting('配置','/admin.php/admin/lottery/lottery_setting?id=<?php echo $vo_1['id']; ?>&lev=1','1','800','500')" class="ml-5 btn btn-success-outline radius size-MINI" style="text-decoration:none">配置编辑</a>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tabCon">
            <!--游戏配置-->
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr class="text-c">
                    <th width="10">id</th>
                    <th width="10">级别</th>
                    <th width="40">转盘概率</th>
                    <th width="40">数量(num)</th>
                    <th width="40">奖品名称</th>
                    <th width="40">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($lottery_mid) || $lottery_mid instanceof \think\Collection || $lottery_mid instanceof \think\Paginator): $i = 0; $__LIST__ = $lottery_mid;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo_2): $mod = ($i % 2 );++$i;?>
                <tr class="text-c">
                    <td><?php echo $vo_2['id']; ?></td>
                    <td><?php echo $vo_2['prize']; ?></td>
                    <td><?php echo $vo_2['pro']; ?>%</td>
                    <td><?php echo $vo_2['num']; ?></td>
                    <td><?php echo $vo_2['prize_name']; ?></td>
                    <td>
                        <a title="编辑" href="javascript:;" onclick="edit_lottery_setting('配置','/admin.php/admin/lottery/lottery_setting?id=<?php echo $vo_2['id']; ?>&lev=2','1','800','500')" class="ml-5 btn btn-success-outline radius size-MINI" style="text-decoration:none">配置编辑</a>
                    </td>
                </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
        </div>
        <div class="tabCon">
            <!--房间配置-->
            <div class="table-responsive">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="10">id</th>
                        <th width="10">级别</th>
                        <th width="40">转盘概率</th>
                        <th width="40">数量(num)</th>
                        <th width="40">奖品名称</th>
                        <th width="40">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($lottery_hig) || $lottery_hig instanceof \think\Collection || $lottery_hig instanceof \think\Paginator): $i = 0; $__LIST__ = $lottery_hig;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo_3): $mod = ($i % 2 );++$i;?>
                    <tr class="text-c">
                        <td><?php echo $vo_3['id']; ?></td>
                        <td><?php echo $vo_3['prize']; ?></td>
                        <td><?php echo $vo_3['pro']; ?>%</td>
                        <td><?php echo $vo_3['num']; ?></td>
                        <td><?php echo $vo_3['prize_name']; ?></td>
                        <td>
                            <a title="编辑" href="javascript:;" onclick="edit_lottery_setting('配置','/admin.php/admin/lottery/lottery_setting?id=<?php echo $vo_3['id']; ?>&lev=3','1','800','500')" class="ml-5 btn btn-success-outline radius size-MINI" style="text-decoration:none">配置编辑</a>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="/static/admin/layui/dist/layui.all.js"></script>
<!--<script type="text/javascript" src="/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>-->
<script type="text/javascript" src="/static/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<link rel="stylesheet" type="text/css" href="/static/admin/css/jquery-ui.css" />
<script type="text/javascript" src="/static/admin/static/laydate/laydate.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/static/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/static/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function(){ $('#tab_demo').Huitab();});
    function edit_lottery_setting(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    layui.use('form', function(){
        var form = layui.form;
        form.on('switch(switch)', function(data) {
            var url = $(this).data('url');
            var status = data.elem.checked;//开关是否开启，true或者false
            //后台我需要的是0或1，所以预先在js中处理change的值
            if(status) {
                status = 1;
            } else {
                status = 0;
            }
            $.post(url, {status: status}, function(res) {
                if(res.code) {
                    layer.msg(res.msg);
                }
            });
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>