<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:80:"D:\a_project\qipai\public/../application/admin\view\lottery\lottery_setting.html";i:1560325571;s:58:"D:\a_project\qipai\application\admin\view\common\meta.html";i:1560325571;s:60:"D:\a_project\qipai\application\admin\view\common\footer.html";i:1560325571;}*/ ?>
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
    <form action="" method="post" class="form form-horizontal" >
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*概率(%)</span></label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="hidden" value="<?php echo $lev; ?>" id="lev" name="lev">
                <input type="text" class="input-text" autocomplete="off" name="pro" id="pro" value="<?php echo $data['pro']; ?>">
                <span style="color: #ff0000;font-size: xx-small">中奖百分比:概率越高中奖几率越大</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>级别：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" readonly="readonly" name="prize" id="prize" value="<?php echo $data['prize']; ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" name="num" id="num" value="<?php echo $data['num']; ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>奖品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" name="prize_name" id="prize_name" value="<?php echo $data['prize_name']; ?>">
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
        var pro = $('#pro').val();
        var num = $('#num').val();
        var lev = $('#lev').val();
        var prize_name = $('#prize_name').val();
        $.ajax({
            url:"<?php echo url('lottery/settingEditSave'); ?>",
            data:{'id':id,'pro':pro,'num':num,'prize_name':prize_name,'lev':lev},
            type:'post',
            dataType:'json',
            success:function (res) {
                if(res.code === 1){
                    layer.msg(res.msg,{icon:1});
//                    var index1 = parent.layer.getFrameIndex(window.name);
//                    setTimeout(function(){
//                        parent.location.reload();
//                        parent.layer.close(index1);//关闭弹出层
//                    }, 1000);
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