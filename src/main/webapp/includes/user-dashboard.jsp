<%@ page import="com.sirah.driveme.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="user-dashboard">
    <div class="container">
        <div class="updates">
            <div class="update">
                <div class="icon display-flex">
                    <i class="fa fa-edit fa-2x"></i>
                </div>
                <h3 class="head">My Orders</h3>
                <p class="decs">0</p>
            </div>
            <div class="update">
                <div class="icon display-flex">
                    <i class="fa fa-thumbs-up fa-2x"></i>
                </div>
                <h3 class="head">Bids Made</h3>
                <p class="decs">47</p>
            </div>
            <div class="update">
                <div class="icon display-flex">
                    <i class="fa fa-handshake fa-2x"></i>
                </div>
                <h3 class="head">Successful Bids</h3>
                <p class="decs">17</p>
            </div>
            <div class="update">
                <div class="icon display-flex">
                    <i class="fa fa-bank fa-2x"></i>
                </div>
                <h3 class="head">Total Payments</h3>
                <p class="decs">7000</p>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-12 mb-2">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <h4 class="card-title">Pending/Active Bids</h4>
                        <table class="table table-sm table-bordered table-striped">
                            <thead class="bg-dark text-light">
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Client</th>
                                <th>Uploaded</th>
                                <th>Bids Placed</th>
                                <th>Bid Date</th>
                                <th>Status</th>
                                <th>Deadline</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>23456</td>
                                    <td class="small">I need a Driver along Nairobi-Nakuru road</td>
                                    <td>
                                        Alvin Metro
                                        <span class="text-muted small">Verified</span>
                                    </td>
                                    <td>20/08/2021</td>
                                    <td>17</td>
                                    <td>20/08/2021</td>
                                    <td>Pending</td>
                                    <td>27/08/2021</td>
                                    <td class="text-center">
                                        <ul class="list-inline">
                                            <li class="list-inline-item" title="Edit Bid">
                                                <a href="bids?action=edit&id=23456">
                                                    <i class="fa fa-edit text-primary"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item" title="Delete Bid">
                                                <a href="bids?action=delete&id=23456">
                                                    <i class="fa fa-trash text-danger"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>23456</td>
                                    <td class="small">I need a Driver along Nairobi-Nakuru road</td>
                                    <td>
                                        Alvin Metro
                                        <span class="text-muted small">Verified</span>
                                    </td>
                                    <td>20/08/2021</td>
                                    <td>17</td>
                                    <td>20/08/2021</td>
                                    <td>Pending</td>
                                    <td>27/08/2021</td>
                                    <td class="text-center">
                                        <ul class="list-inline">
                                            <li class="list-inline-item" title="Edit Bid">
                                                <a href="bids?action=edit&id=23456">
                                                    <i class="fa fa-edit text-primary"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item" title="Delete Bid">
                                                <a href="bids?action=delete&id=23456">
                                                    <i class="fa fa-trash text-danger"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <%-- this is the view all button row --%>
                                <tr>
                                    <td class="text-center" colspan="9">
                                        <a href="bids" class="card-link rounded-circle img-thumbnail">
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
                        <h6>Bid Acceptance/Rejection analysis</h6>
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
                        <h4 class="card-title">Upcoming Payments</h4>
                        <table class="table table-sm table-bordered table-striped">
                            <thead class="bg-dark text-light">
                            <tr>
                                <th>ID</th>
                                <th>Bid ID</th>
                                <th>Client</th>
                                <th>Gateway</th>
                                <th>Amount</th>
                                <th>Payable</th>
                                <th>Status</th>
                                <th>Expected</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>23456</td>
                                <td>243553</td>
                                <td>
                                    Alvin Metro
                                    <span class="text-muted small">Verified</span>
                                </td>
                                <td>Mpesa</td>
                                <td>700</td>
                                <td>650</td>
                                <td>Pending</td>
                                <td>27/08/2021</td>
                                <td class="text-center">
                                    <ul class="list-inline">
                                        <li class="list-inline-item" title="Edit Bid">
                                            <a href="bids?action=edit&id=23456">
                                                <i class="fa fa-edit text-primary"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item" title="Delete Bid">
                                            <a href="bids?action=delete&id=23456">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>23456</td>
                                <td>243553</td>
                                <td>
                                    Alvin Metro
                                    <span class="text-muted small">Verified</span>
                                </td>
                                <td>Mpesa</td>
                                <td>700</td>
                                <td>650</td>
                                <td>Pending</td>
                                <td>27/08/2021</td>
                                <td class="text-center">
                                    <ul class="list-inline">
                                        <li class="list-inline-item" title="Edit Bid">
                                            <a href="bids?action=edit&id=23456">
                                                <i class="fa fa-edit text-primary"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item" title="Delete Bid">
                                            <a href="bids?action=delete&id=23456">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <%-- this is the view all button row --%>
                            <tr>
                                <td class="text-center" colspan="9">
                                    <a href="payments" class="card-link rounded-circle img-thumbnail">
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
