<%--
    Document   : orderpage
    Created on : Feb 26, 2024, 8:38:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorig
              <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="CSS/HomeStaff.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <br/>
            <h1>Sales Report</h1>
            <br/>
            <br/>
            <form method="post" action="./sales-report">
                <label>From Date</label>
                <input type="date" name="fromDate" value="${param.fromDate}" required/>
                <label>To Date</label>
                <input type="date" name="toDate" value="${param.toDate}" required/>
                <input type="submit" value="Search"/>
            </form>
            <br/><br/>
            <th:if test="${message != null}">
                <p>${message}</p>
            </th:if>

            <th:if test="${salesReport != null}">
                <br/>
                <table>

                    <tr >
                        <th style="padding: 5px 10px;">OrderId</th>
                        <th style="padding: 5px 10px;">Order Date</th>
                        <th style="padding: 5px 10px;">Total Sales</th>

                    </tr>
                    <c:set var="totalSales" value="0" />
                    <c:forEach items="${salesReport}" var="salesReportItem">
                        <tr style="border-bottom: #777777 1px solid">
                            <td style="padding: 5px 10px;">${salesReportItem.orderId}</td>
                            <td style="padding: 5px 10px;">${salesReportItem.orderDate}</td>
                            <td style="padding: 5px 10px;">${salesReportItem.totalSales}</td>
                            <c:set var="totalSales" value="${totalSales + salesReportItem.totalSales}" />
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" style="text-align: right; font-weight: bold;">Total Sales:</td>
                        <td style="font-weight: bold;">${totalSales}</td>
                    </tr>
                </table>
            </th:if>
        </div>
    </body>
</html>
