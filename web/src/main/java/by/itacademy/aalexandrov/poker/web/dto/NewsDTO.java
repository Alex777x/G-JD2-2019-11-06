package by.itacademy.aalexandrov.poker.web.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class NewsDTO {

	private Integer id;

	@Size(min = 1, max = 50)
	private String newsTitle;

	@Size(min = 1, max = 10000)
	private String newsText;

	@NotNull
	private int version;

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

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
