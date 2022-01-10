<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>

<c:url var="create" value="/add-line" />
<c:url var="update" value="/line-update" />
<c:url var="createT" value="/add-trip" />
<c:url var="updateT" value="/trip-update"/>
<c:url var="createP" value="/add-place"/>
<c:url var="updateP" value="place-update" />
<c:url var="createU" value="/create-user"/>
<c:url var="updateU" value="/update-user"/>

<script src="<c:url value="/js/admin.js" />"></script>
<c:if test="${result == 'sus'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <p>${mgs}</p>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<c:if test="${result == 'err'}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        ${mgs}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<div class="wrapper">
    <!-- =================================================Sidebar=================================================== -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Admin username</h3>
        </div>
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link admin active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Tổng quan</a>
            <a class="nav-link admin" id="v-pills-line-tab" data-toggle="pill" href="#v-pills-line" role="tab" aria-controls="v-pills-line" aria-selected="false">Tuyến xe</a>
            <a class="nav-link admin" id="v-pills-trip-tab" data-toggle="pill" href="#v-pills-trip" role="tab" aria-controls="v-pills-trip" aria-selected="false">Chuyến xe</a>
            <a class="nav-link admin" id="v-pills-place-tab" data-toggle="pill" href="#v-pills-place" role="tab" aria-controls="v-pills-place" aria-selected="false">Địa điểm</a>
            <a class="nav-link admin" id="v-pills-user-tab" data-toggle="pill" href="#v-pills-user" role="tab" aria-controls="v-pills-place" aria-selected="false">Người dùng</a>

        </div>
    </nav>
    <div id="content">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-info">
                <i class="fas fa-align-left"></i>
            </button>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
    <!-- =================================================Tổng quan=================================================== -->
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <div class="row">
                    <div class="col-sm-5 info-content">
                        <div class="top-table">
                            <span class="navbar-brand"> Tuyến xe </span>
                        </div>
                        <h3>
                            Số lượng : ${lines.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Tuyến xe</th>
                                    <th>Giá vé</th>
                                    <th>Quãng đường</th>
                                    <th>Thời gian</th>
                                    <th>Số lượng chuyến</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="l" items="${lines}">
                                <tr>
                                    <td>${l.startPoint.address}    =>    ${l.endPoint.address}</td>
                                    <td>${l.price}</td>
                                    <td>${l.kilometer}km</td>
                                    <td>${l.time}h</td>
                                    <td>${l.trips.size()}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-5 info-content">
                        <div class="top-table">
                            <span class="navbar-brand"> Chuyến xe </span>
                        </div>
                        <h3>
                            Số lượng : ${trips.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Chuyến xe</th>
                                    <th>Ghế trống</th>
                                    <th>Tài xế</th>
                                    <th>Thời gian khởi hành</th>
                                    <th>Thời gian dự kiến</th>
                                    <th>Phụ thu</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="t" items="${trips}">
                                <tr>
                                    <td>${t.line.startPoint.address}    =>    ${t.line.endPoint.address}</td>
                                    <td>${t.blankSeat}</td>
                                    <td>${t.driver.firstName}${t.driver.lastName}</td>
                                    <td>${t.startTime}</td>
                                    <td>${t.endTime}</td>
                                    <td>${t.extra_changes}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6 info-content">
                        <div class="top-table">
                            <span class="navbar-brand"> Khách hàng </span>
                        </div>
                        <h3>
                            Số lượng : ${customers.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Họ và Tên</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Địa chỉ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${customers}">
                                <tr>
                                    <td>${c.firstName} ${c.lastName}</td>
                                    <td>${c.numberPhone}</td>
                                    <td>${c.email}</td>
                                    <td>${c.address}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-4 info-content">
                        <div class="top-table">
                            <span class="navbar-brand"> Nhân viên </span>
                        </div>
                        <h3>
                            Số lượng : ${employees.size()}
                        </h3>
                        <div class="schedule-scroll admin">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Họ và Tên</th>
                                    <th>Số điện thoại</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="e" items="${employees}">
                                <tr>
                                    <td>${e.id}</td>
                                    <td>${e.firstName} ${e.lastName}</td>
                                    <td>${e.numberPhone}</td>
                                    <td>${e.permission.name}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    <!-- =================================================Tuyến xe=================================================== -->
            <div class="tab-pane fade" id="v-pills-line" role="tabpanel" aria-labelledby="v-pills-line-tab">
                <div class="col-sm-11 info-content">
                    <div class="top-table">
                        <span class="navbar-brand"> Tuyến xe </span>
                        <a class="header-nav-button-signup">
<%--                            <button type="button" class="btn btn-outline-light admin plus"--%>
<%--                                    data-toggle="modal" data-target="#createLineModal">Tuyến phổ biến</button>--%>
                            <button type="button" class="btn btn-outline-light admin"
                                    data-toggle="modal" data-target="#createLineModal">Thêm tuyến</button>
                        </a>
                    </div>
                    <h3>
                        Số lượng : ${lines.size()}
                    </h3>
                    <div class="schedule-scroll">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>Tên tuyến</th>
                                <th>Điểm bắt đầu</th>
                                <th>Điểm kết thúc</th>
                                <th>Giá </th>
                                <th>Quảng đường</th>
                                <th>Thời gian</th>
                                <th>Số lượng chuyến</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="l" items="${lines}">
                            <tbody>
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.name}</td>
                                <td>${l.startPoint.address}</td>
                                <td>${l.endPoint.address}</td>
                                <td>${l.price}</td>
                                <td>${l.kilometer}km</td>
                                <td>${l.time}h</td>
                                <td>${l.trips.size()}</td>
                                <td><a href="#" data-toggle="modal" data-target="#updateLineModal${l.id}">Sửa</a></td>
                                <td><a href="#" data-toggle="modal" data-target="#deleteLineModal${l.id}">Xóa</a></td>
                            </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                        <!-- Modal Create -->
                        <div class="modal fade" id="createLineModal" tabindex="-1" aria-labelledby="createLineModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Thêm tuyến</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="createLineForm" method="post" action="${create}" accept-charset="utf-8">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Tên tuyến </label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="name" name="lineName">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="startPlace" class="col-form-label">Điểm khởi hành</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="startPlace" name="startPlace">
                                                    <option>Chọn điểm</option>
                                                    <c:forEach var="p" items="${points}">
                                                        <option>${p.address}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="endPlace" class="col-form-label">Điểm kết thúc</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="endPlace" name="endPlace">
                                                    <option>Chọn điểm</option>
                                                    <c:forEach var="p" items="${points}">
                                                        <option>${p.address}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Giá vé</label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="price" name="price">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="distance" class="col-form-label">Quảng đường </label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="distance" name="distance">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="time" class="col-form-label">Thời gian dự kiến</label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="time" name="time">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <input onclick="return checkInput()" type="submit" class="btn btn-primary" value="Lưu tuyến">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Update -->
                        <c:forEach var="l" items="${lines}">
                        <div class="modal fade" id="updateLineModal${l.id}" tabindex="-1" aria-labelledby="updateLineModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Chỉnh sửa tuyến xe</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="updateLineForm" method="post" action="${update}" accept-charset="utf-8">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="idline" class="col-form-label">id </label>
                                                <input type="text" class="form-control" name="idline" id="idline" readonly="readonly" value="${l.id}">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label">Tên tuyến </label>
                                                <input type="text" class="form-control" readonly="readonly" value="${l.name}">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label">Điểm bắt đầu </label>
                                                <input type="text" class="form-control" readonly="readonly" value="${l.startPoint.address}">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label">Điểm bắt đầu </label>
                                                <input type="text" class="form-control" readonly="readonly" value="${l.endPoint.address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="priceUpdate-${l.id}" class="col-form-label">Giá vé</label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="priceUpdate-${l.id}" name="price" value="${l.price}">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="distanceUpdate-${l.id}" class="col-form-label">Quảng đường </label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="distanceUpdate-${l.id}" name="distance" value="${l.kilometer}">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="timeUpdate-${l.id}" class="col-form-label">Thời gian dự kiến</label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="timeUpdate-${l.id}" name="time" value="${l.time}">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <input onclick="return checkLineUpdateInput(${l.id})" type="submit" class="btn btn-primary" value="Cập nhật tuyến">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- Modal Delete -->
                        <c:forEach var="l" items="${lines}">
                            <div class="modal fade" id="deleteLineModal${l.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Xóa ${l.name}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Xác nhận xóa tuyến ${l.startPoint.address} => ${l.endPoint.address}
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <a href="<c:url value="/line/${l.id}/delete"/>">
                                                <button type="button" class="btn btn-primary">Xác nhận</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
    <!-- =================================================Chuyến xe=================================================== -->
            <div class="tab-pane fade" id="v-pills-trip" role="tabpanel" aria-labelledby="v-pills-trip-tab">
                <div class="col-sm-11 info-content">
                    <div class="top-table">
                        <span class="navbar-brand"> Chuyến xe </span>
                        <a class="header-nav-button-signup">
                            <button type="button" class="btn btn-outline-light admin"
                                    data-toggle="modal" data-target="#createTripModal">Thêm chuyến</button>
                        </a>
                    </div>
                    <h3>
                        Số lượng : ${trips.size()}
                    </h3>
                    <div class="schedule-scroll">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>Tên chuyến</th>
                                <th>Tuyến</th>
                                <th>Khởi hành </th>
                                <th>Kết thúc (dự tính) </th>
                                <th>Ghế trống</th>
                                <th>Tài xế</th>
                                <th>Phụ thu</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="t" items="${trips}">
                                <tbody>
                                <tr>
                                    <td>${t.id}</td>
                                    <td>${t.name}</td>
                                    <td>${t.line.startPoint.address} => ${t.line.endPoint.address}</td>
                                    <td>${t.startTime}</td>
                                    <td>${t.endTime}</td>
                                    <td>${t.blankSeat}</td>
                                    <td>${t.driver.firstName } ${t.driver.lastName }</td>
                                    <td>${t.extra_changes}</td>
                                    <td><a href="#" data-toggle="modal" data-target="#updateTripModal${t.id}">Sửa</a></td>
                                    <td><a href="#" data-toggle="modal" data-target="#deleteTripModal${t.id}">Xóa</a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- Modal Create -->
                        <div class="modal fade" id="createTripModal" tabindex="-1" aria-labelledby="createLineModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm chuyến</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="createTripForm" method="post" action="${createT}" accept-charset="utf-8">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="tripName" class="col-form-label">Tên chuyến </label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="tripName" name="tripName">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="tripLine" class="col-form-label">Tuyến</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="tripLine" name="tripLine">
                                                    <option>Chọn tuyến</option>
                                                    <c:forEach var="l" items="${lines}">
                                                        <option value="${l.id}">${l.startPoint.address} => ${l.endPoint.address}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="startTrip" class="col-form-label">Khởi hành </label>
                                                <small>Erro message</small>
                                                <input class="form-control" type="datetime-local" id="startTrip" name="startTrip">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="endTrip" class="col-form-label">Kết thúc(dự kiến) </label>
                                                <small>Erro message</small>
                                                <input class="form-control" type="datetime-local" id="endTrip" name="endTrip">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="blankSeat" class="col-form-label">Số lượng ghế trống </label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="blankSeat" name="blankSeat">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="tripDriver" class="col-form-label">Tài xế</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="tripDriver" name="tripDriver">
                                                    <option value="0">Chọn tài xế</option>
                                                    <c:forEach var="d" items="${drivers}">
                                                        <option value="${d.id}">${d.firstName} ${d.lastName}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="extraChanges" class="col-form-label">Phụ thu </label>
                                                <small>Erro message</small>
                                                <input type="number" class="form-control" id="extraChanges" name="extraChanges">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <button type="button" onclick="checkTripInput()">check</button>
                                            <input type="submit" onclick="return checkTripInput()" class="btn btn-primary" value="Lưu chuyến">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Update -->
                            <c:forEach var="t" items="${trips}">
                            <div class="modal fade" id="updateTripModal${t.id}" tabindex="-1" aria-labelledby="updateLineModal" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Chỉnh sửa chuyến xe</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="updateTripForm" method="post" action="${updateT}" accept-charset="utf-8">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <input type="text" class="form-control"  name="tripId" readonly="readonly" value="${t.id}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="tripName" class="col-form-label">Tên chuyến </label>
                                                    <input type="text" class="form-control" readonly="readonly" value="${t.name}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="tripLine" class="col-form-label">Tuyến</label>
                                                    <input type="text" class="form-control" readonly="readonly" value="${t.line.startPoint.address}=>${t.line.endPoint.address}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="blankSeat" class="col-form-label">Số lượng ghế trống </label>
                                                    <small>Erro message</small>
                                                    <input type="number" class="form-control" id="blankSeatUpdate-${t.id}"  name="blankSeat" value="${t.blankSeat}">
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tripDriver" class="col-form-label">Tài xế</label>
                                                    <small>Erro message</small>
                                                    <select class="form-control" id="driverUpdate-${t.id}" name="tripDriver">
                                                        <option value="${t.driver.id}" >${t.driver.firstName} ${t.driver.lastName}</option>
                                                        <c:forEach var="d" items="${drivers}">
                                                            <option value="${d.id}">${d.firstName} ${d.lastName}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label for="extraChanges" class="col-form-label">Phụ thu </label>
                                                    <small>Erro message</small>
                                                    <input type="number" class="form-control" id="extraChangesUpdate-${t.id}" name="extraChanges" value="${t.extra_changes}">
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <input onclick="return checkTripUpdate(${t.id})" type="submit" class="btn btn-primary" value="Lưu chuyến">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!-- Modal Delete -->
                            <c:forEach var="t" items="${trips}">
                            <div class="modal fade" id="deleteTripModal${t.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Xóa ${t.name}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Xác nhận xóa chuyến ${t.name} từ ${t.line.startPoint.address} => ${t.line.endPoint.address}
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <a href="<c:url value="/trip/${t.id}/delete"/>">
                                                <button type="button" class="btn btn-primary">Xác nhận</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                    </div>
                </div>
            </div>
    <!-- =================================================Địa điểm=================================================== -->
            <div class="tab-pane fade" id="v-pills-place" role="tabpanel" aria-labelledby="v-pills-trip-tab">
                <div class="col-sm-11 info-content">
                    <div class="top-table">
                        <span class="navbar-brand"> Địa điểm </span>
                        <a class="header-nav-button-signup">
                            <button type="button" class="btn btn-outline-light admin"
                                    data-toggle="modal" data-target="#createPlaceModal">Thêm Điểm</button>
                        </a>
                    </div>
                    <h3>
                        Số lượng : ${points.size()}
                    </h3>
                    <div class="schedule-scroll">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>Địa điểm</th>
                                <th>Ảnh</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="p" items="${points}">
                                <tbody>
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.address}</td>
                                    <td>
                                        <c:if test="${p.picture == null}">
                                            <img class="place-img-admin" src="https://res.cloudinary.com/docswnn1e/image/upload/v1638958966/place_tibfrs.png" alt="Ảnh"/>
                                        </c:if>
                                        <c:if test="${p.picture != null}">
                                        <img class="place-img-admin" src="${p.picture}" alt="Ảnh"/>
                                        </c:if>
                                    </td>

                                    <td><a href="#" data-toggle="modal" data-target="#updatePlaceModal${p.id}">Sửa</a></td>
                                    <td><a href="#" data-toggle="modal" data-target="#deletePlaceModal${p.id}">Xóa</a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- Modal Create -->
                        <div class="modal fade" id="createPlaceModal" tabindex="-1" aria-labelledby="createLineModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm địa điểm</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="createPlaceForm" method="post" action="${createP}" enctype="multipart/form-data">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="tripName" class="col-form-label">Tên địa điểm </label>
                                                <small>Erro message</small>
                                                <input type="text" class="form-control" id="placeName" name="placeName">
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="tripLine" class="col-form-label">Ảnh</label>
                                                <small>Erro message</small>
                                                <input class="file btn btn-lg btn-primary" id="placePicture" name="placePicture" type="file" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <input type="submit" onclick="return checkPlaceInput()" class="btn btn-primary" value="Lưu địa điểm">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Update -->
                        <c:forEach var="p" items="${points}">
                            <div class="modal fade" id="updatePlaceModal${p.id}" tabindex="-1" aria-labelledby="updatePlaceModal" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Chỉnh sửa chuyến xe</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="updatePlaceForm" method="post" action="${updateP}" enctype="multipart/form-data">
                                            <div class="modal-body">
                                                <div>
                                                    <img class="place-img-admin" src="${p.picture}" alt="Ảnh"/>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">Id </label>
                                                    <input type="text" name="placeId" class="form-control" readonly="readonly" value="${p.id}">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">Tên địa điểm </label>
                                                    <input type="text" class="form-control" readonly="readonly" value="${p.address}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="tripLine" class="col-form-label">Ảnh</label>
                                                    <small>Erro message</small>
                                                    <input class="file btn btn-lg btn-primary" id="placePictureUpdate${p.id}" name="placePictureUpdate" type="file" />
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <input onclick="return checkPlaceUpdate(${p.id})" type="submit" class="btn btn-primary" value="Lưu điểm">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Modal Delete -->
                        <c:forEach var="p" items="${points}">
                            <div class="modal fade" id="deletePlaceModal${p.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Xóa ${p.address}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <img class="place-img-admin" src="${p.picture}" alt="Ảnh"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <a href="<c:url value="/place/${p.id}/delete"/>">
                                                <button type="button" class="btn btn-primary">Xác nhận</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
    <!-- =================================================Người dùng=================================================== -->
            <div class="tab-pane fade" id="v-pills-user" role="tabpanel" aria-labelledby="v-pills-user-tab">
                <div class="col-sm-11 info-content">
                    <div class="top-table">
                        <span class="navbar-brand"> Người dùng </span>
                        <a class="header-nav-button-signup">
                            <button type="button" class="btn btn-outline-light admin"
                                    data-toggle="modal" data-target="#createUserModal">Thêm người dùng</button>
                        </a>
                    </div>
                    <h3>
                        Số lượng : ${users.size()}
                    </h3>
                    <div class="schedule-scroll">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>username</th>
                                <th>Họ và tên</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Loại người dùng</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="u" items="${users}">
                                <tbody>
                                <tr>
                                    <td>${u.id}</td>
                                    <td>${u.username}</td>
                                    <td>${u.firstName} ${u.lastName}</td>
                                    <td>${u.address}</td>
                                    <td>${u.numberPhone}</td>
                                    <td>${u.permission.name}</td>
                                    <td><a href="#" data-toggle="modal" data-target="#updateUserModal${u.id}">Sửa</a></td>
                                    <td><a href="#" data-toggle="modal" data-target="#deleteUserModal${u.id}">Xóa</a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- Modal Create -->
                        <div class="modal fade" id="createUserModal" tabindex="-1" aria-labelledby="createUserModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm người dùng</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form id="createUserForm" method="post" action="${createU}" enctype="multipart/form-data">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label class="col-form-label" >Họ & Tên đệm</label>
                                                <small>Erro message</small>
                                                <input type="text" id="lastname" name="lastName" class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label" >Tên </label>
                                                <small>Erro message</small>
                                                <input type="text" id="firstname" name="firstName" class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label" >Username</label>
                                                <small>Erro message</small>
                                                <input type="text" id="username" name="username"  class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label" >Số điện thoại</label>
                                                <small>Erro message</small>
                                                <input type="text" id="phoneNumber" name="phone" pattern="[0-9]+" class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label" >Mật khẩu</label>
                                                <small>Erro message</small>
                                                <input type="password" id="password" name="password"  class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label" >Xác thực mật khẩu</label>
                                                <small>Erro message</small>
                                                <input type="password" id="password2" name="password2"  class="form-control" />
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                            <div class="form-group">
                                                <label for="tripLine" class="col-form-label">Loại người dùng</label>
                                                <small>Erro message</small>
                                                <select class="form-control" id="permission" name="permission">
                                                    <option></option>
                                                    <c:forEach var="pe" items="${permission}">
                                                        <option value="${pe.id}">${pe.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <input type="submit" onclick="return checkUserInput()" class="btn btn-primary" value="Lưu người dùng">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Update -->
                        <c:forEach var="u" items="${users}">
                            <div class="modal fade" id="updateUserModal${u.id}" tabindex="-1" aria-labelledby="updateUserModal" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Chỉnh sửa người dùng</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="updateUserForm" method="post" action="${updateU}" enctype="multipart/form-data">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label class="col-form-label" >id</label>
                                                    <small>Erro message</small>
                                                    <input type="text" name="id" class="form-control" value="${u.id}" readonly="readonly"/>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label" >Họ & Tên đệm</label>
                                                    <small>Erro message</small>
                                                    <input type="text" id="lastnameUpdate${u.id}" name="lastName" class="form-control" value="${u.lastName}"/>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label" >Tên </label>
                                                    <small>Erro message</small>
                                                    <input type="text" id="firstnameUpdate${u.id}" name="firstName" class="form-control" value="${u.firstName}"/>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label" >Địa chỉ </label>
                                                    <small>Erro message</small>
                                                    <input type="text" id="addressUpdate${u.id}" name="address" class="form-control" value="${u.address}"/>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label" >Số điện thoại </label>
                                                    <small>Erro message</small>
                                                    <input type="text" id="phoneNumberUpdate${u.id}" name="phoneNumber" class="form-control" value="${u.numberPhone}"/>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tripLine" class="col-form-label">Loại người dùng</label>
                                                    <small>Erro message</small>
                                                    <select class="form-control" id="permissionUpdate" name="permission">
                                                        <option value="${u.permission.id}">${u.permission.name}</option>
                                                        <c:forEach var="pe" items="${permission}">
                                                            <option value="${pe.id}">${pe.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <i class="fas fa-check-circle"></i>
                                                    <i class="fas fa-exclamation-circle"></i>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <input type="submit" onclick="return checkUserUpdate(${u.id})" class="btn btn-primary" value="Lưu người dùng">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Modal Delete -->
                        <c:forEach var="u" items="${users}">
                            <div class="modal fade" id="deleteUserModal${u.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Xóa ${u.username}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <img class="place-img-admin" src="${u.avatar}" alt="Ảnh"/>
                                            ${u.firstName} ${u.lastName}
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <a href="<c:url value="/user/${u.id}/delete"/>">
                                                <button type="button" class="btn btn-primary">Xác nhận</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
