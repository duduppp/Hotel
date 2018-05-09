package com.fh.service.workflow.factory;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.GroupQueryImpl;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;

import com.fh.entity.system.Department;
import com.fh.service.fhoa.datajur.DatajurManager;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.fhoa.staff.StaffManager;
import com.fh.service.system.user.UserManager;
import  com.fh.util.ActivitiUtils;
import com.fh.util.PageData;
 

public class GroupManager extends GroupEntityManager{

	@Resource(name = "staffService")
	private StaffManager staffService;
	
	@Resource(name = "departmentService")
	private DepartmentManager departmentService;
	
	@Resource(name = "datajurService")
	private DatajurManager datajurService;
//	
	public List<Group> findGroupsByUser(final String userId) {
		try {
			
			List<Department> departmentList=departmentService.listAllByUserName(userId);
			List<Group> gs= ActivitiUtils.toActivitiGroups(departmentList);
			 return gs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
 

	@Override
	public List<Group> findGroupByQueryCriteria(GroupQueryImpl query, Page page) { 
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public long findGroupCountByNativeQuery(Map<String, Object> parameterMap) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public long findGroupCountByQueryCriteria(GroupQueryImpl query) {
		 throw new RuntimeException("not implement method.");  
	}

	@Override
	public List<Group> findGroupsByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
		 throw new RuntimeException("not implement method.");  
	}
	
	
}
