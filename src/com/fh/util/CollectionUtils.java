package com.fh.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * 集合操作的Utils函数集合.
 */
public class CollectionUtils {
	private CollectionUtils() {
	}

	/**
	 * 提取集合中的对象的属性，形成新的Collection.
	 * 
	 * @param collection
	 *            来源集合
	 * @param propertityName
	 *            要提取的属性名.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List collectAsList(Collection collection, String propertyName)
			throws Exception {

		List list = new ArrayList();

		for (Object obj : collection) {
			list.add(PropertyUtils.getProperty(obj, propertyName));
		}

		return list;
	}

	/**
	 * 提取集合中的对象的属性，组合成由分割符分割的字符串.
	 * 
	 * @param collection
	 *            来源集合
	 * @param propertityName
	 *            要提取的属性名
	 * @param separator
	 *            分隔符
	 */
	@SuppressWarnings("rawtypes")
	public static String collectAsString(Collection collection,
			String propertyName, String separator) throws Exception {
		List list = collectAsList(collection, propertyName);
		return StringUtils.join(list, separator);
	}

	/**
	 * 根据目标的ID集合，合并整理源对象集合.
	 * 
	 * 多用于根据http请求中的id列表，修改对象所拥有的子对象集合. 默认对象的ID属性名为id.
	 * 
	 * @param collection
	 *            源对象集合
	 * @param retainIds
	 *            目标集合
	 * @param clazz
	 *            集合中对象的类型
	 */
	public static <T, ID> void retainById(Collection<T> collection,
			Collection<ID> retainIds, Class<T> clazz) throws Exception {
		retainById(collection, retainIds, "id", clazz);
	}

	/**
	 * 根据目标的ID集合，合并整理源对象集合.
	 * 
	 * 多用于根据http请求中的id列表，修改对象所拥有的子对象集合.
	 * 
	 * @param collection
	 *            源对象集合
	 * @param retainIds
	 *            目标集合
	 * @param idName
	 *            对象中ID的属性名
	 * @param clazz
	 *            集合中对象的类型
	 */
	public static <T, ID> void retainById(Collection<T> collection,
			Collection<ID> retainIds, String idName, Class<T> clazz)
			throws Exception {

		if (retainIds == null) {
			collection.clear();
			return;
		}

		Iterator<T> it = collection.iterator();

		while (it.hasNext()) {
			T obj = it.next();
			if (retainIds.contains(PropertyUtils.getProperty(obj, idName))) {
				retainIds.remove(PropertyUtils.getProperty(obj, idName));
			} else {
				it.remove();
			}
		}

		for (ID id : retainIds) {
			T obj = clazz.newInstance();
			PropertyUtils.setProperty(obj, idName, id);
			collection.add(obj);
		}
	}
}
