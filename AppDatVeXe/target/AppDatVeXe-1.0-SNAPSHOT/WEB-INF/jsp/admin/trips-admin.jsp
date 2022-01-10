<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="createT" value="/admin/trips/add"/>
<c:url var="updateT" value="/admin/trips/update"/>

<c:if test="${mgs != null}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${mgs}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<div class="col-sm-11 info-content">
    <div class="top-table">
        <span class="navbar-brand"> Chuyến xe </span>
        <a class="header-nav-button-signup">
            <button type="button" class="btn btn-outline-light admin"
                    data-toggle="modal" data-target="#createTripModal">Thêm chuyến</button>
        </a>
    </div>
    <p class="admin-amount-text">
        Số lượng : ${trips.size()}
    </p>
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
        <div class="modal fade" id="createTripModal" tabindex="-1" aria-labelledby="createTripModal" aria-hidden="true">
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
                                    <input type="text" class="form-control" readonly="readonly"
                                           value="${t.line.startPoint.address}=>${t.line.endPoint.address}">
                                </div>
                                <div class="form-group">
                                    <label for="blankSeat" class="col-form-label">Số lượng ghế trống </label>
                                    <small>Erro message</small>
                                    <input type="number" class="form-control" readonly="readonly"
                                           id="blankSeatUpdate-${t.id}"  name="blankSeat" value="${t.blankSeat}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="tripDriver" class="col-form-label">Tài xế</label>
                                    <small>Erro message</small>
                                    <select class="form-control" id="driverUpdate-${t.id}" name="tripDriver">
                                        <c:forEach var="d" items="${drivers}">
                                            <c:choose>
                                                <c:when test="${t.driver.id == d.id}">
                                                <option value="${d.id}" selected>${d.firstName} ${d.lastName}</option>
                                                </c:when>
                                                <c:when test="${t.driver.id != d.id}">
                                                <option value="${d.id}">${d.firstName} ${d.lastName}</option>
                                                </c:when>
                                            </c:choose>
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
                            <c:if test="${mgs == null}">
                                <a href="<c:url value="trips/${t.id}/delete"/>">
                                    <button type="button" class="btn btn-primary">Xác nhận</button>
                                </a>
                            </c:if>
                            <c:if test="${mgs != null}">
                                <a href="<c:url value="${t.id}/delete"/>">
                                    <button type="button" class="btn btn-primary">Xác nhận</button>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>