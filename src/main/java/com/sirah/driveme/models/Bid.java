package com.sirah.driveme.models;

public class Bid {
    private String id;
    private String driverId;
    private String orderId;
    private String profile;
    private String bidDate;
    private String status;
    private String closureDate;

    public Bid() {
    }

    public Bid(String id, String driverId, String orderId, String profile, String bidDate, String status, String closureDate) {
        this.id = id;
        this.driverId = driverId;
        this.orderId = orderId;
        this.profile = profile;
        this.bidDate = bidDate;
        this.status = status;
        this.closureDate = closureDate;
    }

    //getters and setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getBidDate() {
        return bidDate;
    }

    public void setBidDate(String bidDate) {
        this.bidDate = bidDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getClosureDate() {
        return closureDate;
    }

    public void setClosureDate(String closureDate) {
        this.closureDate = closureDate;
    }

    //to string
    @Override
    public String toString(){
        return id + "|" +
                orderId + "|" +
                driverId + "|" +
                profile + "|" +
                bidDate + "|" +
                status + "|" +
                closureDate;
    }
}
