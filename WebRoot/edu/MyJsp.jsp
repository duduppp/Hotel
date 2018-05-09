<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="ice"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ICEfaces, Ajax for Java EE</title>
<link rel="stylesheet" type="text/css"
	href="./xmlhttp/css/rime/rime.css" />
</head>
<body>
	<li>
		<dl>
			<dt class="list-ui-div">
				<a href="prolist.htm">人员</a>
			</dt>
			<dd>

				<ul class="fix">
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('人员','员工激励');">员工激励</a></li>

					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('人员','心态调整');">心态调整</a></li>

					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('人员','自我认知');">自我认知</a></li>


				</ul>
			</dd>
		</dl>
	</li>

	<li><dl>
			<dt class="list-ui-div">
				<a href="prolist.htm">团队</a>
			</dt>
			<dd>
				<ul class="fix">
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('团队','团队协作');">团队协作</a></li>
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('团队','团队激励');">团队激励</a></li>
				</ul>
			</dd>
		</dl></li>
	<li><dl>
			<dt class="list-ui-div">
				<a href="prolist.htm">店铺</a>
			</dt>
			<dd>
				<ul class="fix">
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('店铺','店铺安全');">店铺安全</a></li>
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('店铺','店铺环境');">店铺环境</a></li>
				</ul>
			</dd>
		</dl></li>
	<li><dl>
			<dt class="list-ui-div">
				<a href="prolist.htm">运营</a>
			</dt>
			<dd>
				<ul class="fix">
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('运营','业绩');">业绩</a></li>
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('运营','引流');">引流</a></li>
					<li><a href="javascript:void(0);"
						onclick="showManagerTypes('运营','日常运营');">日常运营</a></li>
				</ul>
			</dd>
		</dl></li>
	<li><dl>
			<dt class="list-ui-div">
				<a href="prolist.htm">项目</a>
			</dt>
			<dd>
				<ul class="fix"></ul>
			</dd>
		</dl></li>
</body>
</html>
