package com.fh.test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.collections.list.SetUniqueList;

public class HashSetTest {
	public static void main(String[] args) {
		// List
		List<UserTable> listA = new ArrayList<UserTable>();
		List<UserTable> listB = new ArrayList<UserTable>();
		listA.add(new UserTable("A1001", "LJ"));
		listB.add(new UserTable("B1002", "MH"));

		listB.add(new UserTable("B1002", "SM"));
		listB.add(new UserTable("C1001", "TM"));
		listA.removeAll(listB);// 由于UserTable的hashCode和equal 都是以linkdoodid
								// 来判断,所以“B1002”算重复元素
		listA.addAll(listB);
		for (UserTable userTable : listB) {
			System.out.println(userTable.getName() + "   " +userTable.getTel());
		}

		// HashSet
		HashSet<UserTable> hs = new HashSet<UserTable>();
		hs.add(new UserTable("a1", 20));
		hs.add(new UserTable("a2", 30));
		hs.add(new UserTable("a3", 40));
		hs.add(new UserTable("a3", 40));
		Iterator<UserTable> iterator = hs.iterator();
		while (iterator.hasNext()) {
			UserTable p = iterator.next();
			System.out.println(p.getName() + "   " + p.getAge());
		}
	}
}