<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2021
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${mgs == 'Success'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Thanh toán thành công !!!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>

<!DOCTYPE html>
<div class="schedule-container">
    <div class="ticket-container">
        <h1 class="title-page"> Chi tiết vé </h1>
        <div class="ticketdetail-container">
            <div class="ticketdetail-data-container">
                <div class="vehicle-detail-container">
                    <div>
                        <img class="bus-img ticketdetail" src="<c:url value="/images/xe-nha-1.png" />" />
                    </div>
                    <section class="card-cont">
                        <h3> Biển số xe: ${ticketDetail.vehicle.licensePlate}</h3>
                        <h3> Tài xế: ${ticketDetail.vehicle.driver.firstName} ${ticketDetail.vehicle.driver.firstName}</h3>
                        <h3> Khai thác tuyến: ${ticketDetail.ticket.trip.line.startPoint.address } => ${ticketDetail.ticket.trip.line.endPoint.address }</h3>
                    </section>

                </div>
                <article class="card-ticket-detail">
                    <section class="date-ticket-detail">
                        <time>
                            <span>Ghế</span>
                            <span>${ticketDetail.seatPosition}</span>
                        </time>
                    </section>
                    <section class="card-cont">
                        <small>Mã vé: ${ticketDetail.id}</small>
                        <h3>${ticketDetail.ticket.customer.firstName} ${ticketDetail.ticket.customer.lastName}</h3>
                        <div class="even-date">
                            <i class="fa fa-calendar"></i>
                            <time>
                                <span>Khởi hành: ${ticketDetail.ticket.trip.startTime}</span>
                                <span>Thời gian quãng đường: ${ticketDetail.ticket.trip.line.time}h</span>
                            </time>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-map-marker"></i>
                            <p>
                                ${ticketDetail.ticket.trip.line.startPoint.address} => ${ticketDetail.ticket.trip.line.endPoint.address}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fas fa-money-bill"></i>
                            <p> Giá vé: ${ticketDetail.currentPrice}</p>
                        </div>
                    </section>
                    <section class="card-cont tag">
                        <p>
                            Tugi
                        </p>
                    </section>
                </article>
                <!-- C:if -->
                <div class="alert alert-success" style="margin-top: 1em " role="alert">
                    Bạn đã đánh giá chuyến xe này!
                </div>
                <button class="btn btn-success btn-block btn-lg gradient-custom-4 text-white" style="margin-top: 1em "
                        data-toggle="modal" data-target="#feedbackModal"> Viết đánh giá </button>
            </div>

            <!-- Feedback Modal -->
            <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="feedbackModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Viết đánh giá</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="createPlaceForm" method="post" action="" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="form-group" style="display: none">
                                    <label for="tripId" class="col-form-label">id</label>
                                    <input type="text" class="form-control" id="tripId" name="tripId" value="${ticketDetail.ticket.trip.id}" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="tripName" class="col-form-label">Tên chuyến</label>
                                    <input type="text" class="form-control" id="tripName"value="${ticketDetail.ticket.trip.name}" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="Textarea">Đánh giá của bạn</label>
                                    <textarea class="form-control" id="Textarea" name="feedback" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <input type="submit" class="btn btn-primary" value="Gửi đánh giá">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>