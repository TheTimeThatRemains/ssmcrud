<%@ page isELIgnored="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- 引入标签库-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <!-- 设置页面域：在jsp里使用pageContext作用域定义一个attribute用来表示当前的项目名，这样再引用路径时就可以使用APP_PATH/路径了-->
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源是以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源是以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 搭建显示页面,用bootstrap分为四行 -->
<div class="container">
    <!-- 标题行 中等屏幕占12列-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD-GWG</h1>
        </div>
    </div>
    <!-- 按钮行 中等屏幕占四列偏移八列-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 显示表格数据行 中等屏幕-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <!-- 取出pageInfo中每一页的emp类型信息-->
                <c:forEach items="${pageInfo.list }" var="emp">
                    <tr>
                        <th>${emp.empId }</th>
                        <th>${emp.empName }</th>
                        <th>${emp.gender=="M"?"男":"女" }</th>
                        <th>${emp.email }</th>
                        <th>${emp.department.deptName }</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <!-- 显示分页信息行 中等屏幕-->
    <div class="row">
        <!--分页文字信息  中等屏幕占6列-->
        <div class="col-md-6">当前 ${pageInfo.pageNum}页,总${pageInfo.pages}页,总 ${pageInfo.total } 条记录</div>
        <!-- 分页条信息 中等屏幕占6列-->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
                    <!--判断是否有上一页，有则显示，没有则不显示-->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <!--如果取出的页码是当前页码，则处于激活状态-->
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <!--如果取出的页码不是当前页码，则显示普通没有高亮激活的状态，如果要访问则要获取参数发送页面请求-->
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>
                    <!--判断是否有下一页，有则显示，没有则不显示-->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <!--pageInfo.pages:总页数-->
                    <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>