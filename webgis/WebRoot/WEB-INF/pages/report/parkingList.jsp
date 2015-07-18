
<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>

<%@ include file="/common/dateUtil.jsp"%>
  <%@ page language="java" pageEncoding="UTF-8"%>

	<style>
        select {
			width:80px;
	    }
		input[type='text']
		{
			width:150px;
		}
	</style>
</head>

		<script type="text/javascript" charset="utf-8">
			
			function getEndTimeColumn(value, rowData, rowIndex)
			{
				var endTime = rowData.endTime;
				var status = rowData.status;
				if(status == 'New')
				   return '<span style="color:red;font-weight:bold;">报警中..</span>';
				return endTime;
			}
			

			

			$(document).ready(function() {
				
					var now = Utility.today(1);
				  $("#endTime").val(now + " 23:59:00");
				  var now = Utility.today();
				  $("#startTime").val(now + " 00:00:00");
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				//创建下拉部门树
				Utility.createDepTree("depId");
				Utility.loadGridWithParams();
					
			} );
		</script>
<body>	
			<div id="toolbar">
			<form id="queryForm" action="<%=ApplicationPath%>/report/alarmList.action">
			   <input type="hidden" name="queryId" value="selectAlarms" />		    
			   <input type="hidden" name="fileName" value="停车记录" />	       
			    <input type="hidden" name="childType" value="Parking" />
			  <table width="100%"  class="TableBlock">
			   			   <tr>
						    <td> 车牌号码 </td>
					<td>			   
					<input type="text" id="plateNo" name="plateNo" > 
					</td>
				   <td> 车组名称 </td>
					<td>			   
				<select id="depId" name="depId" style="width:200px;"></select>
               </td>			
			   
            </tr>
				<tr>
						
						<td align="right">开始时间
							:</td>
						<td>
      <input type="text" name="startTime" id="startTime"  class="datetimepicker" />
						</td>
						<td>结束时间:</td>
						<td align="left">
      <input type="text" name="endTime" id="endTime"  class="datetimepicker" />
						</td>
				
        <td colspan="4" align="left">
	       <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm();">查询</a>&nbsp;
		   <a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" >重置</a>&nbsp;
		   <a id="btnExport" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel'" onclick="Utility.excelExport('<%=ApplicationPath%>/data/excelExport.action');">导出</a><!--调用utility.js-->
        </td>
    </tr>
		</table>
		</form>	 
		
  </div>
			<table id="queryGrid" class="easyui-datagrid" title="" style="width:100%;"
						data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/report/alarmList.action',method:'post'">
					<thead>
							<tr>
								<th data-options="field:'plateNo'"   style="width:10px">车牌号</th>
								<th data-options="field:'plateColor'"   width="6%">颜色</th>
								<th data-options="field:'type'"   width="6%">报警来源</th>
								<th data-options="field:'location'"   width="20%">报警地点</th>
								<th data-options="field:'startTime'"   width="15%">开始时间</th>
								<th data-options="field:'endTime',formatter:getEndTimeColumn"   width="15%">结束时间</th>
								<th data-options="field:'timeSpan'"   width="10%">停车时长</th>
								<th data-options="field:'depName'"   width="10%">车组</th>
								<th data-options="field:'velocity'"   width="10%">车速</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>					
				</table>

</body>

