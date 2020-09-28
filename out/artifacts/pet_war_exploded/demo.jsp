<%--
  Created by IntelliJ IDEA.
  User: tivon
  Date: 2020/9/24
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        var xml;
        window.onload=function (ev) {
            document.getElementById("btn").onclick=function (ev1) {

                if(window.XMLHttpRequest){
                    xml=new XMLHttpRequest();
                }else{
                    xml=new ActiveXObject("Microsoft.XMLHTTP");
                }
                //console.log(xml);
                //绑定回调函数
                xml.onreadystatechange=callback;
                //打开链接
                xml.open("post","demo",true);
                xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //发送数据
                xml.send("name=zhangsan&password=123456");

            }
        }
        function callback() {
            if(xml.readyState == 4){
                if(xml.status == 200){
                    var msg = xml.responseText;
                    alert(msg)
                }
            }
        }
    </script>
</head>
<body>
    <button id="btn">hahaha</button>
<form enctype="application/x-www-form-urlencoded">

</form>
</body>
</html>
