<#-- Created by IntelliJ IDEA.
 User: lvyifan
 Date: 2019/6/25
 Time: 16:00
 人民邮电数据管理
 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>日志</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <#--<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>-->
    <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${re.contextPath}/plugin/lenos/main.css">
    <script type="text/javascript" src="${re.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${re.contextPath}/plugin/layui/layui.all.js" charset="utf-8"></script>
</head>

<body>
<div class="lenos-search">
    <div class="select">
        <div class="layui-inline">
            <label class="layui-form-label">请选择范围</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test16" placeholder="开始 到 结束">
            </div>
        </div>
        <div class="layui-input-inline">
            <label class="layui-form-label">审核状态</label>
            <div class="layui-input-inline">
                <select name="modules" lay-verify="required" lay-search="">
                    <option value="">全部</option>
                    <option value="0">待审核</option>
                    <option value="1">已审核</option>
                </select>
            </div>
        </div>

        <div class="layui-input-inline">
            <label class="layui-form-label">审核状态</label>
            <div class="layui-input-inline">
                <select name="modules1" lay-verify="required" lay-search="">
                    <option value="">全部</option>
                    <option value="0">待审核</option>
                    <option value="1">已审核</option>
                </select>
            </div>
        </div>
    </div>
</div>

<table id="demo" lay-filter="special"></table>

<script type="text/html" id="toolBar1">

    {{#  if(!d.status){ }}
    <@shiro.hasPermission name="job:start">
        <a class="layui-btn layui-btn-xs  layui-btn-normal" lay-event="start">审核</a>
    </@shiro.hasPermission>
    {{#  } }}
    {{# if(d.status){ }}
    <p>已审核</p>
    {{#  } }}

</script>

<script type="text/html" id="toolBar2">

    <@shiro.hasPermission name="job:update">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">修改</a>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="job:add">
        <a class="layui-btn layui-btn-xs  layui-btn-normal" lay-event="add">添加中标单位</a>
    </@shiro.hasPermission>

    <@shiro.hasPermission name="role:del">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </@shiro.hasPermission>

</script>

<script type="text/html" id="lianjie">
    <a href="{{d.url}}">千里马链接</a>
</script>

<script type="text/html" id="idhao">
    <p hidden="hidden">{{d.id}}</p>
</script>

<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>

<script>

    layui.laytpl.toDateString = function (d, format) {
        var date = new Date(d || new Date())
            , ymd = [
            this.digit(date.getFullYear(), 4)
            , this.digit(date.getMonth() + 1)
            , this.digit(date.getDate())
        ]
            , hms = [
            this.digit(date.getHours())
            , this.digit(date.getMinutes())
            , this.digit(date.getSeconds())
        ];

        format = format || 'yyyy-MM-dd HH:mm:ss';

        return format.replace(/yyyy/g, ymd[0])
            .replace(/MM/g, ymd[1])
            .replace(/dd/g, ymd[2])
            .replace(/HH/g, hms[0])
            .replace(/mm/g, hms[1])
            .replace(/ss/g, hms[2]);
    };

    //数字前置补零0
    layui.laytpl.digit = function (num, length, end) {
        var str = '';
        num = String(num);
        length = length || 2;
        for (var i = num.length; i < length; i++) {
            str += '0';
        }
        return num < Math.pow(10, length) ? str + (num | 0) : num;
    };

    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
            $(".select .select-on").click();
        }
    }


    layui.use(['table', 'laydate'], function () {
        var table = layui.table;
        laydate = layui.laydate;
        laydate.render({
            elem: '#test16'
            , type: 'datetime'
            , range: '到'
            , format: 'yyyy年M月d日H时m分s秒'
        });
        //方法级渲染
        table.render({
            id: 'demo',
            elem: '#demo',
            url: 'http://localhost:8086/ls/lenospService/showDataList',
            limit: 10,
            where: {
                userid: 1111,
                pageNum: 1,
                pageSize: 10,
                dateFormat: '2019-06-27'
            }
            , page: true
            , cols: [[
                {field: 'zizeng', width: 60, title: '序号', fixed: 'left', templet: '#xuhao'}
                , {
                    field: 'publishDate',
                    title: '发布日期',
                    sort: true,
                    templet: '<div>{{ layui.laytpl.toDateString(d.createTime,"yyyy-MM-dd") }}</div>'
                }
                , {field: 'id', title: 'id号', sort: true, templet: '#idhao'}
                , {field: 'progCode', title: '项目编号', sort: true}
                , {field: 'progName', title: '项目名称', sort: true}
                , {field: 'province', title: '省份', width: 80, sort: true}
                , {field: 'city', title: '城市', width: 80, sort: true}
                , {field: 'jiaUnit', title: '甲方单位', sort: true}
                , {field: 'zhongUnit', title: '中标单位', width: 250, sort: true}
                , {field: 'bidNum', title: '中标金额', sort: true}
                , {field: 'disNum', title: '折扣金额', sort: true}
                , {field: 'url', title: '千里马链接', sort: true, templet: '#lianjie'}
                , {field: 'shenhe', title: '审核状态', width: 90, toolbar: '#toolBar1'}
                , {field: 'caozuo', title: '操作', width: 300, toolbar: '#toolBar2'}
            ]]
            , height: 'full-83'

        });

        var $ = layui.$, active = {
            select: function () {
                var userName = $('#userName').val();
                var type = $('#type').val();
                table.reload('demo', {
                    where: {
                        userName: userName,
                        type: type
                    }
                });
            },
            reload: function () {
                $('#userName').val('');
                $('#type').val('');
                table.reload('demo', {
                    where: {
                        userName: null,
                        type: null
                    }
                });
            },
            add: function () {
                add('添加任务', 'http://localhost:8086/ls/lenospService/add', 700, 450);
            },
            update: function () {
                var checkStatus = table.checkStatus('demo')
                    , data = checkStatus.data;
                if (data.length != 1) {
                    layer.msg('请选择一行编辑', {icon: 5});
                    return false;
                }
                if (data[0].status) {
                    layer.msg('已经启动任务无法更新,请停止后更新', {icon: 5, offset: 'rb', area: ['200px', '100px'], anim: 2});
                    return false;
                }
                update('编辑任务', 'updateJob?id=' + data[0].id, 700, 450);
            },
        };
        //监听工具条
        table.on('tool(special)', function (obj) {
            var data = obj.data;
            alert(data)
            if (obj.event === 'del') {
                del(data.id);
            }
        });

        // $('.layui-col-md12 .layui-btn').on('click', function () {
        //     var type = $(this).data('type');
        //     active[type] ? active[type].call(this) : '';
        // });
        // $('.select .layui-btn').on('click', function () {
        //     var type = $(this).data('type');
        //     active[type] ? active[type].call(this) : '';
        // });

    });

    /**删除id*/
    function del(id) {
        alert(id)
        $.ajax({
            url: "http://localhost:8086/ls/lenospService/del",
            type: "post",
            data: {
                id: id,
                modifyUser: "测试01"
            },
            success: function (d) {
                if(d.flag){
                    layer.msg(d.msg,{icon:6,offset: 'rb',area:['120px','80px'],anim:2});
                    layui.table.reload('jobList');
                }else{
                    layer.msg(d.msg,{icon:5,offset: 'rb',area:['120px','80px'],anim:2});
                }
            }
        });
    }

    /**
     * 更新用户
     */
    function update(title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        if (url == null || url == '') {
            url = "error/404";
        }
        if (w == null || w == '') {
            w = ($(window).width() * 0.9);
        }
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        layer.open({
            id: 'user-update',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url + '&detail=false'
        });
    }

    /*弹出层*/
    /*
     参数解释：
     title   标题
     url     请求的url
     id      需要操作的数据id
     w       弹出层宽度（缺省调默认值）
     h       弹出层高度（缺省调默认值）
     */
    function add(title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        if (url == null || url == '') {
            url = "error/404";
        }
        if (w == null || w == '') {
            w = ($(window).width() * 0.9);
        }
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        layer.open({
            id: 'job-add',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url
        });
    }

</script>

</body>

</html>