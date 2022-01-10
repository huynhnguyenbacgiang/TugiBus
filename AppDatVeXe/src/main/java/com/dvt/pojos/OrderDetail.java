package com.dvt.pojos;

import javax.persistence.Entity;
import javax.persistence.Table;

public class OrderDetail {
    private int userId;
    private int transId;

    public OrderDetail() {
    }

    public OrderDetail(int userId, int transId) {
        this.userId = userId;
        this.transId = transId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTransId() {
        return transId;
    }

    public void setTransId(int transId) {
        this.transId = transId;
    }
}
