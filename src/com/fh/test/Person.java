package com.fh.test;
public class Person  {  
    private String name;  
    private String age;  
      
      
    public Person(String name, String age) {  
        super();  
        this.name = name;  
        this.age = age;  
    }  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    public String getAge() {  
        return age;  
    }  
    public void setAge(String age) {  
        this.age = age;  
    }  
      
    @Override  
    public boolean equals(Object obj) {  
        Person person = (Person) obj;  
        if(person.getAge().equals(age)&&person.getName().equals(name)){  
            return true;  
        }  
        return false;  
    }  
      
    @Override  
    public int hashCode() {  
        // TODO Auto-generated method stub  
        return 123;  
    }  
}  