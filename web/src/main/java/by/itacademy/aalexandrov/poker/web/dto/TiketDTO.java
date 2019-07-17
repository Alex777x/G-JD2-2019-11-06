package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class TiketDTO {

	private Integer id;
	
	@NotNull
	private Integer userAccount;
	@Size(min = 1, max = 50)
	private String tiketTitle;
	@Size(min = 1, max = 500)
	private String tiketText;
	@NotNull
	private String status;
	private Date created;
	private Date updated;

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public Integer getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(Integer userAccount) {
		this.userAccount = userAccount;
	}

	public String getTiketTitle() {
		return tiketTitle;
	}

	public void setTiketTitle(String tiketTitle) {
		this.tiketTitle = tiketTitle;
	}

	public String getTiketText() {
		return tiketText;
	}

	public void setTiketText(String tiketText) {
		this.tiketText = tiketText;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
