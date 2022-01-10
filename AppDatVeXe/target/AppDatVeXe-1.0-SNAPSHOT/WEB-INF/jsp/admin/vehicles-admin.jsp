<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="createV" value="/admin/vehicles/add"/>
<c:url var="updateV" value="/admin/vehicles/update"/>

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
        <span class="navbar-brand"> Xe </span>
        <a class="header-nav-button-signup">
            <button type="button" class="btn btn-outline-light admin"
                    data-toggle="modal" data-target="#createVehicleModal">Thêm xe</button>
        </a>
    </div>
    <p class="admin-amount-text">
        Số lượng : ${vehicles.size()}
    </p>
    <div class="schedule-scroll">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Biển số</th>
                <th>Số ghế</th>
                <th>Loại xe</th>
                <th>Phụ thu</th>
                <th>Tài xế</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach var="v" items="${vehicles}">
                <tbody>
                <tr>
                    <td>${v.licensePlate}</td>
                    <td>${v.seat}</td>
                    <td>${v.vehicleType.nameType}</td>
                    <td>${v.extraChanges}</td>
                    <td>${v.driver.firstName} ${v.driver.lastName}</td>
                    <td><a href="#" data-toggle="modal" data-target="#updateVehicleModal${v.id}">Sửa</a></td>
                    <td><a href="#" data-toggle="modal" data-target="#deleteVehicleModal${v.id}">Xóa</a></td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <!-- Modal Create -->
        <div class="modal fade" id="createVehicleModal" tabindex="-1" aria-labelledby="createVehicleModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm xe</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="createVehicleForm" method="post" action="${createV}" accept-charset="utf-8">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="licensePlate" class="col-form-label">Biển số </label>
                                <small>Erro message</small>
                                <input type="text" class="form-control" id="licensePlate" name="licensePlate">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="vehicleType" class="col-form-label">Loại xe </label>
                                <small>Erro message</small>
                                <select class="form-control" id="vehicleType" name="vehicleType">
                                    <option value="null">Chọn loại xe</option>
                                    <c:forEach var="t" items="${vehicleTypes}">
                                        <option value="${t.id}">${t.nameType}</option>
                                    </c:forEach>
                                </select>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="extraChanges" class="col-form-label">Phụ thu</label>
                                <small>Erro message</small>
                                <input type="number" class="form-control" id="extraChanges" name="extraChanges">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="driver" class="col-form-label">Tài xế </label>
                                <small>Erro message</small>
                                <select class="form-control" id="driver" name="driver">
                                    <option value="null">Chọn tài xế</option>
                                    <c:forEach var="d" items="${drivers}">
                                        <option value="${d.id}">${d.firstName} ${d.lastName}</option>
                                    </c:forEach>
                                </select>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <input onclick="return checkVehicleInput()" type="submit"  class="btn btn-primary" value="Thêm xe">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Update -->
        <c:forEach var="v" items="${vehicles}">
            <div class="modal fade" id="updateVehicleModal${v.id}" tabindex="-1" aria-labelledby="updateVehicleModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa xe</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="updateVehicleForm" method="post" action="${updateV}" accept-charset="utf-8">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="vehicleId" class="col-form-label">id </label>
                                    <input type="text" class="form-control" name="vehicleId" id="vehicleId" readonly="readonly" value="${v.id}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Biến số </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${v.licensePlate}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Loại xe </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${v.vehicleType.nameType}">
                                </div>
                                <div class="form-group">
                                    <label for="extraChangesUpdate-${v.id}" class="col-form-label">Phụ thu </label>
                                    <small>Erro message</small>
                                    <input type="number" class="form-control" id="extraChangesUpdate-${v.id}"
                                            name="extraChangesUp" value="${v.extraChanges}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="driverUpdate-${v.id}" class="col-form-label">Tài xế </label>
                                    <small>Erro message</small>
                                    <select class="form-control" id="driverUpdate-${v.id}" name="driverUp">
                                        <option value="${v.driver.id}">${v.driver.firstName} ${v.driver.lastName}</option>
                                        <c:forEach var="d" items="${drivers}">
                                            <option value="${d.id}">${d.firstName} ${d.lastName}</option>
                                        </c:forEach>
                                    </select>
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <input onclick="return checkVehicleUpdate(${v.id})" type="submit" class="btn btn-primary" value="Cập nhật xe">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- Modal Delete -->
        <c:forEach var="v" items="${vehicles}">
            <div class="modal fade" id="deleteVehicleModal${v.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Xác nhận xóa xe ${v.licensePlate}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <c:if test="${mgs == null}">
                                <a href="<c:url value="vehicles/${v.id}/delete"/>">
                                    <button type="button" class="btn btn-primary">Xác nhận</button>
                                </a>
                            </c:if>
                            <c:if test="${mgs != null}">
                                <a href="<c:url value="${v.id}/delete"/>">
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