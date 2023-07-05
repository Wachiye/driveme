<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>
<main class="main">
    <div class="login container">
        <div class="card bg-transparent border-0 shadow my-3 mx-auto" style="max-width: 400px">
            <h3 class="card-header text-center">Login to DriveMe</h3>
            <div class="card-body">
                <form action="login" method="post">
                    <jsp:include page="includes/alert.jsp" />
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="email" name="email" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password" placeholder="Password">
                    </div>
<%--                    <p class="text-right">--%>
<%--                        <a href="password?action=request">Forgot Password?</a>--%>
<%--                    </p>--%>
                    <button class="btn btn-dark btn-block" type="submit" name="login-button" id="login-button">Login</button>
                </form>
            </div>
            <div class="card-footer bg-transparent">
                <p>Don't have an account?
                    <a href="register">Register</a>
                </p>
            </div>
        </div>

    </div>
</main>
<%@ include file="includes/footer.jsp"%>