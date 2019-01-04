package com.jerrymice.runner.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name="t_station")
public class Station {
	private Integer id;
    private String name;
    private String address;
    private String lnglat;
    private Station parentId;      
    private List<Order>orderList=new ArrayList<>();
    @OneToMany(mappedBy="delivery",cascade=CascadeType.ALL)
    public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Id
    @GenericGenerator(name = "id", strategy = "assigned")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLnglat() {
        return lnglat;
    }

    public void setLnglat(String lnglat) {
        this.lnglat = lnglat;
    }

    @ManyToOne
    @JoinColumn(name = "parentId")
    @NotFound(action=NotFoundAction.IGNORE)
    public Station getParentId() {
        return parentId;
    }

    public void setParentId(Station parentId) {
        this.parentId = parentId;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((lnglat == null) ? 0 : lnglat.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((parentId == null) ? 0 : parentId.hashCode());
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
		Station other = (Station) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (lnglat == null) {
			if (other.lnglat != null)
				return false;
		} else if (!lnglat.equals(other.lnglat))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parentId == null) {
			if (other.parentId != null)
				return false;
		} else if (!parentId.equals(other.parentId))
			return false;
		return true;
	}
    
	  @Override
		public String toString() {
			return "Station [id=" + id + ", name=" + name + ", lnglat=" + lnglat + ", parentId=" + parentId + "]";
		}

}
