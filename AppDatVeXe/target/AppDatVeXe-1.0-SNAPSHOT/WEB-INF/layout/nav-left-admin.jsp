<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrapper" style="display: inline">
    <!-- =================================================Sidebar=================================================== -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>${pageContext.request.userPrincipal.name}</h3>
        </div>
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link admin active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home"
               role="tab" aria-controls="v-pills-home" aria-selected="true">Tổng quan</a>
            <a class="nav-link admin" id="v-pills-line-tab" data-toggle="pill" href="#v-pills-line"
               role="tab" aria-controls="v-pills-line" aria-selected="false">Tuyến xe</a>
            <a class="nav-link admin" id="v-pills-trip-tab" data-toggle="pill" href="#v-pills-trip"
               role="tab" aria-controls="v-pills-trip" aria-selected="false">Chuyến xe</a>
            <a class="nav-link admin" id="v-pills-place-tab" data-toggle="pill" href="#v-pills-place"
               role="tab" aria-controls="v-pills-place" aria-selected="false">Địa điểm</a>
            <a class="nav-link admin" id="v-pills-user-tab" data-toggle="pill" href="#v-pills-user"
               role="tab" aria-controls="v-pills-user" aria-selected="false">Người dùng</a>
        </div>
    </nav>
</div>