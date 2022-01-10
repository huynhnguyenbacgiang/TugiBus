<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/17/2021
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="searchLine" value="/lines"/>

<!DOCTYPE html>
<div class="schedule-container">
    <h1 class="title-page">Các tuyến xe</h1>
    <form class="book-ticket-container schedule" action="${searchLine}" method="get">
        <div class="select-container schedule">
            <div class="select-place-container schedule">
                <div class="auto-fill-place">
                    <label class="label-small">Điểm đi</label>
                    <select class="form-control selectpicker place" name="sPoint">
                        <option value="null">       </option>
                        <c:forEach var="p" items="${points}">
                            <option value="${p.id}">${p.address}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="auto-fill-place">
                    <label class="label-small">Điểm đến</label>
                    <select class="form-control selectpicker place" name="ePoint">
                        <option value="null">       </option>
                        <c:forEach var="p" items="${points}">
                            <option value="${p.id}">${p.address}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <Button type="submit" class="btn btn-primary search">TÌM TUYẾN</Button>
    </form>
    </div>
    <div class="schedule-scroll">
        <div class="schedule-table">
            <table>
                <thead>
                    <tr class="table-head">
                        <th class="schedule-route-name"> Tuyến xe </th>
    <%--                    <th class="date"> Ngày khởi hành </th>--%>
    <%--                    <th class="time"> Giờ khởi hành </th>--%>
                        <th class="prize"> Giá vé </th>
                        <th class="end"> </th>
                    </tr>
                </thead>
            </table>
            <div>
            <c:if test="${lines.size() > 0}">
            <c:forEach var="lSP" items="${lines}">
                <table class="group-table">
                    <thead>
                    <tr>
                        <th colSpan="10" class="start-place-title">${lSP.key.address} đi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lEP" items="${lSP.value}">
                        <tr class="table-data">
                            <th class="schedule-route-name">${lEP.endPoint.address}</th>
<%--                            <th class="date"> 19/10/2021</th>--%>
<%--                            <th class="time"> 5h30 </th>--%>
                            <th class="price"> ${lEP.price} </th>
                            <th class="end"> <a href="<c:url value="/line/${lEP.id}/trips" />">Xem Chuyến</a> </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:forEach>
            </c:if>
            <c:if test="${line != null}">
                <table class="group-table">
                    <tbody>
                        <tr class="table-data">
                            <th class="schedule-route-name">
                                    ${line.startPoint.address} - ${line.endPoint.address}
                            </th>
                            <th class="price"> ${line.price} </th>
                            <th class="end"> <a href="#">Xem các chuyến</a> </th>
                        </tr>
                    </tbody>
                </table>
            </c:if>
            </div>
        </div>

    </div>
</div>