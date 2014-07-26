function getCookie(name)
{
    var start, end;
    if (document.cookie.length > 0)
    {
        start = document.cookie.indexOf(name + "=");
        if (start >= 0)
        {
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