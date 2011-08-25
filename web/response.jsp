<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Aug 25, 2011, 6:32:56 AM
    Author     : rahulbaxi
--%>

<sql:query var="counselorQuery" dataSource="jdbc/Academy">
    select * from subject,counselor where
counselor.id = subject.FK_counselorID AND
subject.id = ? <sql:param value="${param.subject_id}" />
</sql:query>

    <c:set var="counselorDetails" value="${counselorQuery.rows[0]}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${counselorDetails.name}</title>
        <link rel ="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${counselorDetails.name}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${counselorDetails.description}</span></td>
                </tr>
                <tr>
                    <td><strong>Counselor: </strong></td>
                    <td><strong>${counselorDetails.firstname} ${counselorDetails.lastname}</strong>
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                            member since: ${counselorDetails.membersince}</span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Contact Details: </strong></td>
                    <td><strong>email: </strong>
                        <a href="mailto:{placeholder}">${counselorDetails.email}</a>
                        <br><strong>phone: </strong>${counselorDetails.telephone}
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
