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

<c:url var="payment" value="/pay/momo"/>
<c:url var="signin" value="/signin"/>
<c:if test="${mgs != null}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${mgs}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<!DOCTYPE html>
<c:if test="${trip == null}"><h1 class="text-danger" style="text-align: center">Không có chuyến</h1></c:if>
<c:if test="${trip != null}">
<div class="ticket-container">
    <h1 class="title-page"> thông tin chuyến </h1>
    <div class="ticket-data-container">
        <div class="ticket-data">
            <h3 class="start-place-title">${trip.startTime.date}</h3>
            <h3 class="trip-star-place"> Khởi hành : ${trip.line.startPoint.address} </h3>
            <h3 class="trip-destination"> Điểm đến : ${trip.line.endPoint.address} </h3>
            <h3>Số ghế : ${trip.driver.vehicles[0].seat}</h3>
            <h3>Tổng tiền</h3>
            <h3 class="start-place-title">${trip.line.price + trip.extra_changes + trip.driver.vehicles[0].extraChanges}</h3>
            <img class="bus-img" src="<c:url value="/images/xe-nha-1.png" />" />
        </div>
        <div class="sit-position">
            <h3 class="start-place-title">Sơ đồ ghế</h3>
            <div class="seat-table-container">
                    <%-- Hiển thị các ghế ở đây --%>
                <div class="seat-table">
                    <c:forEach var="s" items="${seats}">
                        <c:choose>
                            <c:when test="${s.value == true}">
                            <button class="booked-seat" disabled>
                                <img class="seat-icon" src="<c:url value="/images/svg/account.svg" />" />
                                <p class="seat-id">${s.key}</p>
                            </button>
                            </c:when>
                            <c:when test="${s.value == false}">
                            <button class="empty-seat" onclick="seatSelected(${s.key})">
                                <img class="seat-icon" src="<c:url value="/images/svg/account.svg" />" />
                                <p class="seat-id">${s.key}</p>
                            </button>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
                        <%--  Hình minh họa  --%>
                <div class="seat-statuses">
                    <div class="status-item">
                        <div class="empty-seat-icon-small-background">
                            <img class="seat-icon-small" src="<c:url value="/images/svg/account.svg" />" />
                        </div>
                        <div class="status-name">Trống</div>
                        <div class="booked-seat-icon-small-background">
                            <img class="seat-icon-small" src="<c:url value="/images/svg/account.svg" />" />
                        </div>
                        <div class="status-name">Đã đặt</div>
                    </div>
                </div>
                <div class="selected-seat-container">
                </div>
            </div>
        </div>
    </div>
    <div id="booking" style="display: none">
        <c:choose>
        <c:when test="${user == null}">
            <%--                <label for="fullName">Họ và tên</label>--%>
            <%--                <input class="form-control" type="text" name="fullName" id="fullName">--%>
            <%--                <label for="phone">Số điện thoại</label>--%>
            <%--                <input class="form-control" type="text" pattern="^[0-9\-\+]{10,11}$" name="phone" id="phone">--%>
            <p class="text-danger">Vui lòng đăng nhập trước khi đặt vé</p>
            <a href="${signin}" class="btn btn-primary">Đi đến đăng nhập</a>
        </c:when>
        <c:when test="${user != null}">
            <div class="book-ticket-container seat-payment">
                <h1 class="text-container ticket">Thông tin vé</h1>
                <form class="form-book-ticket-seat" action="${payment}" method="get">
                    <label for="trip">Chuyến</label>
                    <input class="form-control" type="hidden" name="trip" value="${trip.getId()}">
                    <input class="form-control" disabled
                           value="${trip.line.startPoint.address}-${trip.line.endPoint.address}">

                    <label for="price">Tiền vé</label>
                    <input class="form-control" type="hidden" name="price"
                           value="${trip.line.price + trip.extra_changes + trip.driver.vehicles[0].extraChanges}">
                    <input class="form-control"  disabled
                           value="${trip.line.price + trip.extra_changes + trip.driver.vehicles[0].extraChanges}">

                    <label for="seatPosition">Vị trí ghế</label>
                    <input class="form-control " type="hidden" name="seatPosition" id="seatPositionHidden">
                    <input class="form-control " id="seatPositionView" disabled>

                    <input type="hidden" name="userId" id="userId" value="${user.getId()}">
                    <label for="fullName">Họ và tên</label>
                    <input class="form-control" type="text" name="fullName" id="fullName" disabled
                           value="${user.getFirstName()} ${user.getLastName()}" >
                    <label for="phone">Số điện thoại</label>
                    <input class="form-control" type="text" pattern="^[0-9\-\+]{10,11}$" name="phone" id="phone"
                           value="${user.getNumberPhone()}" disabled>
                    <p class="text-danger">Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15'</p>
                    <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-white">Đặt vé</button>
                </form>
            </div>
        </c:when>
        </c:choose>
    </div>
</div>
</c:if>
<script src="<c:url value="/js/bookticket.js" />"></script>
