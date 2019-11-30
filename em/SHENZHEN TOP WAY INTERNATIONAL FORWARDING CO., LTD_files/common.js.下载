
/*表单AJAX提交封装(包含验证)
------------------------------------------------*/
var showmsg = function (msg) {//假定你的信息提示方法为showmsg， 在方法里可以接收参数msg，当然也可以接收到o及cssctl;
    if (msg != '' && $.trim(msg))
        alert(msg);
}
function AjaxInitForm(formObj, btnObj, isDialog, urlObj, callback) {
    var argNum = arguments.length; //参数个数
    $(formObj).Validform({
        tiptype: function (msg) {
            showmsg(msg);
        },
        tipSweep: true,//为true时提示信息将只会在表单提交时触发显示，各表单元素blur时不会被触发显示;
        callback: function (form) {
            //AJAX提交表单
            $(form).ajaxSubmit({
                beforeSubmit: formRequest,
                success: formResponse,
                error: formError,
                url: $(formObj).attr("url"),
                type: "post",
                dataType: "json",
                timeout: 60000
            });
            return false;
        }
    });

    //表单提交前
    function formRequest(formData, jqForm, options) {
        $(btnObj).prop("disabled", true);
        $(btnObj).val("提交中...");
    }

    //表单提交后
    function formResponse(data, textStatus) {
        if (data.status == 1) {
            $(btnObj).val("提交成功");
            //是否提示，默认不提示
            if (isDialog == 1) {
                alert(data.msg);
                if (argNum == 5) {
                    callback();
                } else if (data.url) {
                    location.href = data.url;
                } else if ($(urlObj).length > 0 && $(urlObj).val() != "") {
                    location.href = $(urlObj).val();
                } else {
                    location.reload();
                }
            } else {
                if (argNum == 5) {
                    callback();
                } else if (data.url) {
                    location.href = data.url;
                } else if ($(urlObj)) {
                    location.href = $(urlObj).val();
                } else {
                    location.reload();
                }
            }
        } else {
            alert(data.msg);
            $(btnObj).prop("disabled", false);
            $(btnObj).val("再次提交");
        }
    }
    //表单提交出错
    function formError(XMLHttpRequest, textStatus, errorThrown) {
        alert('状态：' + textStatus + '；出错提示：' + errorThrown);

        $(btnObj).prop("disabled", false);
        $(btnObj).val("再次提交");
    }
}