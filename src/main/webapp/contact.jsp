<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>
<main class="main">
    <div class="contact container">
        <div class="title-bar shadow">
            <h1 class="title">Contact Us</h1>
            <p class="desc">Fill out the form bellow and we shall get back to you as soon as possible</p>
        </div>
        <form action="contact" method="post">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input class="form-control" type="text" name="firstName" id="firstName" placeholder="First Name">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input class="form-control" type="text" name="lastName" id="lastName" placeholder="Last Name">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input class="form-control" type="email" name="email" id="email" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" name="message" id="message" placeholder="Your Message" rows="5"></textarea>
            </div>
            <div class="form-group">
                <label for="password1">Confirm Password</label>
                <input class="form-control" type="password" name="password1" id="password1" placeholder="Confirm Password">
            </div>
            <button class="btn btn-dark btn-sm" type="submit" name="contact-button" id="contact-button">Contact</button>
        </form>
    </div>
</main>
<%@ include file="includes/footer.jsp"%>