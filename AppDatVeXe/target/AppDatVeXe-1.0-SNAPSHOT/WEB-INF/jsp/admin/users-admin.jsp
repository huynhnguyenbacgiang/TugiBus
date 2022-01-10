<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="updateU" value="/admin/users/update" />

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
        <span class="navbar-brand"> Người dùng </span>
    </div>
    <p class="admin-amount-text">
        Số lượng : ${users.size()}
    </p>
    <div class="schedule-scroll">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Hình ảnh</th>
                <th>Họ và tên</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Loại tài khoản</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach var="u" items="${users}">
                <tbody>
                <tr>
                    <td>${u.id}</td>
                    <td>
                        <c:if test="${u.avatar == null}">
                        <img class="place-img-admin" src="https://res.cloudinary.com/docswnn1e/image/upload/v1638958966/place_tibfrs.png" alt="Ảnh"/>
                        </c:if>
                        <c:if test="${u.avatar != null}">
                        <img class="place-img-admin" src="${u.avatar}" alt="Ảnh"/>
                        </c:if>
                    </td>
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
                                    <input type="text" name="userId" class="form-control" value="${u.id}" readonly="readonly"/>
                                </div>
                                <div class="form-group">
                                    <label for="fullName" class="col-form-label" >Họ & tên</label>
                                    <input type="text" id="fullName" name="fullName" readonly="readonly"
                                           class="form-control" value="${u.firstName} ${u.lastName}"/>
                                </div>
                                <div class="form-group">
                                    <label for="addressUpdate${u.id}" class="col-form-label" >Địa chỉ </label>
                                    <small>Erro message</small>
                                    <input type="text" id="addressUpdate${u.id}" name="addressUp"
                                           class="form-control" value="${u.address}"/>
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumberUpdate${u.id}" class="col-form-label" >Số điện thoại </label>
                                    <small>Erro message</small>
                                    <input type="text" id="phoneNumberUpdate${u.id}" name="phoneNumberUp"
                                           class="form-control" value="${u.numberPhone}"/>
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="permissionUpdate${u.id}" class="col-form-label">Loại tài khoản</label>
                                    <small>Erro message</small>
                                    <select class="form-control" id="permissionUpdate${u.id}" name="permissionId">
                                        <option value="${u.permission.id}">${u.permission.name}</option>
                                        <c:forEach var="p" items="${permissions}">
                                            <option value="${p.id}">${p.name}</option>
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
                            <h5 class="modal-title">Xóa ${u.firstName} ${u.lastName}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img class="place-img-admin" src="${u.avatar}" alt="Ảnh"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <c:if test="${mgs == null}">
                            <a href="<c:url value="users/${u.id}/delete"/>">
                                <button type="button" class="btn btn-primary">Xác nhận</button>
                            </a>
                            </c:if>
                            <c:if test="${mgs != null}">
                                <a href="<c:url value="${u.id}/delete"/>">
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