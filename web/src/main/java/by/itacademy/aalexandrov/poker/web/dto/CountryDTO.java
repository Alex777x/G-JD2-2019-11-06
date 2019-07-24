package by.itacademy.aalexandrov.poker.web.dto;

import javax.validation.constraints.Size;

public class CountryDTO {

	private Integer id;
	@Size(min = 1, max = 50)
	private String country;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
