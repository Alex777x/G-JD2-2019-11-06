package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.persistence.Version;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;

@Entity
@Indexed
public class News extends BaseEntity implements INews {

	@Column
	private String newsTitle;

	@Column
	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	private String newsText;

	@Column
	@Version
	private int version;

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

	@Override
	public int getVersion() {
		return version;
	}

	@Override
	public void setVersion(int version) {
		this.version = version;
	}

}
