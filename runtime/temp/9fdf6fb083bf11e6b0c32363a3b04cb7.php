<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:77:"D:\a_project\qipai\public/../application/admin\view\lottery\lottery_edit.html";i:1560325571;s:58:"D:\a_project\qipai\application\admin\view\common\meta.html";i:1560325571;}*/ ?>
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

<title>修改密码 - 会员管理 - TXCMS_V2</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="cl pd-20">
    <form action="<?php echo url('lottery/lottery_edit'); ?>" method="post" class="form form-horizontal" id="form_data">
        <input type="hidden" name="id" id="id" value="<?php echo $data['id']; ?>">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>转盘名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" id="lottery_name" name="lottery_name" value="<?php echo $data['lottery_name']; ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>转盘所需经验：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" id="req_exp" name="req_exp" value="<?php echo $data['req_exp']; ?>">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="button" onclick="button_data();return false;" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
<!--/请在上方写此页面业务相关的脚本-->
<script type="text/javascript" src="/static/admin/lib/layer/2.4/layer.js"></script>
<script>
    function button_data() {
        var id = $('#id').val();
        var lottery_name = $('#lottery_name').val();
        var req_exp = $('#req_exp').val();
        var url = "<?php echo url('lottery/lotteryEditSave'); ?>";
        $.post(url,{'id':id,'lottery_name':lottery_name,'req_exp':req_exp},function (res) {
            if(res.code === 1){
                layer.msg(res.msg);
                var index = parent.layer.getFrameIndex(window.name);
                setTimeout(function(){
                    parent.location.reload(); //刷新父级页面
                    parent.layer.close(index);//关闭弹出层
                }, 1000);
            }else{
                layer.msg(res.msg);
            }
        })
    }
</script>
</body>
</html>