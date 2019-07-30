package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;

@Entity
public class Country extends BaseEntity implements ICountry {

	@Column // simple column
	private String country;

	@Transient // skip from DB mapping
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

	@Override
	public String getCountry() {
		return country;
	}

	@Override
	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Country [country=" + country + "]";
	}

}
