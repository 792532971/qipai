<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:69:"D:\gitee\qp_backstage\public/../application/admin\view\rule\edit.html";i:1540868417;s:61:"D:\gitee\qp_backstage\application\admin\view\common\meta.html";i:1545203841;s:63:"D:\gitee\qp_backstage\application\admin\view\common\footer.html";i:1545201363;}*/ ?>
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
<title>权限添加 - 管理员管理 - TXCMS_v2</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="cl pd-20">
    <form action="<?php echo url('rule/edit'); ?>" method="post" class="form form-horizontal" id="form-admin-add">
        <input type="hidden" name="id" value="<?php echo $rules['id']; ?>">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>上级规则</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="pid">
                    <option value="0">顶级规则</option>
                    <?php if(is_array($ruleTree) || $ruleTree instanceof \think\Collection || $ruleTree instanceof \think\Paginator): $i = 0; $__LIST__ = $ruleTree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rule): $mod = ($i % 2 );++$i;?>
                    <option <?php if($rules['pid'] == $rule['id']): ?> selected="selected" <?php endif; ?> value="<?php echo $rule['id']; ?>"><?php echo str_repeat('-', $rule['level']*6)?><?php echo $rule['title']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>规则名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $rules['title']; ?>" placeholder="" id="title" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>规则：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="<?php echo $rules['name']; ?>" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否启用：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="show" type="radio" value="0" <?php if($rules['status'] == 0): ?> checked="checked" <?php endif; ?>>
                    <label for="sex-1">是</label>
                </div>
                <div class="radio-box">
                    <input type="radio" value="1" name="show" <?php if($rules['status'] == 1): ?> checked="checked" <?php endif; ?>>
                    <label for="sex-2">否</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否隐藏：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="status" value="0" type="radio" <?php if($rules['show'] == 0): ?> checked="checked" <?php endif; ?>>
                    <label for="sex-1">是</label>
                </div>
                <div class="radio-box">
                    <input type="radio" value="1" name="status" <?php if($rules['show'] == 1): ?> checked="checked" <?php endif; ?>>
                    <label for="sex-2">否</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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


</body>
</html>