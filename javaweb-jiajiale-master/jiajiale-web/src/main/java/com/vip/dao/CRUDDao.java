package com.vip.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 针对所有表的Dao操作
 * @author Administrator
 *
 */
public interface CRUDDao<E,ID> {
	/**
	 * 新增
	 * @param e
	 * @throws SQLException
	 */
	void insert(E e)throws SQLException;

	/**
	 * 修改
	 * @param id
	 * @param map
	 * @throws SQLException
	 */
	void update(@Param("id")String id,@Param("e") Map<String,Object> map)throws SQLException;

	/**
	 * 删除
	 * @param id
	 * @throws SQLException
	 */
	void delete(ID id)throws SQLException;

	/**
	 * 通过id 查询
	 * @param id
	 * @return
	 * @throws SQLException
	 */
    E selectById(ID id)throws SQLException;

	/**
	 * 分页查询
	 * @param column
	 * @param value
	 * @return
	 * @throws SQLException
	 */
    E select(@Param("column") String column,@Param("value")Object value)throws SQLException;

	/**
	 * 是否已经存在
	 * @param column
	 * @param value
	 * @return
	 * @throws SQLException
	 */
	boolean exists(@Param("column") String column,@Param("value")Object value)throws SQLException;

	/**
	 * 查询一个列表
	 * @param orderBy
	 * @return
	 * @throws SQLException
	 */
	List<E> selectAll(@Param("orderBy")String orderBy)throws SQLException;
	
}
