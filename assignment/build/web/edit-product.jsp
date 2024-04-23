<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : create-pizza
    Created on : Feb 25, 2024, 7:20:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorig
              <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="CSS/HomeStaff.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>
    <%@include file="header.jsp" %>
    <div class="container">
    <br/>

        <h1>Edit Pizza</h1>
        <th:set var="product" value="${requestScope.product}" />

        <form action="./edit-product" method="post">
            <table>

                <tbody>
                    <input type="hidden" name="productId" value="${product.productId}" />
                    <tr>
                        <td>Pizza Name</td>
                        <td><input type="text" name="productName" value="${product.productName}" required/></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="unitPrice" value="${product.unitPrice}"  required /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quantityPerUnit" value="${product.quantityPerUnit}" required /></td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="categoryId" required>
                                <th:forEach items="${categories}" var="category">
                                    <th:if test="${category.categoryId.equals(product.category.categoryId) }">
                                        <option value="${category.categoryId}" selected>${category.categoryName}</option>
                                    </th:if>
                                    <option value="${category.categoryId}" >${category.categoryName}</option>

                                </th:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Supplier</td>
                        <td>
                            <select name="supplierId" required>
                                <th:forEach items="${suppliers}" var="supplier">
                                    <th:if test="${supplier.supplierId.equals(product.supplier.supplierId) }">
                                        <option value="${supplier.supplierId}" selected>${supplier.companyName}</option>
                                    </th:if>
                                    <option value="${supplier.supplierId}" >${supplier.companyName}</option>

                                </th:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Image Url</td>
                        <td><input type="text" name="productImage" required value="${product.productImage}"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Edit" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    </body>
</html>
