package com.jerrymice.runner.util.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
	
	/**
	 * 
	* @Function: save
	* @Description: 增加数据
	*
	* @values: T object
	* @return：在数据库中的主码值
	*
	* @author: 金
	* @date: 2018年12月3日 上午11:04:52 
	*
	 */
	public Serializable save(T object);
	
	
	/**
	 * 
	* @Function: delete
	* @Description: 删除数据
	*
	* @values: T object
	* @return：无
	*
	* @author: 金
	* @date: 2018年12月3日 上午11:14:15 
	*
	 */
	public void delete(T object);
	
	
	/**
	 * 
	* @Function: update
	* @Description: 更新数据
	*
	* @values: T object
	* @return：无
	*
	* @author: 金
	* @date: 2018年12月3日 下午1:50:29 
	*
	 */
	public void update(T object);
	
	
	/**
	 * 
	* @Function: saveOrUpdate
	* @Description: 保存或更新数据
	*
	* @values: T object
	* @return：无
	*
	* @author: 金
	* @date: 2018年12月3日 下午1:53:47 
	*
	 */
	public void saveOrUpdate(T object);
	
	
	/**
	 * 
	* @Function: get
	* @Description: 根据在数据库中的主码值查询该数据
	*
	* @values: Serializable id
	* @return：数据对象
	*
	* @author: 金
	* @date: 2018年12月3日 下午1:55:33 
	*
	 */
	public T get(Serializable id);
	
	
	/**
	 * 
	* @Function: get
	* @Description: 根据条件查询该数据
	*
	* @values: String queryString,Object[]values
	* @return：数据对象
	*
	* @author: 金
	* @date: 2018年12月3日 下午1:57:33 
	*
	 */
	public T get(String queryString,Object[]values);
	
	
	/**
	 * 
	* @Function: get
	* @Description: 根据条件查询该数据
	*
	* @values: String queryString,List<Object>values
	* @return：数据对象
	*
	* @author: 金
	* @date: 2018年12月3日 下午1:59:54 
	*
	 */
	public T get(String queryString,List<Object>values);
	
	
	/**
	 * 
	* @Function: find
	* @Description: 查询该类型在数据库中的所有数据
	*
	* @values: 无
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:01:27 
	*
	 */
	public List<T>find();
	
	
	/**
	 * 
	* @Function: findPart
	* @Description: 查询该类型在数据库中的前count个数据
	*
	* @values: int count
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:03:30 
	*
	 */
	public List<T>findPart(int count);
	
	
	/**
	 * 
	* @Function: findPart
	* @Description: 根据条件查询该类型在数据库中的前count个数据
	*
	* @values: int count,String queryString,Object[]values
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:06:39 
	*
	 */
	public List<T>findPart(int count,String queryString,Object[]values);
	
	
	/**
	 * 
	* @Function: finPart
	* @Description: 根据条件查询该类型在数据库中的前count个数据
	*
	* @values: int count,String queryString,List<Object>values
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:21:39 
	*
	 */
	public List<T>findPart(int count,String queryString,List<Object>values);
	
	
	/**
	 * 
	* @Function: find
	* @Description: 根据条件查询该类型在数据库中的数据
	*
	* @values: String queryString,Object[]values
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:09:20 
	*
	 */
	public List<T>find(String queryString,Object[]values);
	
	
	/**
	 * 
	* @Function: find
	* @Description: 根据条件查询该类型在数据库中的数据
	*
	* @values:String queryString,List<Object>values
	* @return：集合List
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:10:55 
	*
	 */
	public List<T>find(String queryString,List<Object>values);
	
	
	/**
	 * 
	* @Function: find
	* @Description: 根据条件分页查询该类型在数据库中的数据
	*
	* @values: String queryString,Object []values,Integer page,Integer size
	* @return：集合List(第page页)
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:12:14 
	*
	 */
	public List<T>find(String queryString,Object []values,Integer page,Integer size);
	
	
	/**
	 * 
	* @Function: find
	* @Description: 根据条件分页查询该类型在数据库中的数据
	*
	* @values:String queryString,List<Object>values,Integer page,Integer size
	* @return：集合List(第page页)
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:14:13 
	*
	 */
	public List<T>find(String queryString,List<Object>values,Integer page,Integer size);
	
	
	/**
	 * 
	* @Function: getCount
	* @Description: 查询该类型数据在数据库中的数量
	*
	* @values: 无
	* @return：数量
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:15:30 
	*
	 */
	public Integer getCount();
	
	
	/**
	 * 
	* @Function: getCount
	* @Description: 根据条件查询该类型数据在数据库中的数量
	*
	* @values: String queryString,Object[]values
	* @return：数量
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:17:33 
	*
	 */
	public Integer getCount(String queryString,Object[]values);
	
	
	/**
	 * 
	* @Function: getCount
	* @Description:  根据条件查询该类型数据在数据库中的数量
	*
	* @values: String queryString,List<Object>values
	* @return：数量
	*
	* @author: 金
	* @date: 2018年12月3日 下午2:25:00 
	*
	 */
	public Integer getCount(String queryString,List<Object>values);
}
