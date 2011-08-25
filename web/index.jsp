<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Aug 25, 2011, 6:20:28 AM
    Author     : rahulbaxi
--%>
<sql:query var="subjects" dataSource="jdbc/Academy">
    SELECT id,name FROM subject
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academy Home</title>
        <link rel ="stylesheet" type="text/css" href="style.css" >
    </head>
    <body>
        <h2>Welcome to <strong>Academy</strong>, the International Former
            Professional Wrestlers' Association for Counseling and Development!
        </h2>
        <table border="0">
            <thead>
                <tr>
                    <th>Academy offers expert counseling in a wide range of fields.</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view the contact details of an IFPWAFCAD certified former
                        professional wrestler in your area, select a subject below:</td>
                </tr>
                <tr>
                    <td>
                        <form action="response.jsp">
                            <strong>Select a subject:</strong>
                            <select name="subject_id">
                                <c:forEach var="row" items ="${subjects.rows}">
                                    <option value="${row.id}">${row.name}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Submit" />
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
