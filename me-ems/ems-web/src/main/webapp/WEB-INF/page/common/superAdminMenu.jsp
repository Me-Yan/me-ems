<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/downlist/downlist.css">
<script src="${pageContext.request.contextPath}/resources/scripts/downlist/maps.js"></script>
<script src="${pageContext.request.contextPath}/resources/scripts/downlist/google.js"></script>
<script>
    $(function () {
        $(".downlist-content").maps();
    });
</script>


<div class="downlist-content">
    <ul class="venus-menu">
        <li class="active">
            <a href="#"><i class="icon-home"></i>Home</a>
        </li>
        <li>
            <a href="#"><i class="icon-magic"></i>About</a>
        </li>
        <li>
            <a href="#"><i class="icon-thumbs-up"></i>Services</a>
            <ul>
                <li><a href="#">Web Design</a></li>
                <li><a href="#">Hosting</a></li>
                <li><a href="#">Design</a></li>
                <li><a href="#">Consulting</a></li>
            </ul>
        </li>
        <li>
            <a href="#"><i class="icon-quote-right"></i>Blog</a>
        </li>
        <li>
            <a href="#"><i class="icon-envelope-alt"></i>Contact</a>
        </li>
    </ul>
</div>
</div>