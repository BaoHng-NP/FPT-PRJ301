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
    </head>
    <body>
    <%@include file="header.jsp" %>
    <br/><br/>

        <h1>Create Pizza</h1>
    <br/><br/>

        <form action="./create-pizza" method="post">
            <table>

                <tbody>
                    <tr>
                        <td>Pizza Name</td>
                        <td><input type="text" name="productName" required/></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="unitPrice" required /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quantityPerUnit" required /></td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="categoryId" required>
                                <th:forEach items="${categories}" var="category">
                                    <option value="${category.categoryId}">${category.categoryName}</option>
                                </th:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Supplier</td>
                        <td>
                            <select name="supplierId" required>
                                <th:forEach items="${suppliers}" var="supplier">
                                    <option value="${supplier.supplierId}">${supplier.companyName}</option>
                                </th:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Image Url</td>
                        <td><input type="text" name="productImage" required /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
