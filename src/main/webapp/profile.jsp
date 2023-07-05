<%@ page import="com.sirah.driveme.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<%
    User user = (User) session.getAttribute("user");
%>
<main class="main">
    <div class="container">
        <div class="title-bar shadow">
            <h1 class="title">Profile</h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <!-- Nav pills -->
                        <ul class="nav nav-pills nav-justified flex-md-column small">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#general">
                                    <i class="fa fa-user fa-2x"></i>
                                    <p>General</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#licence">
                                    <i class="fa fa-certificate fa-2x"></i>
                                    <p>Licence</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#skills">
                                    <i class="fa fa-graduation-cap fa-2x"></i>
                                    <p>Skills</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#files">
                                    <i class="fa fa-edit fa-2x"></i>
                                    <p>My Files</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#security">
                                    <i class="fa fa-lock fa-2x"></i>
                                    <p>Security</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane container active" id="general">
                        <h3 class="text-primary">General Information</h3>
                        <p class="lead">The information provided here is visible to the client when you bid their orders</p>
                        <p class="small">Ensure you use the right information to have higher chances of being hired.</p>
                        <form class="mx-auto" action="profile?action=edit&id=<%= user.getId()%>" method="post">
                            <jsp:include page="includes/alert.jsp" />
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input class="form-control" type="text" name="firstName" id="firstName" value="<%= user.getFirstName()%>" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastName">Last Name</label>
                                        <input class="form-control" type="text" name="lastName" id="lastName" value="<%= user.getLastName()%>" placeholder="Last Name">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input class="form-control" type="text" name="username" id="username" value="<%= user.getUsername()%>" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label for="dateOfBirth">Date Of Birth</label>
                                <input class="form-control" type="text" name="dateOfBirth" id="dateOfBirth" value="" placeholder="Format dd-mm-yyyy">
                            </div>
                            <div class="form-group">
                                <label for="profileBio">Profile Bio</label>
                                <textarea class="form-control" name="profileBio" id="profileBio" placeholder="Precisely Describe Yourself" minlength="100" maxlength="400" rows="3"></textarea>
                                <span class="text-info form-text">Should be 100 - 400 characters</span>
                            </div>
                            <button class="btn btn-dark btn-sm" type="submit" name="update-button" id="update-button">Update Account</button>
                        </form>
                    </div>
                    <div class="tab-pane container fade" id="licence">
                        <h3 class="text-primary">Licence</h3>
                        <p class="lead">Information about your Driving Licence will be used for validation and verification only</p>
                        <p class="small">Information provided should match National Transport and Safety Authority (NTSA) database</p>
                        <form class="mx-auto" action="profile?licence=edit&id=<%= user.getId()%>" method="post">
                            <jsp:include page="includes/alert.jsp" />
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="surname">Surname</label>
                                        <input class="form-control" type="text" name="surname" id="surname" placeholder="Licence Surname">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="otherNames">Other Names</label>
                                        <input class="form-control" type="text" name="otherNames" id="otherNames"  placeholder="Other Names">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bloodGroup">Blood Group</label>
                                <input class="form-control" type="text" name="bloodGroup" id="bloodGroup" placeholder="Blood Group">
                            </div>
                            <div class="form-group">
                                <label for="nationalId">National Id No</label>
                                <input class="form-control" type="number" name="nationalId" id="nationalId" placeholder="National ID number" min="1">
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="dateOfIssue">Date Of Issue</label>
                                        <input class="form-control" type="text" name="dateOfIssue" id="dateOfIssue" value="" placeholder="Format dd-mm-yyyy">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="dateOfExpiry">Date Of Expiry</label>
                                        <input class="form-control" type="text" name="dateOfExpiry" id="dateOfExpiry" value="" placeholder="Format dd-mm-yyyy">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="licenceNo">Driving Licence No</label>
                                        <input class="form-control" type="text" name="licenceNo" id="licenceNo" value="" placeholder="Driving Licence No">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="licenceImage">Licence Front Image</label>
                                        <input class="form-control form-control-file" type="file" name="licenceImage" id="licenceImage" accept=".png, .jpg, .jpeg" >
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-dark btn-sm" type="submit" name="update-button" id="update-button">Update Account</button>
                        </form>
                    </div>
                    <div class="tab-pane container fade" id="skills">
                        <h3 class="text-primary">Skills</h3>
                        <p class="lead">Academic Certificates/Awards</p>
                    </div>
                    <div class="tab-pane container fade" id="files">Files</div>
                    <div class="tab-pane container fade" id="security">
                        <h3 class="text-primary">Security(Change Password)</h3>
                        <p class="lead">Frequent changing of your password helps in maintaining security of your account.</p>
                        <p class="small">Ensure you keep your password secure as you be will accountable for any misconduct associated to your account</p>
                        <form class="mx-auto" action="profile?action=pwd&id=<%= user.getId()%>" method="post">
                            <jsp:include page="includes/alert.jsp" />
                            <div class="form-group">
                                <label for="currentPassword">Current Password</label>
                                <input class="form-control" type="password" name="currentPassword" id="currentPassword" placeholder="Current Password">
                            </div>
                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input class="form-control" type="password" name="newPassword" id="newPassword" placeholder="New Password">
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password</label>
                                <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
                            </div>
                            <button class="btn btn-dark btn-sm" type="submit" name="pwd-button" id="pwd-button">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="includes/footer.jsp" %>
