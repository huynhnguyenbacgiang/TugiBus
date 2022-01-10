<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="createL" value="/admin/lines/add" />
<c:url var="updateL" value="/admin/lines/update" />

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
        <span class="navbar-brand"> Tuyến xe </span>
        <a class="header-nav-button-signup">
           <button type="button" class="btn btn-outline-light admin"
                    data-toggle="modal" data-target="#createLineModal">Thêm tuyến</button>
        </a>
    </div>
    <p class="admin-amount-text">
        Số lượng : ${lines.size()}
    </p>
    <div class="schedule-scroll">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Tuyến</th>
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
                    <form id="createLineForm" method="post" action="${createL}" accept-charset="utf-8">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="startPlace" class="col-form-label">Điểm khởi hành</label>
                                <small>Erro message</small>
                                <select class="form-control" id="startPlace" name="startPlace">
                                    <option value="0">Chọn điểm</option>
                                    <c:forEach var="p" items="${points}">
                                        <option value="${p.id}">${p.address}</option>
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
                                        <option value="${p.id}">${p.address}</option>
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
                                <label for="distance" class="col-form-label">Quảng đường</label>
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
                        <form id="updateLineForm" method="post" action="${updateL}" accept-charset="utf-8">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="idline" class="col-form-label">id</label>
                                    <input type="text" class="form-control" name="idline" id="idline" readonly="readonly" value="${l.id}">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Tên tuyến </label>
                                    <input type="text" class="form-control" readonly="readonly" value="${l.name}">
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
                            <c:if test="${mgs == null}">
                                <a href="<c:url value="lines/${l.id}/delete"/>">
                                    <button type="button" class="btn btn-primary">Xác nhận</button>
                                </a>
                            </c:if>
                            <c:if test="${mgs != null}">
                                <a href="<c:url value="${l.id}/delete"/>">
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