
<%@ include file="/common/taglibs.jsp"%>
<!--分页查询共用的页面-->
<%@ include file="/common/common.jsp"%>

<%@ include file="/common/dateUtil.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>


<script>


//删除围栏
			function doRemove()
			{
				var enclosureId = "${entity.entityId}";
				if(enclosureId != "0")
				{
					var enclosureIds = [enclosureId]; //数组格式，函数支持删除多个
					parent.MapTree.deleteAreas(enclosureIds);//调用Maptree.js中的删除函数
				}
				parent.closeEnclosureWindow();
			}

	


$().ready(function() {
	 $("#entityForm").validate(); //初始化验证信息
	//ajax填充下拉框数据
	 //$("#plateColor").lookup({category:"plateColor"});
	 //$("#routeType").lookup({category:"routeType", selectedValue:"${entity.name}"});

	 //alert(${entity.byTime});
	 $("#byTime").attr("checked", ${entity.byTime});
	 $("#limitSpeed").attr("checked", ${entity.limitSpeed});

	 var strAlarmType = "${entity.alarmType}";
	 if(strAlarmType == "")
	{
		 $("#alarmType2").attr("checked", true);
		 $("#alarmType4").attr("checked", true);
	}
	  $(':input[name="alarmTypes"]').each(function()
	{
		  var obj = $(this).val();
		   if(strAlarmType.indexOf(obj) >= 0)
		   {
		       //alert(obj);
			   $(this).attr("checked", true);
		   }
	});

	var keyPoint = ${entity.keyPoint};
	if(keyPoint == 1)
	{
		 $("#keyPoint").attr("checked", true);
	}

	var strPoints = "${entity.points}"; //坐标点的的连接字符串
	var radius =  "${entity.radius}";
    strPoints = strPoints.replace(/;/g,"#");
	var enclosureType = "${entity.enclosureType}"; //围栏类型，circle, rect, polygon
	var enclosureTypeDescr = "";
	if(enclosureType == "polygon")
		enclosureTypeDescr = "多边形电子围栏";
	if(enclosureType == "rect")
		enclosureTypeDescr = "矩形电子围栏";
	if(enclosureType == "circle")
		enclosureTypeDescr = "圆形电子围栏";
	$("#enclosureTypeDescr").val(enclosureTypeDescr);
	//alert(strPoints);
	Utility.ajaxForm("entityForm", {

         success: function(responseText){
		       var result = responseText;
			   if (result.success) {
		             alert("保存成功!");
					 //保存围栏成功后，在地图上生成带有围栏ID的新围栏
					 var enclosure = result.data;//围栏对象
					 parent.createKeyPoint(enclosure, strPoints);
			   }else				   
			 {
				   alert("保存失败，错误:"+ result.message);
			 }
		 }

	});


	$("#byTime").click(function()
	{
		    var checkValue  = $(this).attr("checked") ;
			checkValue = checkValue == false;
			$("#limitSpeed").attr("checked",checkValue) ;
	});
	$("#limitSpeed").click(function()
	{
		    var checkValue  = $(this).attr("checked") ;
			checkValue = checkValue == false;
			$("#byTime").attr("checked",checkValue) ;
	});
	
});
</script>
<title>编辑区域</title>
 <BODY>
	<form id="entityForm" name="entityForm" 
			action='<%=ApplicationPath%>/map/saveKeyPoint.action' method="POST">
				<input type="hidden" name="entityID"
					value="${entity.entityId}"/>
					<input type="hidden" name="points"
					value="${entity.points}"/>	
					<input type="hidden" name="enclosureType"
					value="${entity.enclosureType}"/>
					
					<input type="hidden" name="keyPoint"
					value="1"/>
  <table width="100%"  class="TableBlock">
					<tbody><tr>
						<td colspan="4" style="font-weight: bold; background: #EFEFEF;" height="25">区域信息
						<span class="message">${message}</span>
						</td>
					</tr>
					<tr>
						<td align="right">关键点名称:</td>
						<td align="left"><input  id="name" value="${entity.name}"
						name="name" class="required" maxlength="10" maxlength="11" size="20"> 
						</td>
						  <td align="right">区域半径:
							:</td>
						<td>
						<input type="input" name="radius"
					value="${entity.radius}" class="required" />(米)
						<!--
						  <input type="input" name="enclosureTypeDescr"   id="enclosureTypeDescr"  value="" readonly/>
						  -->
						   </td>
					</tr>
					
					<tr>
						<td align="right">在规定时间段:</td>
						<td align="left"  colspan=3>
						  <input type="text" name="startDate" class="datetimepicker"   value='<s:date name="entity.startDate" format="yyyy-MM-dd HH:mm:ss"/>'></input>
						  至
						  <input type="text" name="endDate" class="datetimepicker"  value='<s:date name="entity.endDate" format="yyyy-MM-dd HH:mm:ss"/>'></input>
						 
						</td>
					</tr>
				
					
					<tr>
						<td align="right">必须:</td>
						<td align="left"  colspan=3><input type="radio" id="byTime" name="byTime" value="Y"
						maxlength="16" size="20" class="chbox">到达
						&nbsp;&nbsp;<input type="radio" id="limitSpeed" name="limitSpeed" value="Y"  class="chbox">离开
						</td>
					</tr>
					
				
					<tr>
						<td colspan=4 align=center>
						
						   <button type="submit" class="button gray medium" >保存</button> 
						   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <button type="button" class="button gray medium" onclick="doRemove();" >删除</button> 
						</td>
					</tr>
				</tbody></table>

			</form>
 </BODY>
</HTML>
