function getCookie(name) {
    var start, end;
    if (document.cookie.length > 0) {
        start = document.cookie.indexOf(name + "=");
        if (start >= 0) {
            start = start + name.length + 1;
            end = document.cookie.indexOf(";", start);
            if (end < 0) end = document.cookie.length;
            return unescape(document.cookie.substring(start, end));
        }
    }
    return "";
}

function setCookie(name, value, expiretime) {
    var timer = (new Date()).getTime();
    if (expiretime.day) timer += expiretime.day * 24 * 3600 * 1000;
    if (expiretime.minute) timer += expiretime.minute * 3600 * 1000;
    if (expiretime.second) timer += expiretime.second * 1000;
    var exdate = new Date();
    exdate.setTime(timer);

    document.cookie = name + "=" + escape(value) +
        ((expiretime == null) ? "" : ";expires=" + exdate.toGMTString());
}

function getQueryString() {
    //获取查询字符串，即?之后的部分
    var query = window.location.search.substring(1);
    //以&符号为界把查询字符串分割成数组
    var array = query.split("&");
    //返回的结果对象
    var result = {};
    for (var i = 0; i < array.length; i++)
    {
        //获取每个参数中的等号小标的位置  
        var p = array[i].indexOf("=");
        //如果没有发现测跳到下一次循环继续操作  
        if (p == -1) continue;
        //截取等号前的参数名称，这里分别是id和name  
        var name = array[i].substring(0, p);
        //截取等号后的参数值  
        var value = array[i].substring(p + 1);
        //以名/值对的形式存储在对象中  
        result[name] = value;
    }
    return result;
}