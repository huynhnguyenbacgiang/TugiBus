<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="lineStats" value="/admin/line-stats" />
<c:url var="tripStats" value="/admin/trip-stats" />
<c:url var="monthstats" value="/admin/month-stats" />

<!DOCTYPE html>

<div class="admin-statistic container">
    <div class="admin-buttons">
        <a href="${lineStats}">
            <button type="button" class="btn btn-outline-info">
                Thống kê vé theo tuyến xe
            </button>
        </a>

        <a href="${tripStats}">
            <button type="button" class="btn btn-outline-info">
                Thống kê vé theo chuyến xe
            </button>
        </a>

        <a href="${monthstats}">
            <button type="button" class="btn btn-outline-info">
                Thống kê vé theo tháng
            </button>
        </a>

    </div>

</div>