<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/18/2021
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<div class="payment-container">
<%--    <h1 class="title-page"> Thanh toán vé</h1>--%>
<%--    <div class="ticket-data-container">--%>
<%--        <div class="ticket-data">--%>
<%--            <h3 class="start-place-title">21/10/2021</h3>--%>
<%--            <h3 class="trip-star-place"> Khởi hành : Hà Nội </h3>--%>
<%--            <h3 class="trip-destination"> Điểm đến : Sài Gòn </h3>--%>
<%--            <h3>Ghế Ngồi: A1 </h3>--%>
<%--            <h3>Tổng tiền:</h3>--%>
<%--            <h3 class="start-place-title">2 000 000</h3>--%>
<%--            <img alt="d" class="bus-img" src="<c:url value="/images/xe-nha-1.png" />" />--%>
<%--        </div>--%>
<%--        <div class="payment">--%>
<%--            <h3 class="start-place-title">Hình thức thanh toán</h3>--%>
<%--            <h3>Thanh toán qua ví điện tử Momo</h3>--%>
<%--            <div class="payment-type">--%>
<%--                <button>--%>
<%--                    <img alt="d" class="momo-image" src="<c:url value="/images/MoMo_Logo.png" />" />--%>
<%--                </button>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
    <section >
        <div class="container py-xl-5 py-lg-3">
            <div class="row">
                <c:if test="mgs != ''"><h1>${mgs}</h1></c:if>
                <div class="col">
                   <iframe src="${urlpayment}" width="100%" style="height: 60em"></iframe>
                </div>
            </div>
        </div>
    </section>
</div>
