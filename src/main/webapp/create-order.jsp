<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>
<main class="main">
    <div class="register container">
        <div class="card bg-transparent border-0 shadow my-3 mx-auto" style="max-width: 900px">
            <h3 class="card-header text-center">Create New Order</h3>
            <div class="card-body">
                <form class="mx-auto" action="orders" method="post">
                    <jsp:include page="includes/alert.jsp" />
                    <div class="form-row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input class="form-control" type="text" name="title" id="title" placeholder="Title for order" minlength="5">
                                <span class="text-info form-text">A good title should be not be than 10 words</span>
                            </div>
                            <div class="form-group">
                                <label for="shortDesc">Short Description</label>
                                <textarea class="form-control" name="shortDesc" id="shortDesc" placeholder="Short Order Description" minlength="20" maxlength="300" rows="3"></textarea>
                                <span class="text-info form-text">Should be 20 - 300 characters</span>
                            </div>
                            <div class="form-group">
                                <label for="longDesc">Long Description</label>
                                <textarea class="form-control" name="longDesc" id="longDesc" placeholder="Short Order Description" minlength="100" maxlength="1000" rows="5"></textarea>
                                <span class="text-info form-text">Should be 100 - 1000 characters</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="expertise">Expertise Level Needed</label>
                                <select name="expertise" id="expertise" class="form-control">
                                    <option value="any">Any</option>
                                    <option value="beginner">Beginner</option>
                                    <option value="competent">Competent</option>
                                    <option value="proficient">Proficient</option>
                                    <option value="expert">Expert</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="ageRange">Drivers Age Range</label>
                                <select name="ageRange" id="ageRange" class="form-control">
                                    <option value="any">Any Age</option>
                                    <option value="18+">18+ years</option>
                                    <option value="18-25">18-25 years</option>
                                    <option value="25+">25+ years</option>
                                    <option value="25-35">25-35 years</option>
                                    <option value="35+">35+ years</option>
                                    <option value="35-50">35-50 years</option>
                                    <option value="50+">50+ years</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="experience">Minimum Years of Experience </label>
                                <select name="experience" id="experience" class="form-control">
                                    <option value="0+">0+ years</option>
                                    <option value="3+">3+ years</option>
                                    <option value="6+">6+ years</option>
                                    <option value="10+">10+ years</option>
                                    <option value="21+">21+ years</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="vehicleType">Vehicle Type</label>
                                <input class="form-control" type="text" name="vehicleType" id="vehicleType" placeholder="Vehicle Type">
                            </div>
                            <div class="form-group">
                                <label for="pay">Order Amount</label>
                                <input class="form-control" type="pay" name="pay" id="pay" placeholder="Order Amount">
                            </div>
                            <div class="form-group">
                                <label for="deadline">Deadline</label>
                                <input class="form-control" type="text" name="deadline" id="deadline" placeholder="Deadline">
                            </div>
                            <input class="form-control" type="hidden" name="status" id="status" value="active">
                        </div>
                    </div>
                    <button class="btn btn-dark btn-sm" type="submit" name="order-button" id="order-button">Create Order</button>
                </form>
            </div>
        </div>
    </div>
</main>
<%@ include file="includes/footer.jsp"%>