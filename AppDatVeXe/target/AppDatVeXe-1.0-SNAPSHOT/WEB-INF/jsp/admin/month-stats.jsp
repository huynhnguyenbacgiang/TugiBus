<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />

<fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
<c:url var="stats" value="/admin/month-stats" />

<!DOCTYPE html>

<div id="content">
    <h1 class="title-page">THỐNG KÊ VÉ THEO THÁNG / NĂM</h1>

    <div class="month-stats-container">
        <form method="get" action="${stats}">
            <div class="form-group month-stats">
                <label for="year" class="col-form-label">Nhập năm: </label>
                <input type="text" class="form-control month-stats" id="year" name="year">
                <button type="submit" class="btn btn-outline-info">Thống kê</button>
            </div>
        </form>
<%--        <button type="button" class="btn">--%>
<%--           <a href="${stats}<c:out value="${currentYear - 1}" />"><c:out value="${currentYear - 1}" /></a>--%>
<%--        </button>--%>
<%--        <button type="button" class="btn">--%>
<%--            <a href="${stats}<c:out value="${currentYear}" />"><c:out value="${currentYear}" /></a>--%>
<%--        </button>--%>
<%--        <button type="button" class="btn">--%>
<%--            <a href="${stats}<c:out value="${currentYear + 1}" />"><c:out value="${currentYear + 1}" /></a>--%>
<%--        </button>--%>
    </div>

    <c:if test="${monthStats != null}">
    <div class="admin-line row">
        <div class="col-md-4">
            <div class="admin-stats">
                <canvas id="myMonthStatsChart"></canvas>
            </div>
        </div>
        <div class="col-md-8">
            <table class="table">
                <tr>
                    <th>Tháng-năm</th>
                    <th>Số lượng vé đã bán được</th>
                </tr>
                <c:forEach items="${monthStats}" var="m">
                    <tr>
                        <td>${m[0]}-${m[1]}</td>
                        <td>${m[2]}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <script>
        let monthLabels=[], monthInfo=[];
        <c:forEach items="${monthStats}" var="m">
            monthLabels.push('Tháng ${m[0]}')
            monthInfo.push(${m[2]})
        </c:forEach>

        window.onload = function() {
            monthChart("myMonthStatsChart", monthLabels, monthInfo)
        }
    </script>
    </c:if>
</div>

