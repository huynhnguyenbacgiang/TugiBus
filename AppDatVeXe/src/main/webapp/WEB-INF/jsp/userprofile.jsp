<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<script>
    function checkInput(){
        const email = document.getElementById("email");
        const phone = document.getElementById('phone');
        // //email
        if(email.value.trim() == ""){
            return true;
        }else if(!isEmail(email.value.trim())){
            setErrorFor(email, 'Email không hợp lệ');
            return false;
        }else {
            setSuccessFor(email);
        }

        //phone
        if(phone.value.trim() == ""){
            return true;
        }else if(!isPhone(phone.value.trim())){
            setErrorFor(phone, 'Số điện thoại không hợp lệ');
            return false;
        }else {
            setSuccessFor(phone);
        }
    }
    function checkInputPass(){
        const oldPass = document.getElementById("oldpass");
        const newPass = document.getElementById("newpass");

        if(newPass.value.trim() == ""){
            setErrorFor(newPass, 'Không được để trống mật khẩu');
            return false;
        }else if (newPass.value.trim().length <= 6){
            setErrorFor(newPass,'Mật khẩu phải dài hơn 6 ký tự')
            return false;
        }else {
            setSuccessFor(newPass);
        }

        if(oldPass.value.trim() == ""){
            setErrorFor(oldPass, 'Nhập mật khẩu hiện tại');
            return false;
            <%--}else if (oldPass.value.trim() != ${user.password}){--%>
            <%--    setErrorFor(oldPass,'Mật khẩu hiện tại sai')--%>
            <%--    return false;--%>
        }else {
            setSuccessFor(oldPass);
        }

    }
    function  setErrorFor(input, message){
        const formOutline = input.parentElement;
        const small = formOutline.querySelector('small');

        small.innerText = message;
        formOutline.className = "form-group mb-4 error";
    }
    function setSuccessFor(input){
        const formOutline = input.parentElement;
        formOutline.className = "form-group mb-4 success";
    }
    function isPhone(phone) {
        return /((09|03|07|08|05)+([0-9]{8})\b)/g.test(phone);
    }
    function isEmail(email){
        return /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
</script>
<c:url var="home" value="/" />
<c:url var="update" value="/profile" />
<c:url var="change" value="/password" />
<c:url var="avatar" value="/update-avatar"/>

<c:choose>
    <c:when test="${result == 'sus'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${result} Cập nhật thành công!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:when test="${result == 'err'}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Cập nhật không thành công, thử lại sau!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:when test="${result == 'err2'}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Mật khẩu hiện tại không chính sác. Cập nhật mật khẩu thất bại.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
</c:choose>
<div class="container emp-profile">
    <div class="row">
        <div class="col-md-4">
            <div class="profile-img">
                <c:if test="${user.getAvatar() == null}">
                    <img src="<c:url value="/images/svg/account.svg" />" alt="Ảnh"/>
                </c:if>
                <c:if test="${user.getAvatar() != null}">
                    <img src="${user.getAvatar()}" alt="Ảnh"/>
                </c:if>
                <form method="post" enctype="multipart/form-data" action="${avatar}">
                    <div class="file btn btn-lg btn-primary">
                        Chọn ảnh đại diện
                        <input id="imageId" name="img" type="file" />
                    </div>
                    <%--                        <div class="form-group">--%>
                    <%--                            <input type="submit" class="btn btn-primary" value="Upload">--%>
                    <%--                        </div>--%>
                    <div >
                        <input class="btn btn-lg file_button_submit" type="submit" value="Cập nhật"/>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div class="profile-head">
                <h5>${pageContext.request.userPrincipal.name}</h5>
                <h6>${user.permission.name}</h6>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item user-profile" role="presentation">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Thông tin</a>
                    </li>
                    <li class="nav-item user-profile" role="presentation">
                        <a class="nav-link" id="tickets-tab" data-toggle="tab" href="#tickets" role="tab" aria-controls="tickets" aria-selected="false">Xem vé</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-2">
            <c:if test="${user.getPermission().getId() == 'ROLE_ADMIN'}">
            <a href="<c:url value="/admin" />">
                <button type="button" class="profile-edit-btn">
                    Trang quản lý
                </button>

            </a>
            </c:if>
            <button type="button" class="profile-edit-btn" data-toggle="modal" data-target="#exampleModal">
                Chỉnh sửa
            </button>
            <%--                    <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Chỉnh sửa"/>--%>
            <a href="<c:url value="/logout" />">
                <button type="button" class="profile-edit-btn logout">
                    Đăng xuất
                </button>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-8 ">
            <div class="tab-content profile-tab" id="myTabContent">
                <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="row profile">
                        <div class="col-md-6">
                            <label>Họ và tên đệm</label>
                        </div>
                        <div class="col-md-6">
                            <p>${user.lastName}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Tên</label>
                        </div>
                        <div class="col-md-6">
                            <p>${user.firstName}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Email</label>
                        </div>
                        <div class="col-md-6">
                            <p>${user.email}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Phone</label>
                        </div>
                        <div class="col-md-6">
                            <p>${user.numberPhone}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Địa chỉ</label>
                        </div>
                        <div class="col-md-6">
                            <p>${user.address}</p>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show" id="tickets" role="tabpanel" aria-labelledby="tickets-tab">
                    <div class="show-user-tickets">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Mã vé</th>
                                <th scope="col">Tuyến xe</th>
                                <th scope="col">Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="t" items="${ticket}">
                                <tr>
                                    <th scope="row"></th>
                                    <td>${t.id}</td>
                                    <td>${t.trip.line.startPoint.address} - ${t.trip.line.endPoint.address}</td>
                                    <td><a href="<c:url value="/${t.getId()}/ticketdetail" />">Chi tiết</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <%--                        <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa thông tin</h5>--%>
                    <%--                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
                    <%--                            <span aria-hidden="true">&times;</span>--%>
                    <%--                        </button>--%>
                    <ul class="nav nav-tabs" id="myEditTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="edit-infor-tab" data-toggle="tab" href="#editInfo" role="tab" aria-controls="editInfo" aria-selected="true">Thông tin</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Mật khẩu</a>
                        </li>
                    </ul>
                </div>
                <div class="modal-body">
                    <div class="tab-content" id="editTabContent">
                        <div class="tab-pane fade show active" id="editInfo" role="tabpanel" aria-labelledby="edit-infor-tab">
                            <form id="form" method="post" action="${update}" accept-charset="utf-8">
                                <div class="form-group">
                                    <label for="username" class="col-form-label">UserName </label>
                                    <input type="text" class="form-control" id="username" name="userName" readonly="readonly" value="${user.username}">
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-form-label">Họ và tên đệm </label>
                                    <input type="text" class="form-control" id="lastname" readonly="readonly" value="${user.lastName}">
                                </div>
                                <div class="form-group">
                                    <label for="firstname" class="col-form-label">Tên </label>
                                    <input type="text" class="form-control" id="firstname" readonly="readonly" value="${user.firstName}">
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-form-label">Email </label>
                                    <small>Erro message</small>
                                    <input type="text" class="form-control" id="email" name="email" value="${user.email}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-form-label">Phone </label>
                                    <small>Erro message</small>
                                    <input type="text" class="form-control" id="phone" name="phone" value="${user.numberPhone}">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-form-label">Địa chỉ </label>
                                    <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                                </div>
                                <input onclick="return checkInput()" type="submit" class="btn btn-primary" value="Lưu chỉnh sửa">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <form method="post" action="${change}" >
                                <div class="form-group">
                                    <label for="lastname" class="col-form-label">Mật khâu hiện tại </label>
                                    <small>Erro message</small>
                                    <input type="password" class="form-control" id="oldpass" name="oldpass">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="form-group">
                                    <label for="firstname" class="col-form-label">Mật khẩu mới </label>
                                    <small>Erro message</small>
                                    <input type="password" class="form-control" id="newpass" name="newpass">
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <input onclick="return checkInputPass()" type="submit" class="btn btn-primary" value="Lưu chỉnh sửa">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

