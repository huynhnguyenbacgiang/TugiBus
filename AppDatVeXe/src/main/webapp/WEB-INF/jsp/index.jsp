<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/trip" var="searchTrip" />

<!DOCTYPE html>
<div class="hero-container">
    <img class="main-img" src="<c:url value="/images/img-10.jpg"/>" alt="anh" >
</div>
<c:if test="${mgsSearchtrip == false}">
<h1>KHÔNG TÌM THẤY CHUYẾN PHÙ HỢP</h1>
</c:if>
<div class="book-ticket">
    <form class="book-ticket-container" action="${searchTrip}" method="get">
        <div class="select-container">
            <div class="select-place-container">
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
            <div class="select-date-container">
                <div class="select-date">
                    <label class="label-small">Ngày đi</label>
                    <input class="form-control input-date" type="date" name="sDate">
                </div>
            </div>
        </div>
        <Button type="submit" class="btn btn-primary search">TÌM CHUYẾN</Button>
    </form>
</div>
<div class='cards'>
    <h2>NHỮNG TUYẾN ĐI PHỔ BIẾN</h2>
    <div class='cards__container'>
        <div class='cards__wrapper'>
            <ul class='cards__items'>
                <c:forEach var="l" begin="0" end="1" items="${poline}">
                    <li class='cards__item'>
                        <a class='cards__item__link' href="#">
                            <figure class='cards__item__pic-wrap' data-category="${l.startPoint.address} => ${l.endPoint.address}">
                                <img
                                        class='cards__item__img'
                                        alt='Travel Image'
                                        src="${l.endPoint.picture}"/>"
                                />
                            </figure>
                            <div class='cards__item__info'>
                                <label class='cards__item__text'>
                                    <i class="fas fa-map-marker-alt"></i>
                                        ${l.kilometer}km
                                </label>
                                <label class='cards__item__text'>
                                    <i class="fas fa-clock"></i>
                                        ${l.time}h
                                </label>
                                <label class='cards__item__text'>
                                    <i class="fas fa-money-bill-wave"></i>
                                    ${l.price}
                                </label>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <ul class='cards__items'>
                <c:forEach var="l" begin="2" end="4" items="${poline}">
                    <li class='cards__item'>
                        <a class='cards__item__link' href="#">
                            <figure class='cards__item__pic-wrap' data-category="${l.startPoint.address} => ${l.endPoint.address}">
                                <img
                                        class='cards__item__img'
                                        alt='Travel Image'
                                        src="${l.endPoint.picture}"/>"
                                />
                            </figure>
                            <div class='cards__item__info'>
                                <label class='cards__item__text'>
                                    <i class="fas fa-map-marker-alt"></i>
                                        ${l.kilometer}km
                                </label>
                                <label class='cards__item__text'>
                                    <i class="fas fa-clock"></i>
                                        ${l.time}h
                                </label>
                                <label class='cards__item__text'>
                                    <i class="fas fa-money-bill-wave"></i>
                                        ${l.price}
                                </label>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<div class="tugi-quality-honor">
    <div class="title-container">
        <label class="title">TUGI - Chất lượng là danh dự</label>
    </div>
    <div class="summary">
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/group.svg"/>" alt="group" />
            <div class="text">
                <p class="summary-title">20M</p>
                <p class="subtitle">Hơn 20 triệu lượt khách</p>
                <p class="des">Tư Giang phục vụ hơn 20 triệu lượt khách/bình quân 1 năm trên toàn quốc</p>
            </div>
        </div>
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/ticketing.svg"/>" alt="ticketing" />
            <div class="text">
                <p class="summary-title">250</p>
                <p class="subtitle">Hơn 250 phòng vé, phòng hàng</p>
                <p class="des">Tư Giang có hơn 250 phòng vé, trạm trung chuyển, bến xe... trên toàn hệ thống</p>
            </div>
        </div>
        <div class="summary-item">
            <img class="summary-icon" src="<c:url value="images/svg/bus.svg"/>" alt="bus" />
            <div class="text">
                <p class="summary-title">1,600</p>
                <p class="subtitle">Hơn 1,600 chuyến mỗi ngày</p>
                <p class="des">Tư Giang phục vụ hơn 1600 chuyến xe đường dài và liên tỉnh mỗi ngày</p>
            </div>
        </div>

    </div>
</div>

