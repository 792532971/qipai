<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:78:"D:\gitee\qp_backstage\public/../application/admin\view\game_room\bot_edit.html";i:1541558018;s:61:"D:\gitee\qp_backstage\application\admin\view\common\meta.html";i:1545203841;s:63:"D:\gitee\qp_backstage\application\admin\view\common\footer.html";i:1545201363;}*/ ?>
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

<title>会员管理 - 会员充值 - TXCMS_V2</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="cl pd-20">
    <form action="<?php echo url('user/chongzhiSave'); ?>" method="post" class="form form-horizontal" >
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>底分：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" name="bot" id="bot" value="<?php echo $data['bot']; ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>入场限制：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" name="stint" id="stint" value="<?php echo $data['stint']; ?>">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="button" onclick="tijiao(<?php echo $data['id']; ?>);" value="&nbsp;&nbsp;确认配置&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
<!--<script type="text/javascript" src="/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>-->
<script type="text/javascript" src="/static/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<link rel="stylesheet" type="text/css" href="/static/admin/css/jquery-ui.css" />
<script type="text/javascript" src="/static/admin/static/laydate/laydate.js"></script>


<script type="text/javascript">
    function tijiao(id){
        var bot = $('#bot').val();
        var stint = $('#stint').val();
        $.ajax({
            url:"<?php echo url('game_room/edit_save'); ?>",
            data:{'id':id,'bot':bot,'stint':stint},
            type:'post',
            dataType:'json',
            success:function (res) {
                if(res.code === 1){
                    layer.msg(res.msg,{icon:1});
                    var index1 = parent.layer.getFrameIndex(window.name);
                    setTimeout(function(){
                        parent.location.reload();
                        parent.layer.close(index1);//关闭弹出层
                    }, 2000);
                }else{
                    layer.msg(res.msg,{icon:2})
                }
            }

        })
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>