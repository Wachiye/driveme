<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>
<main class="main">
    <div class="register container">
        <div class="card bg-transparent border-0 shadow my-3 mx-auto" style="max-width: 600px">
            <h3 class="card-header text-center">Register With DriveMe</h3>
            <div class="card-body">
                <form class="mx-auto" action="register" method="post">
                    <jsp:include page="includes/alert.jsp" />
                    <div class="form-row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input class="form-control" type="text" name="firstName" id="firstName" placeholder="First Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <input class="form-control" type="text" name="lastName" id="lastName" placeholder="Last Name">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input class="form-control" type="text" name="username" id="username" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="email" name="email" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="userType">Register As</label>
                        <select name="userType" id="userTYpe" class="form-control">
                            <option value="client">Client</option>
                            <option value="driver">Driver</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password" placeholder="Password">
                    </div>
                    <button class="btn btn-dark btn-sm" type="submit" name="register-button" id="register-button">Register Account</button>
                </form>
            </div>
            <div class="card-footer bg-transparent">
                <p>Already have an account?
                    <a href="login">Login</a>
                </p>
            </div>
        </div>
    </div>
</main>
<%@ include file="includes/footer.jsp"%>