<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"D:\gitee\qp_backstage\public/../application/admin\view\group\power.html";i:1549857606;s:61:"D:\gitee\qp_backstage\application\admin\view\common\meta.html";i:1545203841;s:63:"D:\gitee\qp_backstage\application\admin\view\common\footer.html";i:1545201363;}*/ ?>
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

    <title>新建网站角色 - 管理员管理 - TXCMS_V2</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<article class="cl pd-20">
    <form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
        <input type="hidden" value="<?php echo $authGroups['id']; ?>" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户组名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $authGroups['title']; ?>" placeholder="" id="title" name="title" datatype="*4-16" nullmsg="用户组不能为空" disabled="disabled">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">分配权限：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <table>
                    <?php if(is_array($data) || $data instanceof \think\Collection || $data instanceof \think\Paginator): if( count($data)==0 ) : echo "" ;else: foreach($data as $key=>$vo): ?>
                    <tr>
                        <td>
                            <label style="padding-right:15px;">
                                <input id="<?php echo $vo['id']; ?>" value="<?php echo $vo['id']; ?>" name="rules[]" dataid="id-<?php echo $vo['id']; ?>" <?php if(in_array($vo['id'], $rules)){ echo 'checked="checked"';}?> class="colored-success checkbox-parent" type="checkbox">
                                <span class="text"><?php echo $vo['title']; ?></span>
                            </label>
                        </td>
                    </tr>
                    <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$vo2): ?>
                    <tr>
                        <td style="padding-left:30px;">
                            <label style="padding-right:15px;">
                                <input <?php if(in_array($vo2['id'], $rules)){ echo 'checked="checked"';}?> class="colored-success checkbox-parent checkbox-child" id="<?php echo $vo2['id']; ?>" value="<?php echo $vo2['id']; ?>" name="rules[]"  dataid="id-<?php echo $vo['id']; ?>-<?php echo $vo2['id']; ?>" type="checkbox">
                                <span class="text"><?php echo $vo2['title']; ?></span>
                            </label>
                        </td>
                    </tr>
                    <?php if($vo2['children']): ?>
                    <tr>
                        <td style="padding-left:60px;">
                            <?php if(is_array($vo2['children']) || $vo2['children'] instanceof \think\Collection || $vo2['children'] instanceof \think\Paginator): if( count($vo2['children'])==0 ) : echo "" ;else: foreach($vo2['children'] as $key=>$vo3): ?>
                            <label style="padding-right:15px;">
                                <input <?php if(in_array($vo3['id'], $rules)){ echo 'checked="checked"';}?> class="colored-success checkbox-child" id="<?php echo $vo3['id']; ?>" value="<?php echo $vo3['id']; ?>" name="rules[]" dataid="id-<?php echo $vo['id']; ?>-<?php echo $vo2['id']; ?>-<?php echo $vo3['id']; ?>" type="checkbox">
                                <span class="text"><?php echo $vo3['title']; ?></span>
                            </label>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </td>
                    </tr>
                    <?php endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
                </table>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="button" class="btn btn-success radius" id="admin-role-save"><i class="icon-ok"></i> 确定</button>
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


<!--请在下方写此页面业务相关的脚本-->
<!--<script type="text/javascript" src="/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>-->
<!--<script type="text/javascript" src="/static/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>-->
<!--<script type="text/javascript" src="/static/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>-->
<script type="text/javascript">
    /* 权限配置动态选择框 */
    $(function () {
        //动态选择框，上下级选中状态变化
        $('input.checkbox-parent').on('change', function () {
            var dataid = $(this).attr("dataid");
            $('input[dataid^=' + dataid + ']').prop('checked', $(this).is(':checked'));
        });
        $('input.checkbox-child').on('change', function () {
            var dataid = $(this).attr("dataid");
            dataid = dataid.substring(0, dataid.lastIndexOf("-"));
            var parent = $('input[dataid=' + dataid + ']');
            if ($(this).is(':checked')) {
                parent.prop('checked', true);
                //循环到顶级
                while (dataid.lastIndexOf("-") != 2) {
                    dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                    parent = $('input[dataid=' + dataid + ']');
                    parent.prop('checked', true);
                }
            } else {
                //父级
                if ($('input[dataid^=' + dataid + '-]:checked').length == 0) {
                    parent.prop('checked', false);
                    //循环到顶级
                    while (dataid.lastIndexOf("-") != 2) {
                        dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                        parent = $('input[dataid=' + dataid + ']');
                        if ($('input[dataid^=' + dataid + '-]:checked').length == 0) {
                            parent.prop('checked', false);
                        }
                    }
                }
            }
        });
    });

    /*角色组分配权限ajax提交form表单*/
    $('#admin-role-save').click(function () {
        $.ajax({
            url:"<?php echo url('group/power'); ?>",
            dataType:'json',
            data:$('#form-admin-role-add').serialize(),
            type:'post',
            success:function (result) {
                //执行成功
                if(result.code===1){
                    layer.msg(result.msg,{icon:1});
                    var index = parent.layer.getFrameIndex(window.name);
                    setTimeout(function () {
                        parent.location.reload();
                        parent.layer.clone(index);
                    },1500)
                }else{
                    //执行失败
                    layer.msg(result.msg,{icon:2});
                }
            }
        })
    })
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>