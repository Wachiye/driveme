<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<main class="main">
    <div class="main-about">
        <h2 class="title">We Will Drive You Home</h2>
        <p class="desc">Tired of long hours of driving? DriveMe has plenty of drivers to drive you home in your car.</p>
    </div>
    <div class="stats container">
        <div class="stat">
            <div class="icon display-flex">
                <i class="fa fa-car fa-2x"></i>
            </div>
            <h3 class="head">Drivers</h3>
            <p class="decs">700</p>
        </div>
        <div class="stat">
            <div class="icon display-flex">
                <i class="fa fa-users fa-2x"></i>
            </div>
            <h3 class="head">Clients</h3>
            <p class="decs">1200</p>
        </div>
        <div class="stat">
            <div class="icon display-flex">
                <i class="fa fa-currency fa-2x"></i>
            </div>
            <h3 class="head">Payouts</h3>
            <p class="decs">123,456</p>
        </div>
        <div class="stat">
            <div class="icon display-flex">
                <i class="fa fa-map-marker fa-2x"></i>
            </div>
            <h3 class="head">Counties</h3>
            <p class="decs">47</p>
        </div>
    </div>
    <div id="why-us" class="container why-us">
        <h2 class="text-center">Why You Should Use Drive Me</h2>
        <div class="whys">
            <div class="why shadow ">
                <div class="icon display-flex">
                    <img src="images/time.png" alt="" />
                </div>
                <h3 class="head">Time Saver</h3>
                <p class="decs">100% Time Saving</p>
            </div>
            <div class="why shadow">
                <div class="icon display-flex">
                    <img src="images/security.png" alt="" />
                </div>
                <h3 class="head">Security</h3>
                <p class="decs">Confidentiality & Integrity Maintenance</p>
            </div>
            <div class="why shadow">
                <div class="icon display-flex">
                    <img src="images/availability.png" alt="" />
                </div>
                <h3 class="head">Availability</h3>
                <p class="decs">Remote User Support</p>
            </div>
            <div class="why shadow">
                <div class="icon display-flex">
                    <img src="images/customer_service.png" alt="" />
                </div>
                <h3 class="head">We care</h3>
                <p class="decs">24/7 Customer Support</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row mb-2">
            <div class="col-12 text-center">
                <h2>Getting Started on DriveMe</h2>
            </div>
            <div class="col-md-4 mb-2">
                <div class="card bg-transparent h-100">
                    <div class="card-body">
                        <h3 class="card-title">Create Account</h3>
                        <p class="card-text">The first Step is create a new account with DriveMe. Please provide valid information</p>
                    </div>
                    <div class="card-footer">
                        <a href="register" class="card-link">Create Account</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-2">
                <div class="card bg-transparent h-100">
                    <div class="card-body">
                        <h3 class="card-title">Verify Account</h3>
                        <p class="card-text">You will be required to verify your identification and driving licence to use DriveMe. If you already have an account, login to verify.</p>
                    </div>
                    <div class="card-footer">
                        <a href="login" class="card-link">Login Here</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-2 ">
                <div class="card bg-transparent h-100">
                    <div class="card-body">
                        <h3 class="card-title">Verify Payment</h3>
                        <p class="card-text">Verify payment to successfully complete and validate your DriveMe account. If you already have an account, login to verify.</p>
                    </div>
                    <div class="card-footer">
                        <a href="login" class="card-link">Login Here</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-12">
                <h2 class="text-center">What Clients Say</h2>
            </div>
            <div class="col-md-8 offset-md-2">
                <div class="testimonial">
                    <blockquote class="blockquote">
                        <p class="text-center">
                            <i class="fa fa-quote-left"></i>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto dolor necessitatibus quas reiciendis veritatis? Aperiam consequuntur deleniti eum molestiae necessitatibus officia, perspiciatis, quo quod sed temporibus tenetur veritatis voluptate voluptatum!
                            <i class="fa fa-quote-right"></i>
                        </p>
                        <div class="blockquote-footer">
                            <h5>Client's Name</h5>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <i class="fa fa-envelope"></i>
                                    example@gmail.com
                                </li>
                                <li class="list-inline-item">
                                    <i class="fa fa-phone"></i>
                                    0712329290
                                </li>
                            </ul>
                        </div>
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="includes/footer.jsp"%>