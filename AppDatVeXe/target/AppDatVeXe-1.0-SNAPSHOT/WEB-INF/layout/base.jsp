<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<%--        <meta charset="utf-8" />--%>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title><tiles:insertAttribute name="title" /></title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>


        <link href="<c:url value="/css/base.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/header.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/footer.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/index.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/schedule.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/ticket.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/payment.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/admin.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/profile.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/ticketdetail.css" />" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <tiles:insertAttribute name="header" />

        <tiles:insertAttribute name="content" />

        <tiles:insertAttribute name="footer" />

    </body>

</html>