
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
			width:100px;
		}

	</style>
</head>

		<script type="text/javascript" charset="utf-8">
			
			$(document).ready(function() {
					
			 $("#processed").lookup({category:"processType"});
			 $("#alarmSource").lookup({category:"AlarmSource"});
			 	var now = Utility.today(1);
				  $("#endTime").val(now);
				  var now = Utility.today();
				  $("#startTime").val(now);

				
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				Utility.loadGridWithParams();
				//创建下拉部门树
				Utility.createDepTree("depId");
		
				
			} );


		</script>
<body>	
		   <div id="toolbar">
			
			<form id="queryForm" action="<%=ApplicationPath%>/report/vehicleModifyRecordList.action">
			   <input type="hidden" name="queryId" value="selectVehicleModifyRecord" />		    
			   <input type="hidden" name="fileName" value="车辆变更日志" />	  
			   <input type="hidden" id="childTypeName"  name="childTypeName" value="所有" />	
			   <input type="hidden" id="alarmSourceName"  name="alarmSourceName" value="所有" />	     
			  <table width="100%"  class="TableBlock">
			   			   <tr>
						    <td align="right"> 车牌号码： </td>
					<td>			   
					<input type="text" id="plateNo" name="plateNo" > 
					</td>
				   <td align="right"> 车组名称： </td>
					<td>			   
				<select id="depId" name="depId" style="width:200px;"></select>
               </td>
            </tr>
				<tr>						
						<td align="right">变更时间
							:</td>
						<td>
      <input type="text" name="startDate"  id="startDate"   class="datetimepicker" />
						至
      <input type="text" name="endDate"   id="endDate"    class="datetimepicker" />
						</td>
				
        <td  align="left" colspan=2>
		 <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>&nbsp;
		   <a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" >重置</a>&nbsp;
        </td>
    </tr>
		</table>
		</form>	 
		
  </div>
			<table id="queryGrid" class="easyui-datagrid" title="" style="width:100%;"
						data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/report/vehicleModifyRecordList.action',method:'post'">
					<thead>
						<tr>
								<th data-options="field:'depName'"  width="10%">车组名称</th>
								<th data-options="field:'plateNo'"  width="9%">车牌号</th>
								<th data-options="field:'plateColor'"  width="5%">颜色</th>
								<th data-options="field:'simNo'"  width="9%">卡号</th>
								<th data-options="field:'termNo'"  width="8%">终端编号</th>
								<th data-options="field:'termType'"  width="9%">终端类型</th>
								<th data-options="field:'type'"  width="10%">变更类型</th>
								<th data-options="field:'createDate'"  width="12%">变更时间</th>
								<th data-options="field:'userName'"  width="6%">变更人</th>
								<th data-options="field:'detail'"  width="22%">变更内容</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>					
				</table>
</body>

