<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/19/2021
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

    <script src="jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <link href="<c:url value="css/signup.css" />" rel="stylesheet" type="text/css"/>
</head>
<body>

<c:url var="home" value="/" />
<c:url var="signin" value="/signin" />
<c:url var="signup" value="/signup" />

<script>
    const form = document.getElementById('form');
    form.addEventListener('submit', e => {
        e.preventDefault();

        checkInput();
    });
    function test(){
        checkInput();
        console.log(checkInput());
    }
    function checkInput(){
        const firstname = document.getElementById("firstname");
        const lastname = document.getElementById("lastname");
        const username = document.getElementById('username');
        const phone = document.getElementById('phoneNumber');
        const password = document.getElementById('password');
        const password2 = document.getElementById('password2');
        const checker = document.getElementById('checker');
        const avatar = document.getElementById('avatar');

        //last name
        if(lastname.value.trim() == ""){
            setErrorFor(lastname, 'Không được để trống họ của bạn');
            return false;
        }else {
            setSuccessFor(lastname);
        }
        //first name
        if(firstname.value.trim() == ""){
            setErrorFor(firstname, 'Không được để trống tên của bạn');
            return false;
        }else {
            setSuccessFor(firstname);
        }
        //user name
        if(username.value.trim() == ""){
            setErrorFor(username, 'Không được để trống tên đăng nhập');
            return false;
        }else {
            setSuccessFor(username);
        }
        //phone
        if(phone.value.trim() == ""){
            setErrorFor(phone,'Không được để trống số điện thoại');
            return false;
        }else if(!isPhone(phone.value.trim())){
            setErrorFor(phone, 'Số điện thoại không hợp lệ');
            return false;
        }else {
            setSuccessFor(phone);
        }
        //password
        if(password.value.trim() == ""){
            setErrorFor(password, 'Không được để trống mật khẩu');
            return false;
        }else if (password.value.trim().length <= 6){
            setErrorFor(password,'Mật khẩu phải dài hơn 6 ký tự')
            return false;
        }else {
            setSuccessFor(password);
        }
        //password check
        if(password2.value.trim() == ""){
            setErrorFor(password2,'Không được để trống xác thực mật khẩu');
            return false;
        }else if(password.value.trim() != password2.value.trim()){
            setErrorFor(password2, 'Mật khẩu xác thực không đúng');
            return false;
        }else {
            setSuccessFor(password2);
        }
        //avatar
        if(avatar.value.trim() == ""){
            setErrorFor(avatar, 'Chọn ảnh đại diện');
            return false;
        }else {
            setSuccessFor(avatar);
        }

        // checker
        if (checker.checked){
            checker.parentElement.style.color = 'black';
        }else {
            checker.parentElement.style.color = 'red';
            return false;
        }
        return true;
    }
    function  setErrorFor(input, message){
        const formOutline = input.parentElement;
        const small = formOutline.querySelector('small');

        small.innerText = message;
        formOutline.className = "form-outline mb-4 error";
    }
    function setSuccessFor(input){
        const formOutline = input.parentElement;
        formOutline.className = "form-outline mb-4 success";
    }
    function isPhone(phone) {
        return /((09|03|07|08|05)+([0-9]{8})\b)/g.test(phone);
    }
</script>
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                <div class="card" style="border-radius: 15px;">
                    <a class="back-to-mainpage" href="${signin}" >
                        <i class="fas fa-chevron-left"></i>
                        Quay lại
                    </a>
                    <div class="card-body p-5">
                        <h2 class="text-uppercase text-center mb-5">Đăng ký tài khoản</h2>
                        <c:if test="${mgs != ''}">
                            <h3 class="text-danger">${mgs}</h3>
                        </c:if>
                        <form class="form-signup" id="form" method="post" action="${signup}" enctype="multipart/form-data">
                            <div class="fullname-textbox-container">
                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="text" id="lastname" name="lastName" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Họ & Tên đệm</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <small>Erro message</small>
                                    <input type="text" id="firstname" name="firstName" class="form-control form-control-lg" />
                                    <i class="fas fa-check-circle"></i>
                                    <i class="fas fa-exclamation-circle"></i>
                                    <label class="form-label" >Tên</label>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input type="text" id="username" name="username"  class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Tên đăng nhập</label>
                            </div>

                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input type="text" id="phoneNumber" name="phone" pattern="[0-9]+" class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Số điện thoại</label>
                            </div>

                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input type="password" id="password" name="password"  class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Mật khẩu</label>
                            </div>

                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input type="password" id="password2" name="password2"  class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Xác thực mật khẩu</label>
                            </div>
                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input class="form-control form-control-lg avatar" id="avatar" name="avatar" type="file" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Chọn ảnh đại diện</label>
                            </div>

                            <div class="form-check d-flex justify-content-center mb-5">
                                <input
                                        id="checker" name="checker"
                                        class="form-check-input me-2"
                                        type="checkbox"
                                        value=""
                                />
                                <label class="form-check-label" >
                                    Đồng ý với <u>các điều khoản dịch vụ</u>
                                </label>
                            </div>

                            <div class="d-flex justify-content-center">
                                <input onclick="return checkInput()" type="submit" value="Đăng ký"
                                       class="btn btn-success btn-block btn-lg gradient-custom-4 text-white" />
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
