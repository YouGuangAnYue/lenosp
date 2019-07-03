<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <#--<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>-->

    <script type="text/javascript" src="${re.contextPath}/plugin/layui/layui.all.js" charset="utf-8"></script>

    <script type="text/javascript" src="${re.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>

    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>

    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <#--<script src="./bootstrap-datetimepicker.js"></script>
    <script src="./bootstrap-datetimepicker.min.js"></script>-->
    <script src="${re.contextPath}/plugin/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <#--<link rel="stylesheet" href="./bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="./bootstrap-datetimepicker.min.css">-->
    <link rel="stylesheet" href="${re.contextPath}/plugin/bootstrap/css/bootstrap-datetimepicker.min.css">
</head>
<style>
    * {
        margin: 0;
        padding: 0
    }

    .btn {
        margin: 0 5px
    }

    .div {
        margin: 30px auto
    }

    #modify {
        width: 400px;
        height: 400px;
        position: fixed;
        z-index: 999;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto auto;
        background: white;
        border-radius: 10px;
        text-align: center
    }

    #add {
        width: 400px;
        height: 300px;
        position: fixed;
        z-index: 999;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto auto;
        background: white;
        border-radius: 10px;
        text-align: center;
        display: none
    }

    #remove {
        width: 400px;
        height: 130px;
        position: fixed;
        z-index: 999;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto auto;
        background: white;
        border-radius: 10px;
        text-align: center;
        display: none
    }

    #bg {
        width: 100%;
        height: 100%;
        z-index: 998;
        background: rgba(0, 0, 0, .4);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }

    .item {
        line-height: 20px;
        margin: 20px 0;
        font-size: 15px
    }

    .item span {
        margin-right: 20px
    }

    .but {
        width: 100px;
        line-height: 30px;
        margin: 20px 20px;
        cursor: pointer;
    }

    .query {
        width: 100px;
        margin: 0 20px;
        cursor: pointer;
    }

    .it {
        text-align: center
    }
    #table th{
        text-align:center;
    }
    #table tr{
        padding:10px !important;
    }
    #table head{
        font-size:18px;
    }
    #table td{
        font-size:14px;
        vertical-align:middle;
        height:40px;
        padding:0 !important;
    }
    p{
        margin:0 !important;
        height:100%;
        display:flex;
        align-items:center;
        justify-content:center;
    }
    ,btn{
        font-size:14px !important;
     }
</style>

<body class="div">
<input type="hidden" id="username" value="${username}"/>
<div style="display: flex;height:50px">
    <div style="height:30px;line-height:30px">
        <input type="text"  autocomplete="off" style="margin-right:20px" name="time" id="test1">
        <span style="line-height: 45px;margin-right: 10px">审核状态:</span>
        <select class="inp-2" id="inp-6" name="type">
            <option value="">
                全部
            </option>
            <option value="0">待审核</option>
            <option value="1">已审核</option>
        </select>
        <span style="line-height: 45px;margin-right: 10px">选择用户:</span>
        <select class="inp-3" id="inp-6" name="type">
        </select>
        <button class="query" id="query">查询</button>
    </div>
</div>

<!-- 表格 -->
<table class="table table-striped" id="table">
    <thead>
    <tr id="tr" style="text-align: center"></tr>
    </thead>
    <tbody></tbody>
</table>
<div id="layui-table-page1">
    <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1"><a href="javascript:;"
                                                                                       class="layui-laypage-prev layui-disabled"
                                                                                       data-page="0"><i
                    class="layui-icon"></i></a><span
                class="layui-laypage-skip">到第<input type="text" min="1" value="1" class="layui-input">页<button
                    type="button" class="layui-laypage-btn">确定</button></span><span
                class="layui-laypage-count">共 48 条</span><span class="layui-laypage-limits"></span></div>
</div>
<!-- 分页 -->
<div class="page">
    <ul class="pagination"></ul>
</div>

<!-- 弹框 -->
<!-- 背景 -->
<div id="bg" style="display: none;"></div>
<!-- 修改弹框 -->
<div id="modify" style="display: none;  font-weight: bolder">
    <div style="line-height: 50px;">信息修改</div>
    <div class="item"><span>项目编号:</span><input type="text" id="progCodeM"></div>
    <div class="item"><span>甲方单位:</span><input type="text" id="jiaUnitM"></div>
    <div class="item"><span>中标单位:</span><input type="text" id="zhongUnitM"></div>
    <div class="item"><span>中标金额:</span><input type="text" id="bidNumM"></div>
    <div class="item"><span>折扣金额:</span><input type="text" id="disNumM"></div>
    <button class="but" id="saveModify">保存</button>
    <button class="but" id="cancal">取消</button>
</div>
<!-- 添加弹框 -->
<div id="add">
    <div style="line-height: 50px;">添加中标单位</div>
    <div class="item"><span>中标单位:</span><input type="text" id="zhongUnitA"></div>
    <div class="item"><span>中标金额:</span><input type="text" id="bidNumA"></div>
    <div class="item"><span>折扣金额:</span><input type="text" id="disNumA"></div>
    <button class="but" id="saveAdd">保存</button>
    <button class="but" id="canca">取消</button>
</div>
<!-- 删除弹框 -->
<div id="remove">
    <div style="line-height: 50px;">确定删除?</div>
    <button class="but" id="Determine">确定</button>
    <button class="but" id="canc">取消</button>
</div>
<script>


    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
    var pageLength=""//总长度
    var currentLength=1//当前页码
    var SelectData = ""
    var SelectTime = ""//初始化时间
    var SelectIndex = null//选择审核状态下标
    SelectTime = new Date().format("yyyy-MM-dd");

    $('#query').on('click', function () {
        getList()
    })

    $('#test1').val(SelectTime)


    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
            , done: function (value, date, endDate) {
                SelectTime = value //得到日期生成的值，如：2017-08-18
                console.log(SelectTime)
            }
        });
    });

    $('.inp-2').change(function () { //下拉框选择筛选时间下标
        SelectIndex = $('.inp-2').prop('value')
    })
    var tablehead = [
        "序号",
        "发布日期",
        "项目编号",
        "项目名称",
        "省份",
        "城市",
        "甲方单位",
        "中标单位",
        "中标金额",
        "折扣金额",
        "千里马链接",
        "审核状态",
        "操作"]
    var list = null;
    var studsattribute = [
        "id",
        "publishDate",
        "progCode",
        "progName",
        "province",
        "city",
        "jiaUnit",
        "zhongUnit",
        "bidNum",
        "disNum",
        "url",
        "status"];
    // 初始化
    window.onload = async function () {
        var data = await getUser()
        var tabel = await getList();
    }

    function getUser() {
        //console.log("getUser")
        //里面获取数据
        $.ajax({
                url: 'showUser',
            type: 'get',
            data: {
                userGroup: '人民邮电'
            },
            dataType: "json",
            xhrFields: {withCredentials: true},
            crossDomain: true,
            success: (res) => {
                SelectData = res.data[0]
                console.log(SelectData)
                //getList(SelectData)

                $.each(res.data, function (index, item) {
                    var userlist = document.createElement('option')
                    userlist.value = item
                    userlist.innerHTML = item
                    $('.inp-3').append(userlist)

                })
            },
            error(error) {

            }
        })
    }

    //添加选择用户id事件
    $('#test1').click(function(e){
        e.preventDefault()
    })
    $('.inp-3').change(function () {
        SelectData = $('.inp-3').prop('value')
        console.log(SelectData)
    })

    function getList() {
        /*var userId = ($('.inp-3>option:checked').text());
        var status = $(".inp-2>option:checked").text();
        if($.trim(status) == '全部') status = '';
        if($.trim(status) == '待审核') status = 'false';
        if($.trim(status) == '已审核') status = 'true';*/

        //里面获取数据
        $.ajax({
            url: 'showDataList',
            type: 'get',
            data: {
                userid: SelectData,
                pageNum: currentLength,
                pageSize: 30,
                dateFormat: SelectTime,
                status: SelectIndex
            },
            dataType: "json",
            xhrFields: {withCredentials: true},
            crossDomain: true,
            success: (res) => {
                console.log(pageLength)
                pageLength=res.count
                $('.layui-laypage-count').text('共'+Math.floor(pageLength/30)+'页')
                layui.use('laypage', function(){
                    var laypage = layui.laypage;

                    //执行一个laypage实例
                    laypage.render({
                        elem: 'layui-table-page1' //注意，这里的 test1 是 ID，不用加 # 号
                        ,count:pageLength  //数据总数，从服务端得到
                        ,curr:currentLength
                        ,limit:30
                        ,jump: function(obj, first){
                        //obj包含了当前分页的所有参数，比如：
                        currentLength=obj.curr; //得到当前页，以便向服务端请求对应页的数据。
                        //首次不执行
                        if(!first){
                            getList()
                            //do something
                        }
                    }
                    });
                });
                list = res.data;
                console.log(list);
                reload(tablehead, list);
            },
            error(error) {

            }
        })
    }

    function reload(tablehead, list) {

        var tr_heads = "";
        for (var i = 0; i < tablehead.length; i++) {
            tr_heads += "<th>" + tablehead[i] + "</th>"
        }
        document.getElementById("table").innerHTML = "<thead><tr>" + tr_heads + "</tr></thead>"

        //添加新增数据
        for (var k = 0; k < list.length; k++) {
            var tr = document.createElement("tr");
            var table = document.getElementById("table")
            table.appendChild(tr);
            for (var j = 0; j < studsattribute.length; j++) {
                var td = document.createElement("td");
                td.setAttribute("class", "text-center");
                if (studsattribute[j] == "url") {
                    if(list[k][studsattribute[j]]){
                        list[k][studsattribute[j]] = "<a href='" + list[k][studsattribute[j]] + "' target='_blank'>查看详情</a>";
                    }else{
                        list[k][studsattribute[j]] = "<p class='title'>暂无</p>";
                    }
                } else if (studsattribute[j] == "status") {
                    if (list[k][studsattribute[j]] == true) {
                        list[k][studsattribute[j]] = "已审核";
                    } else {
                        list[k][studsattribute[j]] = "<button type='button' onclick='passHandler(this)'>通过</button>";
                    }

                }
                td.innerHTML = list[k][studsattribute[j]];
                tr.appendChild(td);
            }
            // 创建 button 按钮
            var td_last = document.createElement("td");
            td_last.setAttribute("class", "text-center");
            var button = document.createElement("button");
            var but = document.createElement("button");
            var btn = document.createElement("button");
            button.setAttribute("class", "btn bg-default");
            but.setAttribute("class", "btn bg-default");
            btn.setAttribute("class", "btn bg-default");
            but.style.fontSize=16+'px'
            but.innerHTML = "修改";
            btn.innerHTML = "添加中标单位";
            button.innerHTML = "删除";

            // 删除事件
            button.onclick = function (event) {
                bg.style.display = "block"
                remove.style.display = "block"
                target = event.target;
                t = target.parentNode.parentNode;
                first = t.firstChild.textContent;
                Delete(first);
                console.log(first)
                // alert(first);
                // table.removeChild(t);
            };

            // 修改
            but.onclick = function (event) {
                bg.style.display = "block"
                modify.style.display = "block"
                target = event.target;
                t = target.parentNode.parentNode;
                first = t.firstChild.textContent;
                $.ajax({
                    url: 'showDataDetail',
                    type: 'get',
                    data: {
                        id: first
                    },
                    dataType: "json",
                    xhrFields: {withCredentials: true},
                    crossDomain: true,
                    success: (res) => {
                        progCodeM.value = res.data.progCode
                        jiaUnitM.value = res.data.jiaUnit
                        zhongUnitM.value = res.data.zhongUnit
                        bidNumM.value = res.data.bidNum
                        disNumM.value = res.data.disNum
                    },
                    error(error) {

                    }
                })
                saveModify.onclick = function (e) {
                    bg.style.display = "none"
                    modify.style.display = "none"
                    progCode = progCodeM.value
                    jiaUnit = jiaUnitM.value
                    zhongUnit = zhongUnitM.value
                    bidNum = bidNumM.value
                    disNum = disNumM.value
                    $.ajax({
                        url: 'update',
                        type: 'post',
                        data: {
                            id: first,
                            progCode,
                            jiaUnit,
                            zhongUnit,
                            bidNum,
                            disNum,
                            modifyUser: username.value
                        },
                        dataType: "json",
                        xhrFields: {withCredentials: true},
                        crossDomain: true,
                        success: (res) => {
                            console.log(res)

                            var tr_heads = "";
                            for (var i = 0; i < tablehead.length; i++) {
                                tr_heads += "<th>" + tablehead[i] + "</th>"
                            }
                            document.getElementById("table").innerHTML = "<thead><tr>" + tr_heads + "</tr></thead>"
                            getList();

                        },
                        error(error) {

                        }
                    })
                }

            };
            // 取消修改
            cancal.onclick = function () {
                bg.style.display = "none"
                modify.style.display = "none"
            };
            // 添加单位
            btn.onclick = function (event) {
                bg.style.display = "block"
                add.style.display = "block"
                target = event.target;
                t = target.parentNode.parentNode;
                first = t.firstChild.textContent;
                Save(first)


            };

            function Save(id) {
                saveAdd.onclick = function (event) {
                    bg.style.display = "none"
                    add.style.display = "none"
                    zhongUnit = zhongUnitA.value;
                    bidNum = bidNumA.value;
                    disNum = disNumA.value;
                    console.log(id, zhongUnit, bidNum, disNum)
                    $.ajax({
                        url: 'add',
                        type: 'post',
                        data: {
                            id,
                            zhongUnit,
                            bidNum,
                            disNum,
                            modifyUser: username.value
                        },
                        dataType: "json",
                        xhrFields: {withCredentials: true},
                        crossDomain: true,
                        success: (res) => {
                            console.log(res);
                             zhongUnitA.value='';
                            bidNumA.value='';
                            disNumA.value='';
                            //刷新页面
                            var tr_heads = "";
                            for (var i = 0; i < tablehead.length; i++) {
                                tr_heads += "<th>" + tablehead[i] + "</th>"
                            }
                            document.getElementById("table").innerHTML = "<thead><tr>" + tr_heads + "</tr></thead>"
                            getList();

                        },
                        error(error) {

                        }
                    })
                }
            }

            // 取消添加
            canca.onclick = function () {
                bg.style.display = "none"
                add.style.display = "none"
            };
            // 取消删除
            canc.onclick = function () {
                bg.style.display = "none"
                remove.style.display = "none"
            };

            // 确定删除
            function Delete(id) {
                Determine.onclick = function () {
                    bg.style.display = "none"
                    remove.style.display = "none"
                    $.ajax({
                        url: 'del',
                        type: 'post',
                        data: {
                            id: id,
                            modifyUser: username.value
                        },
                        dataType: "json",
                        xhrFields: {withCredentials: true},
                        crossDomain: true,
                        success: (res) => {
                            console.log(res);

                            //刷新页面
                            var tr_heads = "";
                            for (var i = 0; i < tablehead.length; i++) {
                                tr_heads += "<th>" + tablehead[i] + "</th>"
                            }
                            document.getElementById("table").innerHTML = "<thead><tr>" + tr_heads + "</tr></thead>"
                            getList();

                        },
                        error(error) {

                        }
                    })
                };
            }


            td_last.appendChild(but);
            td_last.appendChild(btn);
            td_last.appendChild(button);
            tr.appendChild(td_last);
        }

    };

    // 添加td
    for (var i = 0; i < tablehead.length; i++) {
        var tr_head = document.getElementById("tr")
        var th = document.createElement("th");
        th.innerHTML = tablehead[i];
        tr_head.appendChild(th);
    }


    // 分页
    let currentPage = 1;
    let pageSize = 3;

    function render() {
        $.ajax({
            url: "./setPage.php",
            data: {
                page: currentPage,
                pageSize: pageSize
            },
            dataType: "json",
            success: function (result) {
                // 将数据渲染到页面
                $("tbody").html(template("tableTemp", {item: result}))
                // 调用分页函数.参数:当前所在页, 总页数(用总条数 除以 每页显示多少条,在向上取整), ajax函数
                setPage(currentPage, Math.ceil(result[0].size / pageSize), render)
            }
        })
    }

    // render()
    /**
     *
     * @param pageCurrent 当前所在页
     * @param pageSum 总页数
     * @param callback 调用ajax
     */
    function setPage(pageCurrent, pageSum, callback) {
        $(".pagination").bootstrapPaginator({
            //设置版本号
            bootstrapMajorVersion: 3,
            // 显示第几页
            currentPage: pageCurrent,
            // 总页数
            totalPages: pageSum,
            //当单击操作按钮的时候, 执行该函数, 调用ajax渲染页面
            onPageClicked: function (event, originalEvent, type, page) {
                // 把当前点击的页码赋值给currentPage, 调用ajax,渲染页面
                currentPage = page
                callback && callback()
            }
        })
    }

    /*通过按钮*/
    function passHandler(that) {
        var id = that.parentNode.parentNode.childNodes[0].textContent;
        $.ajax({
            url: 'updateStatus',
            type: 'post',
            data: {
                id: id,
                modifyUser: username.value
            },
            dataType: "json",
            xhrFields: {withCredentials: true},
            crossDomain: true,
            success: (res) => {
                // document.getElementById("table").querySelector('tbody').innerHTML = "";
                var tr_heads = "";
                for (var i = 0; i < tablehead.length; i++) {
                    tr_heads += "<th>" + tablehead[i] + "</th>"
                }
                document.getElementById("table").innerHTML = "<thead><tr>" + tr_heads + "</tr></thead>"
                getList();
            },
            error(error) {

            }
        })
        //console.dir(that.parentNode.parentNode.childNodes[0].textContent);
    }


</script>
</body>

</html>