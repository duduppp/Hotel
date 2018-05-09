package com.fh.util;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;

import com.fh.entity.system.Department;
import com.fh.entity.system.Staff;
import com.fh.entity.system.User;

public class ActivitiUtils {
	
	public static UserEntity  toActivitiUser(Staff staff){
		UserEntity userEntity = new UserEntity();
		userEntity.setId(staff.getUSER_ID());
		userEntity.setRevision(1);
		return userEntity;
	}
	
	public static GroupEntity  toActivitiGroup(Department department){
		GroupEntity groupEntity = new GroupEntity();
		groupEntity.setRevision(1);
		groupEntity.setType("assignment");
		groupEntity.setId(department.getDEPARTMENT_ID());
		groupEntity.setName(department.getNAME());
		return groupEntity;
	}
	
	public static List<Group> toActivitiGroups(List<Department> departmentList){
		List<Group> groupEntitys = new ArrayList<Group>();
		for (Department department : departmentList) {
			GroupEntity groupEntity = toActivitiGroup(department);
			groupEntitys.add(groupEntity);
		}
		return groupEntitys;
	}
}
