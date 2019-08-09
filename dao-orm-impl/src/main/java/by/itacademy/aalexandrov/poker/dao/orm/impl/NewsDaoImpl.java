package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;

import org.hibernate.jpa.criteria.OrderImpl;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.INewsDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.dao.api.filter.NewsFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.News;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.News_;

@Repository
public class NewsDaoImpl extends AbstractDaoImpl<INews, Integer> implements INewsDao {

	protected NewsDaoImpl() {
		super(News.class);
	}

	@Override
	public INews createEntity() {
		return new News();
	}

	@Override
	public List<INews> find(NewsFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<INews> cq = cb.createQuery(INews.class);

		final Root<News> from = cq.from(News.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super News, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<INews> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(NewsFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<News> from = cq.from(News.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(INews... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super News, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return News_.created;
		case "updated":
			return News_.updated;
		case "id":
			return News_.id;
		case "newsTitle":
			return News_.newsTitle;
		case "newsText":
			return News_.newsText;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

	@Override
	public List<INews> search(String text) {

		EntityManager em = getEntityManager();
		FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search.getFullTextEntityManager(em);

		// create native Lucene query unsing the query DSL
		// alternatively you can write the Lucene query using the Lucene query
		// parser
		// or the Lucene programmatic API. The Hibernate Search DSL is
		// recommended though
		QueryBuilder qb = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(News.class).get();
		org.apache.lucene.search.Query luceneQuery = qb.keyword().onFields("newsText").matching(text).createQuery();

		// wrap Lucene query in a javax.persistence.Query
		javax.persistence.Query jpaQuery = fullTextEntityManager.createFullTextQuery(luceneQuery, News.class);

		return jpaQuery.getResultList();

	}

}
