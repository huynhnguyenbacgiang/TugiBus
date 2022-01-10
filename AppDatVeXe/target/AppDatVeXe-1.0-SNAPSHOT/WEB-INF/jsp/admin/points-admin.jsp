<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="createP" value="/admin/points/add" />
<c:url var="updateP" value="/admin/points/update" />

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
        <span class="navbar-brand"> Địa điểm </span>
        <a class="header-nav-button-signup">
            <button type="button" class="btn btn-outline-light admin"
                    data-toggle="modal" data-target="#createPlaceModal">Thêm Điểm</button>
        </a>
    </div>
    <p class="admin-amount-text">
        Số lượng : ${points.size()}
    </p>
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
        <div class="modal fade" id="createPlaceModal" tabindex="-1" aria-labelledby="createPlaceModal" aria-hidden="true">
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
                                <label for="placeName" class="col-form-label">Tên địa điểm </label>
                                <small>Erro message</small>
                                <input type="text" class="form-control" id="placeName" name="placeName">
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="form-group">
                                <label for="placePicture" class="col-form-label">Ảnh</label>
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
                                    <label for="placePictureUpdate" class="col-form-label">Ảnh</label>
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
                            <c:if test="${mgs == null}">
                                <a href="<c:url value="points/${p.id}/delete"/>">
                                    <button type="button" class="btn btn-primary">Xác nhận</button>
                                </a>
                            </c:if>
                            <c:if test="${mgs != null}">
                                <a href="<c:url value="${p.id}/delete"/>">
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