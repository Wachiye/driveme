package com.sirah.driveme.models;

public class Order {
    private String id;
    private String clientId;
    private String title;
    private String shortDesc;
    private String longDesc;
    private String expertise;
    private String vehicleType;
    private String experience;
    private String ageRange;
    private double pay;
    private String uploadDate;
    private String deadline;
    private String status;

    public Order() {
    }

    public Order(String id, String clientId, String title, String shortDesc, String longDesc, String expertise, String vehicleType, String experience, String ageRange, double pay, String uploadDate, String deadline, String status) {
        this.id = id;
        this.clientId = clientId;
        this.title = title;
        this.shortDesc = shortDesc;
        this.longDesc = longDesc;
        this.expertise = expertise;
        this.vehicleType = vehicleType;
        this.experience = experience;
        this.ageRange = ageRange;
        this.pay = pay;
        this.uploadDate = uploadDate;
        this.deadline = deadline;
        this.status = status;
    }

    //getters and setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getLongDesc() {
        return longDesc;
    }

    public void setLongDesc(String longDesc) {
        this.longDesc = longDesc;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getAgeRange() {
        return ageRange;
    }

    public void setAgeRange(String ageRange) {
        this.ageRange = ageRange;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    //to string
    @Override
    public String toString(){
        return id + "|" +
                clientId + "|" +
                title + "|" +
                shortDesc + "|" +
                longDesc + "|" +
                expertise + "|" +
                vehicleType + "|" +
                experience + "|" +
                ageRange + "|" +
                pay + "|" +
                uploadDate + "|" +
                deadline + "|" +
                status ;
    }
}
