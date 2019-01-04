package com.jerrymice.runner.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="t_information")
public class Information {
    private Integer id;
    private String name;
    private String sex;
    private String age;
    private Date birthday;
    private String phone;
    private String schoolNumber;
    private String major;
    private String clazz;
    private String grade;
    private String college;
    private String school;
    private String positiveImage;
    private String oppositeImage;
    private Integer aBalance;
    private String bankNumber;
    private Integer deposit;
    private Integer creditScore;
    private String paymentPassword;
    private User user;
    
    @Id
	@GeneratedValue(generator="ss")    
	@GenericGenerator(name="ss",
	       strategy="foreign",     
	       parameters=
	   	   {@Parameter(name="property",value="user")})
    public Integer getId() {
        return id;
    }


	public void setId(Integer id) {
        this.id = id;
    }
    
   @OneToOne(mappedBy="information")
    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSchoolNumber() {
        return schoolNumber;
    }

    public void setSchoolNumber(String schoolNumber) {
        this.schoolNumber = schoolNumber;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getPositiveImage() {
        return positiveImage;
    }

    public void setPositiveImage(String positiveImage) {
        this.positiveImage = positiveImage;
    }

    public String getOppositeImage() {
        return oppositeImage;
    }

    public void setOppositeImage(String oppositeImage) {
        this.oppositeImage = oppositeImage;
    }

    public Integer getaBalance() {
        return aBalance;
    }

    public void setaBalance(Integer aBalance) {
        this.aBalance = aBalance;
    }

    public String getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
    }

    public Integer getDeposit() {
        return deposit;
    }

    public void setDeposit(Integer deposit) {
        this.deposit = deposit;
    }

    public Integer getCreditScore() {
        return creditScore;
    }

    public void setCreditScore(Integer creditScore) {
        this.creditScore = creditScore;
    }

    public String getPaymentPassword() {
        return paymentPassword;
    }

    public void setPaymentPassword(String paymentPassword) {
        this.paymentPassword = paymentPassword;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aBalance == null) ? 0 : aBalance.hashCode());
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result + ((bankNumber == null) ? 0 : bankNumber.hashCode());
		result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
		result = prime * result + ((clazz == null) ? 0 : clazz.hashCode());
		result = prime * result + ((college == null) ? 0 : college.hashCode());
		result = prime * result + ((creditScore == null) ? 0 : creditScore.hashCode());
		result = prime * result + ((deposit == null) ? 0 : deposit.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((major == null) ? 0 : major.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((oppositeImage == null) ? 0 : oppositeImage.hashCode());
		result = prime * result + ((paymentPassword == null) ? 0 : paymentPassword.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((positiveImage == null) ? 0 : positiveImage.hashCode());
		result = prime * result + ((school == null) ? 0 : school.hashCode());
		result = prime * result + ((schoolNumber == null) ? 0 : schoolNumber.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		Information other = (Information) obj;
		if (aBalance == null) {
			if (other.aBalance != null)
				return false;
		} else if (!aBalance.equals(other.aBalance))
			return false;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (bankNumber == null) {
			if (other.bankNumber != null)
				return false;
		} else if (!bankNumber.equals(other.bankNumber))
			return false;
		if (birthday == null) {
			if (other.birthday != null)
				return false;
		} else if (!birthday.equals(other.birthday))
			return false;
		if (clazz == null) {
			if (other.clazz != null)
				return false;
		} else if (!clazz.equals(other.clazz))
			return false;
		if (college == null) {
			if (other.college != null)
				return false;
		} else if (!college.equals(other.college))
			return false;
		if (creditScore == null) {
			if (other.creditScore != null)
				return false;
		} else if (!creditScore.equals(other.creditScore))
			return false;
		if (deposit == null) {
			if (other.deposit != null)
				return false;
		} else if (!deposit.equals(other.deposit))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (major == null) {
			if (other.major != null)
				return false;
		} else if (!major.equals(other.major))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (oppositeImage == null) {
			if (other.oppositeImage != null)
				return false;
		} else if (!oppositeImage.equals(other.oppositeImage))
			return false;
		if (paymentPassword == null) {
			if (other.paymentPassword != null)
				return false;
		} else if (!paymentPassword.equals(other.paymentPassword))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (positiveImage == null) {
			if (other.positiveImage != null)
				return false;
		} else if (!positiveImage.equals(other.positiveImage))
			return false;
		if (school == null) {
			if (other.school != null)
				return false;
		} else if (!school.equals(other.school))
			return false;
		if (schoolNumber == null) {
			if (other.schoolNumber != null)
				return false;
		} else if (!schoolNumber.equals(other.schoolNumber))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
    
    
}
