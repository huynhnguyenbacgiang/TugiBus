<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<div id="content">
    <h1 class="title-page">THỐNG KÊ VÉ THEO CHUYẾN XE</h1>
    <div class="admin-line row">
        <div class="col-md-4">
            <div class="admin-stats">
                <canvas id="myTripStatsChart"></canvas>
            </div>
        </div>
        <div class="col-md-8">
            <table class="table">
                <tr>
                    <th>Mã chuyến xe</th>
                    <th>Tên chuyến</th>
                    <th>Số lượng vé đã bán được</th>
                </tr>
                <c:forEach items="${tripStats}" var="l">
                    <tr>
                        <td>${l[0]}</td>
                        <td>${l[1]}</td>
                        <td>${l[2]}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>


</div>

<script>
    let tripLabels=[], tripInfo=[];
    <c:forEach items="${tripStats}" var="t">
    tripLabels.push('${t[1]}')
    tripInfo.push(${t[2]})
    </c:forEach>

    window.onload = function() {
        tripChart("myTripStatsChart", tripLabels, tripInfo)
    }
</script>