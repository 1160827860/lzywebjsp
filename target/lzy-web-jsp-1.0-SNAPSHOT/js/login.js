
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
    })
