package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;

@Entity
public class News extends BaseEntity implements INews {

	@Column
	private String newsTitle;

	@Column
	private String newsText;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

	@Override
	public String getNewsTitle() {
		return newsTitle;
	}

	@Override
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	@Override
	public String getNewsText() {
		return newsText;
	}

	@Override
	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}

}
