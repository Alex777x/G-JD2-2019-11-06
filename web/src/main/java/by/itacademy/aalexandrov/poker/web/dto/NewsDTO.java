package by.itacademy.aalexandrov.poker.web.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class NewsDTO {

	private Integer id;

	@NotNull
	@Size(min = 1, max = 50)
	private String newsTitle;

	@NotNull
	@Size(min = 1, max = 1000)
	private String newsText;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsText() {
		return newsText;
	}

	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}

}
