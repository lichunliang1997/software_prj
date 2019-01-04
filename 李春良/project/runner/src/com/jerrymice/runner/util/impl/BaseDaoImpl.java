package com.jerrymice.runner.util.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.jerrymice.runner.util.dao.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T> {
	@Resource(name="hibernateTemplateId")
	private HibernateTemplate hibernateTemplate;
	
	private Class<?>entityClass;
	
	public BaseDaoImpl() {
		ParameterizedType parameterizedType=
				(ParameterizedType)this.getClass().getGenericSuperclass();
		entityClass=(Class<?>)parameterizedType.getActualTypeArguments()[0];
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public Serializable save(T object) {
		// TODO Auto-generated method stub
		return this.hibernateTemplate.save(object);
	}

	@Override
	public void delete(T object) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.delete(object);
	}

	@Override
	public void update(T object) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.update(object);
	}

	@Override
	public void saveOrUpdate(T object) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.saveOrUpdate(object);
	}

	@Override
	public T get(Serializable id) {
		// TODO Auto-generated method stub
		return (T) this.hibernateTemplate.get(entityClass, id);
	}

	@Override
	public T get(String queryString, Object[] values) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		if(list.size()!=0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public T get(String queryString, List<Object> values) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		if(list.size()!=0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<T> find() {
		// TODO Auto-generated method stub
		return (List<T>) this.hibernateTemplate.loadAll(entityClass);
	}

	@Override
	public List<T> findPart(int count) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.setMaxResults(count);
		List<T>list=(List<T>) this.hibernateTemplate.find("from "+entityClass.getName());
		this.hibernateTemplate.setMaxResults(0);
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> findPart(int count, String queryString, Object[] values) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.setMaxResults(count);
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		this.hibernateTemplate.setMaxResults(0);
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> findPart(int count, String queryString, List<Object> values) {
		// TODO Auto-generated method stub
		this.hibernateTemplate.setMaxResults(count);
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		this.hibernateTemplate.setMaxResults(0);
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> find(String queryString, Object[] values) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> find(String queryString, List<Object> values) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.find(queryString, values);
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> find(final String queryString, final Object[] values,final Integer page, final Integer size) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				Query query=session.createQuery(queryString);
				int i=0;
				for(Object value:values) {
					query.setParameter(i++, value);
				}
				return query.setFirstResult((page-1)*size).setMaxResults(size).list();
			}
			
		});
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public List<T> find(final String queryString, final List<Object> values, final Integer page,final Integer size) {
		// TODO Auto-generated method stub
		List<T>list=(List<T>) this.hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				// TODO Auto-generated method stub
				Query query=session.createQuery(queryString);
				int i=0;
				for(Object value:values) {
					query.setParameter(i++, value);
				}
				return query.setFirstResult((page-1)*size).setMaxResults(size).list();
			}
			
		});
		if(list.size()!=0) {
			return list;
		}
		return null;
	}

	@Override
	public Integer getCount() {
		// TODO Auto-generated method stub
		return this.hibernateTemplate.loadAll(entityClass).size();
	}

	@Override
	public Integer getCount(String queryString, Object[] values) {
		// TODO Auto-generated method stub
		return this.hibernateTemplate.find(queryString, values).size();
	}

	@Override
	public Integer getCount(String queryString, List<Object> values) {
		// TODO Auto-generated method stub
		return this.hibernateTemplate.find(queryString, values).size();
	}

}
