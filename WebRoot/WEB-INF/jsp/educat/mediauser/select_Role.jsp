<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>角色选择</title>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" />
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck-3.5.js"></script>

 
<script LANGUAGE="JavaScript">
	var zTreeObj;
	var setting = { 
			check: {
				enable: true,
				chkboxType: { "Y" : "p", "N" : "p" }
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			    showLine: true,
			    isSimpleData : true,   
		        treeNodeKey : "id",  
		    
		       
		        treeNodeParentKey : "id",
	 			callback: {
				onCheck: onCheck
			}  
		}; 
		
		var zNodes = [ {
			 id:1,
			name : "董事长",
			checked:false,
			open : true,
			children : [  {
				 id:2,
				name : "经理",
				checked:false,
				open : true,
				children : [ {
					 id:3,
					name : "副经理" ,checked:false,
					open : true,
					children : [ { id:4,
						name : "总监" ,checked:false,
						open : true,
						children : [ {
							 id:5,
							name : "部长" ,checked:false,
							open : true,
							children : [ {
								 id:6,
								name : "员工" ,checked:false
							}]
						}]
					}]
				} ]
			}]
			
			
			
		}
		];
		function onCheck(e, treeId, treeNode) {  
		    var msg="";
		    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	        var nodes = treeObj.getCheckedNodes(true);
	    
	        for (var i = 0; i < nodes.length; i++) {
	            msg += nodes[i].name+",";
	        }
	        if(nodes.length>0){
	        	msg=msg.substring(0,msg.length-1);
	        }
	      console.info(msg);
	        
	        
		   
		}  
	$(document).ready(function() {
		
	//	zTreeObj = $("#treeDemo").zTree(setting, zNodes);
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting,zNodes);  
	});
</script>
</head>
<body>
	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>