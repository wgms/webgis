<%@ page language="java" pageEncoding="UTF-8"%>
<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>

</head>

<script type="text/javascript" charset="utf-8">
		//删除表格的某一行，删除后，会自动刷新表格			
			function getDeleteActionColumn(alue, rowData, rowIndex)
			{  
				var entityId = rowData.userId;
				var html =  "<img style='cursor: pointer;' src='<%=imgPath%>/cross.gif' onclick=\"Utility.deleteEntity('deleteUser.action','" +entityId+"');\"/>";
				return html;
			}
			//编辑列
			function getEditActionColumn(value, rowData, rowIndex)
			{
				var entityId = rowData.userId;
				var html =  "<a href=\"javascript:InfoWindow.viewUser('" + entityId+ "');\">" +" 编辑</a>";
				return html;

			}

			

			$(document).ready(function() {
			     
				 //用户状态下拉框
				 $("#userState").lookup({category:"UserState"});
				//ajax填充下拉框数据 角色下拉框
				 $("#roleId").lookup({queryID:"selectRoleList"});
				 $("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				        Utility.loadGridWithParams();
				   $("#roleId").change(function()
				{
				       var txt = $("#roleId").find("option:selected").text(); 
					   $("#roleName").val(txt);
				});
				$("#userState").change(function()
				{
				       var txt = $("#userState").find("option:selected").text(); 
					   $("#userStateName").val(txt);
				});
			} );
		</script>
<body>
	<div id="toolbar">
		<form id="queryForm"
			action="<%=ApplicationPath%>/user/userList.action" method="post">
			<input type="hidden" name="queryId" value="selectUsers" />
			<!--对应的Ibatis的sql查询Id -->
			<input type="hidden" name="fileName" value="用户信息" />
			<!--以下字段用于得到下拉框的选中文本信息，用于写入导出到excel查询条件中-->
			<input type="hidden" id="roleName" name="roleName" value="" /> <input
				type="hidden" id="userStateName" name="userStateName" value="" />
			<table width="100%" class="TableBlock">
				<tr>
					<td>用户登录名称:</td>
					<td><input type="text" name="loginName" size="10" id="loginName">
					</td>
					<td>用户状态:</td>
					<td><select id="userState" name="userState" width="10"></select>
					</td>
					<td>角色:</td>
					<td><select id="roleId" name="roleId" width="10"></select>
					</td>

					<td colspan="" align="left"><a id="btnQuery" href="#"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>&nbsp;
						<a id="btnReset" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-clear'">重置</a>&nbsp; <a id="btnNew"
						href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-add'"
						onclick="InfoWindow.viewUser(0);">新增</a>&nbsp; <a id="btnExport"
						href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-excel'"
						onclick="Utility.excelExport('<%=ApplicationPath%>/data/excelExport.action');">导出</a>
						<!--调用utility.js-->
					</td>
				</tr>
			</table>
		</form>

	</div>

	<table id="queryGrid" class="easyui-datagrid" title=""
		style="width:100%;"
		data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/user/userList.action',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'name'" width="10%">用户名称</th>
				<th data-options="field:'loginName'" width="10%">登录名</th>
				<th data-options="field:'userState'" width="10%">状态</th>
				<th data-options="field:'roleName'" width="12%">角色</th>
				<th data-options="field:'owner'" width="12%">创建人</th>
				<th data-options="field:'createDate'" width="12%">创建日期</th>
				<th data-options="field:'1',formatter:getEditActionColumn"
					width="5%">编辑</th>
				<th data-options="field:'2',formatter:getDeleteActionColumn"
					width="5%">删除</th>
			</tr>
		</thead>
	</table>
</body>

