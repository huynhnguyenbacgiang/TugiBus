<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url var="home" value="/" />
<c:url var="adminIndex" value="/admin" />
<c:url var="point" value="/admin/points" />
<c:url var="line" value="/admin/lines" />
<c:url var="trip" value="/admin/trips" />
<c:url var="vehicle" value="/admin/vehicles" />
<c:url var="user" value="/admin/users" />

<script src="<c:url value="/js/header.js" />"></script>
<div class="container-fluid">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="${home}">
            TuGi
            <i class="fas fa-bus-alt"></i>
        </a>
        <div class='menu-icon' onclick="handleClick()">
            <i class='fas fa-bars'></i>
        </div>
        <ul class="navbar-nav admin">
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${adminIndex}">Thống kê</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${point}">Địa điểm</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${line}">Tuyến xe</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${trip}">Chuyến xe</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${vehicle}">Xe</a>
            </li>
            <li class="nav-item active" onclick="closeNav()">
                <a class="nav-link" href="${user}">Người dùng</a>
            </li>
        </ul>
    </nav>
</div>
