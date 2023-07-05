<%@ page import="com.sirah.driveme.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="admin-dashboard">
    <div class="container">
        <div class="row mb-2">
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-edit fa-2x"></i>
                    </div>
                    <h3 class="head">Orders</h3>
                    <p class="decs">120</p>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-users fa-2x"></i>
                    </div>
                    <h3 class="head">Users</h3>
                    <p class="decs">1457</p>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-report fa-2x"></i>
                    </div>
                    <h3 class="head">Pending</h3>
                    <p class="decs">8700</p>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-bank fa-2x"></i>
                    </div>
                    <h3 class="head">Payouts</h3>
                    <p class="decs">170460</p>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-bank fa-2x"></i>
                    </div>
                    <h3 class="head">Earned</h3>
                    <p class="decs">5240</p>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                <div class="update shadow">
                    <div class="icon display-flex">
                        <i class="fa fa-comments fa-2x"></i>
                    </div>
                    <h3 class="head">Comments</h3>
                    <p class="decs">240</p>
                </div>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-md-8 mb-2">
                <div class="card bg-transparent h-100">
                    <div class="card-header bg-transparent d-flex justify-content-between align-items-center">
                        <h6>Order monthly upload analysis</h6>
                        <span>
                            <i class="fa fa-chart"></i>
                        </span>
                    </div>
                    <div class="card-body">
                        <canvas>

                        </canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-2">
                <div class="card bg-transparent h-100">
                    <div class="card-header bg-transparent d-flex justify-content-between align-items-center">
                        <h6>Regional Payout analysis</h6>
                        <span>
                            <i class="fa fa-chart"></i>
                        </span>
                    </div>
                    <div class="card-body">
                        <canvas>

                        </canvas>
                    </div>
                </div>
            </div>
            <div class="col-12 mb-2">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <h4 class="card-title">Top 10 Clients and Drivers</h4>
                        <table class="table table-sm table-bordered table-striped">
                            <thead class="bg-dark text-light">
                            <tr>
                                <th>#</th>
                                <th>Full Name</th>
                                <th>User Type</th>
                                <th>Orders</th>
                                <th>Bids</th>
                                <th>Spend</th>
                                <th>Earned</th>
                                <th>Last Payout</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Wachiye Siranjofu</td>
                                <td>Client</td>
                                <td>45</td>
                                <td>00</td>
                                <td>6580</td>
                                <td>00</td>
                                <td>1350</td>
                                <td class="text-center">
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a href="users?id=23456">View</a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-12 mb-2">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <h4 class="card-title">Recent Registered Users</h4>
                        <table class="table table-sm table-bordered table-striped">
                            <thead class="bg-dark text-light">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>User Type</th>
                                <th>Join Date</th>
                                <th>Verified</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Wachiye</td>
                                <td>Siranjofu</td>
                                <td>Siranjofu</td>
                                <td>siranjofuw@gmail.com</td>
                                <td>Client</td>
                                <td>20/08/2021</td>
                                <td>Verified</td>
                                <td>Active</td>
                                <td class="text-center">
                                    <ul class="list-inline">
                                        <li class="list-inline-item" title="Edit Bid">
                                            <a href="users?id=23456">View</a>
                                        </li>
                                        <li class="list-inline-item" title="Delete Bid">
                                            <a href="users?action=delete&id=23456">
                                                Delete
                                            </a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>Wachiye</td>
                                <td>Siranjofu</td>
                                <td>Siranjofu</td>
                                <td>siranjofuw@gmail.com</td>
                                <td>Client</td>
                                <td>20/08/2021</td>
                                <td>Pending</td>
                                <td>Inactive</td>
                                <td class="text-center">
                                    <ul class="list-inline">
                                        <li class="list-inline-item" title="Edit Bid">
                                            <a href="users?id=23456">View</a>
                                        </li>
                                        <li class="list-inline-item" title="Delete Bid">
                                            <a href="users?action=delete&id=23456">
                                                Delete
                                            </a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <%-- this is the view all button row --%>
                            <tr>
                                <td class="text-center" colspan="9">
                                    <a href="users" class="card-link rounded-circle img-thumbnail">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
