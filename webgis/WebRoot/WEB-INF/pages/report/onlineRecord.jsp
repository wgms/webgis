
<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>

<%@ include file="/common/dateUtil.jsp"%>
  <%@ page language="java" pageEncoding="UTF-8"%>

	<style>
        select {
			width:80px;
	    }
		input [type="text"] 
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
				if(status == 'New'){
					if(rowData.childType == '终端离线')
				   		return '<span style="color:red;font-weight:bold;">离线中</span>';
				   	else 
				   		return '<span style="color:red;font-weight:bold;">上线中</span>';
				   	
				}
				return endTime;
			}
			

			$(document).ready(function() {
				var now = Utility.today(1);
				  $("#endTime").val(now + " 23:59:00");
				  var now = Utility.today();
				  $("#startTime").val(now + " 00:00:00");

				//创建下拉部门树
				Utility.createDepTree("depId");
				 
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				  
				$("#childType").change(function()
				{
				       var txt = $("#childType").find("option:selected").text(); 
					   $("#childTypeName").val(txt);
				});
					
			} );
		</script>
<body>
		<div id="toolbar">
			
			<form id="queryForm" action="<%=ApplicationPath%>/report/onlineRecord.action">
			   <input type="hidden" name="queryId" value="selectOnlineRecord" />	
			   	   <input type="hidden" name="onlineRecord" value="true" />	 
			   <input type="hidden" name="fileName" value="车辆上下线记录" />	    
			   <input type="hidden" id="childTypeName"  name="childTypeName" value="所有记录" />	      
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
				<td>记录类型</td>
			   <td> <select id="childType" name="childType" width="10">
			                  <option value="">所有记录</option>
			                  <option value="GpsOnline">上线记录</option>
			                  <option value="GpsOffline">下线记录</option>
			       </select></td>
            </tr>
				<tr>
						
						<td align="right">开始时间
							:</td>
						<td>
      <input type="text" name="startTime" id="startTime"  class="datetimepicker" />
    </div>
						</td>
						<td>结束时间:</td>
						<td align="left">
      <input type="text" name="endTime"  id="endTime"  class="datetimepicker" />
						</td>
				
        <td colspan="4" align="left">
	        <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>&nbsp;
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
						url:'<%=ApplicationPath%>/report/onlineRecord.action',method:'post'">
					<thead>
						<tr>
								<th data-options="field:'plateNo'" width="7%">车牌号</th>
								<th data-options="field:'plateColor'" width="6%">车牌颜色</th>
								<th data-options="field:'childType'" width="8%">报警类型</th>
								<th data-options="field:'location'" width="29%">地点</th>
								<th data-options="field:'startTime'" width="12%">开始时间</th>
								<th data-options="field:'endTime',formatter:getEndTimeColumn" width="12%">结束时间</th>
								<th data-options="field:'timeSpan'" width="10%">时长</th>
								<th data-options="field:'depName'" width="15%">车组</th>
						</tr>
					</thead>			
				</table>
			
</body>

