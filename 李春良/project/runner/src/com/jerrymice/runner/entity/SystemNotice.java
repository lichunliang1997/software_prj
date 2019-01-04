package com.jerrymice.runner.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name="t_systemnotice")
public class SystemNotice {
    private Integer id;
    private Timestamp times;
    private Integer status;
    private String content;
    private User uId;   

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getTimes() {
        return times;
    }

    public void setTimes(Timestamp times) {
        this.times = times;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @ManyToOne
    @JoinColumn(name = "uId")
    public User getuId() {
        return uId;
    }

    public void setuId(User uId) {
        this.uId = uId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SystemNotice that = (SystemNotice) o;
        return id == that.id &&
                status == that.status &&
                Objects.equals(times, that.times) &&
                Objects.equals(content, that.content) &&
                Objects.equals(uId, that.uId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, times, status, content, uId);
    }
}
