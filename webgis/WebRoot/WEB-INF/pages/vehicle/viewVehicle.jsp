
<%@ include file="/common/taglibs.jsp"%>
<!--分页查询共用的页面-->
<%@ include file="/common/common.jsp"%>

<%@ page language="java" pageEncoding="UTF-8"%>

<!--引用的标签页js库-->
<script type="text/javascript" src="<%=jsPath%>/jquery/jquery-asTabs.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=jsPath%>/jquery/css/jquery-asTabs.css" />
<link rel="stylesheet" type="text/css" href="<%=jsPath%>/jquery/css/effect.css" />
<script>
$().ready(function() {
	$('#vehicleTab').asTabs({panes_wrap: '.pane1'});
});
</script>
 <BODY>
 <ul id="vehicleTab" class="asTabs">
					<li>车辆信息</li>
					<li>驾驶员信息</li>
				</ul>
				<div class="pane1">
					<div>

  <table width="100%"  class="TableBlock">
					<tbody>
					<tr>
						<td align="right" width="20%">车牌号码:</td>
						<td align="left" width="30%">${vehicleInfo.plateNo}
						</td>
						<td align="right" width="20%">车牌颜色
							:</td>
						<td width="30%">${vehicleInfo.plateColor}

							</td>
					</tr>
					<tr>
						<td align="right">所属业户:</td>
						<td align="left">${vehicleInfo.memberName}
						</td>
						
						<td align="right">车辆组:</td>
						<td align="left">${vehicleInfo.depName1}
</div>
</td>
						
					</tr>

					<tr>
						<td align="right">行业类型:</td>
						<td align="left">${vehicleInfo.industryTypeName}
						</td>
						<td align="right">终端卡号
							:</td>
						<td>
							${vehicleInfo.simNo} </td>
					</tr>
				<tr>
						<td align="right">车籍地:</td>
						<td align="left">${vehicleInfo.regionName}</td>
						<td align="right">终端Id
							:</td>
						<td>${vehicleInfo.termNo}
						</td>
					</tr>
					<tr>
						
						<td align="right">入网时间
							:</td>
						<td><s:date name="vehicleInfo.installDate" format="yyyy-MM-dd"/>
						</td>
						<td align="right">购买时间:</td>
						<td align="left"><s:date name="vehicleInfo.buyTime" format="yyyy-MM-dd"/>
						</td>
					</tr>

					<tr>
						<td align="right">使用类型:</td>
						<td align="left">${vehicleInfo.useType}
						</td>
						<td align="right">运行状态
							:</td>
						<td>
						${vehicleInfo.runStatus}</input>
						</td>
					</tr>
					<tr>
						<td align="right">厂牌型号:</td>
						<td align="left">
						${vehicleInfo.vendor}
						</td>

						<td align="right">车辆类型
							:</td>
						<td>${vehicleInfo.vehicleTypeName}
						</td>

					</tr>
					
					<tr>
					
					</tr>		
						<tr>
						
						<td align="right">经营许可:</td>
						<td align="left">${vehicleInfo.operPermit}
						</td>
						<td align="right">发动机号
							:</td>
						<td>${vehicleInfo.motorID}</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<div align="center">
								<input type="button" class="close_button"  value="关闭" onclick="window.parent.closeCommandWindow();""> 
							</div></td>
					</tr>
				</tbody></table>
				</div>
					<div><!--驾驶员信息-->
					 <table width="100%"  class="TableBlock">
			<tr>
				<td colspan="4" style="font-weight: bold; background: #EFEFEF;">
					基本信息<span class="MessageFromServer">${message}</span></td>
			</tr>
			
			
				<td align=right width="20%">编号:</td>
				<td align="left" width="30%">${driverInfo.driverCode}</td>
				<td align=right width="20%">姓名:</td>
				<td align="left" width="30%">${driverInfo.driverName}</td>
			</tr>
			<tr>
				<td align="right">驾驶车辆
					:</td>
				<td >
					${driverInfo.plateNo}
				</td>
				
				<td  align=right>联系电话:</td>
				<td align="left">${driverInfo.telephone}</td>
			</tr>
			
			<tr>
				
				<td  align=right>性别:</td>
				<td align="left">${driverInfo.sex}
               </select>
               </td>
			   <td  align=right>地址:</td>
				<td align="left">${driverInfo.address}</td>
			</tr>
			<tr>
				<td  align=right>身份证号:</td>
				<td align="left">${driverInfo.identityCard}</td>
				<td  align=right>出生日期:</td>
				<td>${driverInfo.birthday}</td>
			</tr>
		
			<tr>
				<td  align=right>准驾车型:</td>
				<td align="left">${driverInfo.drivingType}
				</td>
				<td  align=right>年审日期:</td>
				<td align="left">${driverInfo.examineYear}</td>
			</tr>
			<tr>
				<td colspan="4" style="font-weight: bold; background: #EFEFEF;">
					从业资格证信息</td>
			</tr>
			<tr>
				<td  align=right>丛业资格证:</td>
				<td align="left">${driverInfo.driverLicence}</td>
				<td  align=right>发证机构:</td>
				<td align="left">${driverInfo.licenseAgency}
				</td>								
			</tr>
			<tr>				
				<td  align=right>发证时间:</td>
				<td align="left">${driverInfo.certificationDate}</td>
			
				<td  align=right>过期时间 :</td>
				<td align="left"><s:date name="driverInfo.invalidDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td  align=right>监管机构:</td>
				<td align="left">${driverInfo.monitorOrg}</td>
				<td  align=right>监督电话:</td>
				<td align="left">${driverInfo.monitorPhone}</td>
			</tr>
					<tr>
						<td colspan="4" align="center">
							<div align="center">
								<input type="button" class="close_button"  value="关闭" onclick="window.parent.closeCommandWindow();"> 
							</div></td>
					</tr>
		
		</table>
					
					</div>
				</div>
 </BODY>
</HTML>
