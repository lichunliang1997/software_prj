package com.jerrymice.runner.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import java.sql.Timestamp;

@Entity
@Table(name="t_order")
public class Order {
	private Integer id;
    private String orderNumber;
    private Integer money;
    private String receipt;
    private Station delivery;
    private String remarks;
    private Timestamp invoiceTime;
    private Timestamp receiptTime;
    private Timestamp successTime;
    private Integer status;
    private String deliveryTime;
    private User invoiceId;
    private User receiptId;
    private Integer size;
    private String schoolName;
    private String destLnglat;
    private String itemNumber;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    
    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    
    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    @ManyToOne
    @JoinColumn(name="delivery",nullable=false)
    public Station getDelivery() {
        return delivery;
    }

    public void setDelivery(Station delivery) {
        this.delivery = delivery;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

   
    public Timestamp getInvoiceTime() {
        return invoiceTime;
    }

    public void setInvoiceTime(Timestamp invoiceTime) {
        this.invoiceTime = invoiceTime;
    }

    
    public Timestamp getReceiptTime() {
        return receiptTime;
    }

    public void setReceiptTime(Timestamp receiptTime) {
        this.receiptTime = receiptTime;
    }

    
    public Timestamp getSuccessTime() {
        return successTime;
    }

    public void setSuccessTime(Timestamp successTime) {
        this.successTime = successTime;
    }

   
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

  
    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    @ManyToOne
    @JoinColumn(name = "invoiceId")
    public User getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(User invoiceId) {
        this.invoiceId = invoiceId;
    }

    @ManyToOne
    @JoinColumn(name = "receiptId")
    public User getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(User receiptId) {
        this.receiptId = receiptId;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
    
    public String getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }

	public String getDestLnglat() {
		return destLnglat;
	}

	public void setDestLnglat(String destLnglat) {
		this.destLnglat = destLnglat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((delivery == null) ? 0 : delivery.hashCode());
		result = prime * result + ((deliveryTime == null) ? 0 : deliveryTime.hashCode());
		result = prime * result + ((destLnglat == null) ? 0 : destLnglat.hashCode());
		result = prime * result + ((invoiceId == null) ? 0 : invoiceId.hashCode());
		result = prime * result + ((invoiceTime == null) ? 0 : invoiceTime.hashCode());
		result = prime * result + ((itemNumber == null) ? 0 : itemNumber.hashCode());
		result = prime * result + ((money == null) ? 0 : money.hashCode());
		result = prime * result + ((orderNumber == null) ? 0 : orderNumber.hashCode());
		result = prime * result + ((receipt == null) ? 0 : receipt.hashCode());
		result = prime * result + ((receiptId == null) ? 0 : receiptId.hashCode());
		result = prime * result + ((receiptTime == null) ? 0 : receiptTime.hashCode());
		result = prime * result + ((remarks == null) ? 0 : remarks.hashCode());
		result = prime * result + ((schoolName == null) ? 0 : schoolName.hashCode());
		result = prime * result + ((size == null) ? 0 : size.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((successTime == null) ? 0 : successTime.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (delivery == null) {
			if (other.delivery != null)
				return false;
		} else if (!delivery.equals(other.delivery))
			return false;
		if (deliveryTime == null) {
			if (other.deliveryTime != null)
				return false;
		} else if (!deliveryTime.equals(other.deliveryTime))
			return false;
		if (destLnglat == null) {
			if (other.destLnglat != null)
				return false;
		} else if (!destLnglat.equals(other.destLnglat))
			return false;
		if (invoiceId == null) {
			if (other.invoiceId != null)
				return false;
		} else if (!invoiceId.equals(other.invoiceId))
			return false;
		if (invoiceTime == null) {
			if (other.invoiceTime != null)
				return false;
		} else if (!invoiceTime.equals(other.invoiceTime))
			return false;
		if (itemNumber == null) {
			if (other.itemNumber != null)
				return false;
		} else if (!itemNumber.equals(other.itemNumber))
			return false;
		if (money == null) {
			if (other.money != null)
				return false;
		} else if (!money.equals(other.money))
			return false;
		if (orderNumber == null) {
			if (other.orderNumber != null)
				return false;
		} else if (!orderNumber.equals(other.orderNumber))
			return false;
		if (receipt == null) {
			if (other.receipt != null)
				return false;
		} else if (!receipt.equals(other.receipt))
			return false;
		if (receiptId == null) {
			if (other.receiptId != null)
				return false;
		} else if (!receiptId.equals(other.receiptId))
			return false;
		if (receiptTime == null) {
			if (other.receiptTime != null)
				return false;
		} else if (!receiptTime.equals(other.receiptTime))
			return false;
		if (remarks == null) {
			if (other.remarks != null)
				return false;
		} else if (!remarks.equals(other.remarks))
			return false;
		if (schoolName == null) {
			if (other.schoolName != null)
				return false;
		} else if (!schoolName.equals(other.schoolName))
			return false;
		if (size == null) {
			if (other.size != null)
				return false;
		} else if (!size.equals(other.size))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (successTime == null) {
			if (other.successTime != null)
				return false;
		} else if (!successTime.equals(other.successTime))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Order [orderNumber=" + orderNumber + ", money=" + money + ", receipt=" + receipt + ", delivery="
				+ delivery + ", remarks=" + remarks + ", invoiceTime=" + invoiceTime + ", receiptTime=" + receiptTime
				+ ", successTime=" + successTime + ", status=" + status + ", deliveryTime=" + deliveryTime
				+ ", invoiceId=" + invoiceId + ", receiptId=" + receiptId + ", size=" + size + ", schoolName="
				+ schoolName + ", destLnglat=" + destLnglat + ", itemNumber=" + itemNumber + "]";
	}

 
}
