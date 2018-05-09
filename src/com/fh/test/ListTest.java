package com.fh.test;
import java.util.ArrayList;  
import java.util.HashSet;  
import java.util.List;  
import java.util.Set;  
  

import org.apache.commons.collections.list.SetUniqueList;  
  
  

import sun.awt.PeerEvent;  
  
public class ListTest {  
    public static void main(String[] args) {  
        List<Person> list =SetUniqueList.decorate(new ArrayList<Person>());  
    	String methodName=	Thread.currentThread().getStackTrace()[1].getMethodName();
    	System.out.println(methodName);
      //  Set<Person> set = new HashSet<Person>();  
          
        Person person1 = new Person("ssk","1");  
        Person person2 = new Person("ssk","1");  
          
     //   set.add(person1);  
     //   set.add(person2);  
          
      //  for (Person person : set) {  
     //       System.out.println(person);  
     //   }  
          
        list.add(person1);  
        list.add(person2);  
        //System.out.println();  
        for (Person person : list) {  
            System.out.println(person.getName());  
        }  
          
          
    }  
}  