package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBaseEntity;

public abstract class BaseEntity implements IBaseEntity {

	private Integer id;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	@Override
	public String toString() {
		return "BaseEntity [id=" + id + ", created=" + created + ", updated=" + updated + "]";
	}

}
