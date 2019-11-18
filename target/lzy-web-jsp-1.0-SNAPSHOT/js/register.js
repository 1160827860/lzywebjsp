$(function () {
    $("#finish").on('click',function () {
        var username = $("#name").val().trim();
        if(username == ''){
            alert("姓名不能为空");
            return false;
        }
        var password = $("#password").val().trim();
        if(password == ''){
            alert("密码不能为空");
            return false;
        }
        var repassword = $("#repassword").val().trim();
        if(repassword == ''){
            alert("重复密码不能为空");
            return false;
        }
        if(repassword != password){
            alert("两次密码不一致");
            return false;
        }
        var mail = $("#maill").val().trim();
        if(mail == ''){
            alert("邮箱不能为空");
            return false;
        }
    })
})