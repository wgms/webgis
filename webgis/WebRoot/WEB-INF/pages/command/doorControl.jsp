
<%@ include file="/common/taglibs.jsp"%>
<!--分页查询共用的页面-->
<%@ include file="/common/common.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=jsPath%>/jquery/jquery.timers.js"></script><!--定时器-->
<script type="text/javascript" src="<%=jsPath%>/terminalCommand.js"></script><!--终端命令结果查询-->

<script>
$().ready(function() {
	 $("#entityForm").validate(); //初始化验证信息
	 
	 Utility.ajaxSubmitForm("entityForm", {
						 success:function(responseText)
						 {
							   var result = responseText;
								if (result.success) {
									 var commandId = result.data; //下发成功后，获取到命令Id
									 TerminalCommand.startQueryResult(commandId);//命令下发成功,根据命令id,开始尝试获取检索结果
								}
								else {
									$(".commandMsg").html("提交失败! 错误原因：" + (result.message ? result.message : result.Data));
									//停止所有的在$('body')上定时器  
									$('body').stopTime ();  
								  }
						 }
	 });
});
</script>
 <BODY>
	<form id="entityForm" name="entityForm" 
			action='<%=ApplicationPath%>/command/doorControl.action' method="POST">
				
        <input type="hidden"  name="controlType"  id="controlType" value="0"/>
        <input type="hidden"  name="vehicleId"  id="vehicleId" value="${vehicleId}"/>
  <table width="100%"  class="TableBlock">
					<tbody><tr>
						<td colspan="2" style="font-weight: bold; background: #EFEFEF;" height="25">车门控制
						<span style="color:red;background:blue;">${message}</span>
						</td>
					</tr>
					<tr>
						<td align="right">控制类型
							:</td>
						<td><select id="switchState"  style="width: 150px;" name="switchState" class="required digits">
						<option value="0">车门解锁</option>
						<option value="1">车门加锁</option>
						   </select></td>
					</tr>
				<tr>
						<td colspan=2 align="center">
						   <input type="submit" class="sendjson" value="发送">
						   <span class="commandMsg"></span></td>
					</tr>

				
					
				</tbody></table>
 </BODY>
</HTML>
