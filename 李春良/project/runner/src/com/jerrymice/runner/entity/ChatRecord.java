package com.jerrymice.runner.entity;

import javax.persistence.CascadeType;
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
@Table(name="t_chatrecord")
public class ChatRecord {
    private Integer id;
    private Timestamp times;
    private String content;
    private User uId;       
    private User talkerId; 

    
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "uId")
    public User getuId() {
        return uId;
    }

    public void setuId(User uId) {
        this.uId = uId;
    }

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "talkerId")
    public User getTalkerId() {
        return talkerId;
    }

    public void setTalkerId(User talkerId) {
        this.talkerId = talkerId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChatRecord that = (ChatRecord) o;
        return id == that.id &&
                Objects.equals(times, that.times) &&
                Objects.equals(content, that.content) &&
                Objects.equals(uId, that.uId) &&
                Objects.equals(talkerId, that.talkerId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, times, content, uId, talkerId);
    }
}
