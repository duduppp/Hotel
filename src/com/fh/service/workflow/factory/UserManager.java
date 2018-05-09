package com.fh.service.workflow.factory;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.UserQueryImpl;
import org.activiti.engine.impl.persistence.entity.IdentityInfoEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;

import com.fh.entity.system.Department;
import com.fh.entity.system.Staff;
import com.fh.service.fhoa.datajur.DatajurManager;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.fhoa.staff.StaffManager;
import com.fh.util.ActivitiUtils;
//import com.jy.entity.system.account.Account;
//import com.jy.entity.system.org.Position;
//import com.jy.repository.system.account.AccountDao;

public class UserManager extends UserEntityManager{
	
	@Resource(name = "staffService")
	private StaffManager staffService;
	
	@Resource(name = "departmentService")
	private DepartmentManager departmentService;
	
	@Resource(name = "datajurService")
	private DatajurManager datajurService;
	
	@Override
	public UserEntity findUserById(String userId) {
		
		try {
			 List<Staff> staffList= staffService.listByUser_id(userId);
			 if(null!=staffList&&staffList.size()>0){
					UserEntity userEntity=ActivitiUtils.toActivitiUser(staffList.get(0));
					return userEntity; 
			 }
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Group> findGroupsByUser(String userId) {
		try {
			List<Department> departmentLists=departmentService.listAllByUserName(userId);
			
			List<Group> gs= ActivitiUtils.toActivitiGroups(departmentLists);
			return gs;
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return null;
	}

	@Override
	public List<User> findPotentialStarterUsers(String proceDefId) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public List<User> findUserByQueryCriteria(UserQueryImpl query, Page page) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public long findUserCountByNativeQuery(Map<String, Object> parameterMap) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public long findUserCountByQueryCriteria(UserQueryImpl query) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public IdentityInfoEntity findUserInfoByUserIdAndKey(String userId, String key) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public List<String> findUserInfoKeysByUserIdAndType(String userId, String type) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public List<User> findUsersByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
		 throw new RuntimeException("not implement method.");  
	}

		
}
