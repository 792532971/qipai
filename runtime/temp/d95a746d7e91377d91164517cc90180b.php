<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\gitee\qp_backstage\public/../application/admin\view\admin\edit.html";i:1543558657;s:61:"D:\gitee\qp_backstage\application\admin\view\common\meta.html";i:1545203841;s:63:"D:\gitee\qp_backstage\application\admin\view\common\footer.html";i:1545201363;}*/ ?>
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

    <title>添加管理员 - 管理员管理 - TXCMS_V2</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<article class="cl pd-20">
    <form action="" method="post" class="form form-horizontal from-edit-save" id="form-admin-add">
        <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $data['username']; ?>" placeholder="" id="adminName" name="username">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $data['mobile']; ?>" placeholder="" id="mobile" name="mobile">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $data['email']; ?>" placeholder="@" name="email" id="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户组：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="groupid" size="1">
                    <?php if(is_array($role) || $role instanceof \think\Collection || $role instanceof \think\Paginator): $i = 0; $__LIST__ = $role;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $vo['id']; ?>" <?php if($data['groupid']==$vo['id']): ?>selected="selected"<?php endif; ?>><?php echo $vo['title']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="note" cols="" rows=""  class="textarea limit_100 advice"  id="wishContent" placeholder="说点什么...<=20个字符以内" dragonfly="true" ><?php echo $data['note']; ?></textarea>
                <p class="limit statistics" style="color: red;float: right"></p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="button" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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

<script>
    /*texarea监听限制字数*/
    $(function () {
        var bind_name = 'input';
        if (navigator.userAgent.indexOf("MSIE") != -1) { //（此处是为了兼容IE）
            bind_name = 'propertychange';
        }
        if (navigator.userAgent.match(/android/i) == "android") {
            bind_name = "keyup";
        }

        $(".limit_100").bind(bind_name, function() {
            var limitSub = $(this).val().substr(0, 20);
            $(this).val(limitSub); //截取字符长度
            $(this).next('.statistics').html(limitSub.length + '/20'); //获取实时输入字符长度并显示
            if (limitSub.length == 20) {
                $('.limit').css('color', 'red'); //超出指定字符长度标红提示
                alert('最多20个字！');
            } else {
                $('.limit').css('color', '#333');
            }
        });
    });


    /*ajax提交form表单*/
    $('#button').click(function () {
       var formData  = $('.from-edit-save').serialize();
       $.ajax({
           url:"<?php echo url('admin/edit'); ?>",
           type:'post',
           data:formData,
           success:function (res) {
                if(res.code === 0 ){
                    //失败
                    layer.msg(res.msg,{icon:2},300);
                    var index = parent.layer.getFrameIndex(window.name);
                    setTimeout(function(){
                        parent.location.reload(); //刷新父级页面
                        parent.layer.close(index);//关闭弹出层
                    }, 2000);
                }else{
                    //成功
                    layer.msg(res.msg,{icon:1},300);
                    var index1 = parent.layer.getFrameIndex(window.name);
                    setTimeout(function(){
                        parent.location.reload();
                        parent.layer.close(index1);//关闭弹出层
                    }, 2000);
                }
           }
       })
    })
</script>
</body>

</html>