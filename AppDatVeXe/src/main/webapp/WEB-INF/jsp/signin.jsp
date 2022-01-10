<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/21/2021
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <link href="<c:url value="css/signin.css" />" rel="stylesheet" type="text/css"/>
</head>
<body>

<c:url var="signin" value="/signin" />
<c:url var="signup" value="/signup" />
<c:url var="home" value="/" />

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
        let flag;
        const username = document.getElementById('username');
        const password = document.getElementById('password');

        console.log(username, password);
        //user name
        if(username.value.trim() == ""){
            setErrorFor(username, 'Không được để trống tên đăng nhập');
            return false;
        }else {
            setSuccessFor(username);
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
</script>
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                <div class="card" style="border-radius: 15px;">
                    <a class="back-to-mainpage" href="${home}">
                        <i class="fas fa-chevron-left"></i>
                        Quay lại
                    </a>
                    <div class="card-body p-5">
                        <h2 class="text-uppercase text-center mb-5">Đăng nhập</h2>
                        <c:if test="${param.accessDenied != null}">
                            <label class="text-danger">*Bạn không có quyền</label>
                        </c:if>
                        <c:if test="${param.error != null}">
                            <label class="text-danger">*Đăng nhập không thành công</label>
                        </c:if>
                        <form id="form" method="post" action="${signin}">
                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input name="username" type="text" id="username" class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Tên đăng nhập</label>
                            </div>

                            <div class="form-outline mb-4">
                                <small>Erro message</small>
                                <input name="password" type="password" id="password" class="form-control form-control-lg" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <label class="form-label" >Mật khẩu</label>
                            </div>

                            <div class="d-flex justify-content-center">
                                <input onclick="return checkInput()" type="submit"  value="ĐĂNG NHẬP" class="btn btn-success btn-block btn-lg gradient-custom-4 text-white">
                            </div>
                            <p class="text-center text-muted mt-5 mb-0">Chưa có tài khoản? <a href="${signup}" class="fw-bold text-body"><u>Đăng ký ở đây</u></a></p>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>