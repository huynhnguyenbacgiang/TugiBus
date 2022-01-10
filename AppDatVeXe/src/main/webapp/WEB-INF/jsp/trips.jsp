<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<div class="schedule-container">
    <h1 class="title-page">Các chuyến xe</h1>
    <div class="schedule-scroll">
        <c:choose>
            <c:when test="${trips.size() == 0}">
            <h2 class="text-danger" style="text-align: center" >Tuyến xe hiện không có chuyến nào</h2>
            </c:when>
            <c:when test="${trips.size() > 0}">
            <div class="schedule-table trip">
                <table>
                    <tr class="table-head">
                        <th class="schedule-route-name"> Chuyến xe </th>
                        <th class="date"> Thời gian khởi hành </th>
                        <th class="time"> Thời gian đến (dự kiến) </th>
                        <th class="prize"> Giá vé </th>
                        <th class="end">  </th>
                    </tr>
                    <c:forEach var="t" items="${trips}">
                    <tr class="table-data">
                        <th class="schedule-route-name"> ${t.name} </th>
                        <th class="date"> ${t.startTime} </th>
                        <th class="date"> ${t.endTime} </th>
                        <th class="price"> ${t.line.price + t.extra_changes} </th>
                        <th class="end"> <a href="<c:url value="/trip/${t.id}/book-ticket" />">Mua vé</a> </th>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            </c:when>
        </c:choose>
    </div>
</div>
