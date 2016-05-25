<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/newStyle/css/bootstrap.min.css"/>" />
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            color: #a7acb9;
            background-color: #404a59;
        }

        .row {
            margin-right: 0px;
            margin-left: 0px;
        }

        .top-row-cell {
            height: 200px;
            display: inline-block;
            vertical-align: top;
            text-align: center;
        }

        .top-row-title1 {
        }
        .top-row-title2 {
            color: #f3f3f3;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .top-row-bottom {
            position: absolute;
            bottom: 0;
            margin: 0 0 0 -15px;
            width: 100%;
        }
        .top-row-bottom p {
            vertical-align: top;
            text-align: center;
        }
        .bottom-row-title {
            font-size: 18px;
            font-weight: bold;
            color: #FFF;
            vertical-align: top;
            text-align: center;
        }
        .ico {
            min-width: 32px;
            max-width: 32px;
            min-height: 32px;
            max-height: 32px;
        }
        .progress {
            background-color: #404a59;
            border-radius: 3px;
            height: 14px;
            margin-bottom: 0;
        }
        .progress-bar {
            border-radius: 3px;
            line-height: 14px;
        }
    </style>
</head>
<body>

<!--上半部分 start-->
<div class="row">
    <div class="col-md-4 top-row-cell" >
        <p>&nbsp;</p>
        <h1 id="timer" class="top-row-title2"></h1>
        <p><fmt:formatDate value="${currentDate}" pattern="yyyy年MM月dd日 E"/></p>
        <div class="top-row-bottom">
            <p>B2B大数据精准营销 <b>创业板</b></p>
        </div>
    </div>
    <div class="col-md-4 top-row-cell" id="today_show">

    </div>
    <div class="col-md-4 top-row-cell" >
        <p>总计消费</p>
        <h1 class="top-row-title2">4809元</h1>
        <p>账户余额：191元</p>
        <div class="top-row-bottom">
            <p>预计明日消费：<b>0元</b></p>
        </div>
    </div>
</div>
<!--上半部分 end-->
<!--下半部分 start-->
<div class="row">
    <div class="col-md-4">
        <div class="bottom-row-title">今日广告曝光</div>
        <c:forEach items="${urls}" var="url">
            <div class="row">
                <div class="col-xs-2">
                    <img class="ico" src="http://${url.url}/favicon.ico"/>
                </div>
                <div class="col-xs-10">
                    <div class="row">${url.url}</div>
                    <div class="row">
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning" style="min-width: 2em;width: ${url.percent}%;line-height: 14px; ">
                                ${url.hit}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="col-md-8" id="map" style="height: 500px">

    </div>
</div>
<!--下半部分 end-->
<script>
    function getCurrentTime() {
        var date = new Date();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        if( minutes < 10) {
            minutes = "0" + minutes;
        }
        var seconds = date.getSeconds();
        if(seconds < 10) {
            seconds = "0" + seconds;
        }
        return hours + ":" + minutes + ":" + seconds;
    }

    var timer = document.getElementById("timer");
    timer.innerHTML = getCurrentTime();
    window.setInterval(function () {
        timer.innerHTML = getCurrentTime();
    }, 1000);
</script>
<script src="<c:url value="/newStyle/js/echarts.min.js"/>"></script>
<script src="<c:url value="/newStyle/js/china.js"/>"></script>
<script src="<c:url value="/newStyle/js/echarts-data.js"/>" charset="utf-8"></script>
</body>
</html>
