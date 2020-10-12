<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>露營地查詢</title>
<script type="text/javascript">
<script type="text/javascript">
function setFocus()
{
     document.getElementById("title").focus();
}

function confirmDelete() {
	if (confirm("確定刪除此項露營地資料?") ) {
		document.forms[0].action="CampServlet?id=${CampBean.id}" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	}
}

function updateCamp() {
    document.forms[0].action="BookUpdate.do?id=${CampBean.id}" ;
	document.forms[0].method="POST";
	document.forms[0].submit();
}

</script>
</head>
<body>
	<jsp:useBean id="dao" class="project.CampBean" scope="session" />
	<form action=".\CampServlet" method="post">
<center>${CampDeleteMsg}<br>
<c:remove var="CampDeleteMsg" />
	<h2>露營地資訊</h2>
			<table cellspacing="2" cellpadding="1" border="1">
				<tr>
					<td></td>
					<td>編號</td>
					<td>城市</td>
					<td>露營地</td>
					<td>地址</td>
					<td>電話</td>
					<td>平日價格</td>
					<td>假日價格</td>
					<td>帳篷數量</td>
					<td>海拔</td>
					<td>營區特色</td>
					<td>附屬設施</td>
					<td>攜帶寵物</td>
					<td>附屬服務</td>
					<td>停車方式</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach items="${list2}" var="acamp" varStatus="status">
					<tr>
					<td><input type="checkbox" /></td>
						<td>${acamp.id}</td>
						<td>${acamp.city}</td>
						<td>${acamp.name}</td>
						<td>${acamp.adress}</td>
						<td>${acamp.tel}</td>
						<td>${acamp.oprice}</td>
						<td>${acamp.wprice}</td>
						<td>${acamp.tentnum}</td>
						<td>${acamp.elevation}</td>
						<td>${acamp.feature}</td>
						<td>${acamp.facility}</td>
						<td>${acamp.pet}</td>
						<td>${acamp.service}</td>
						<td>${acamp.parking}</td>        
					<input name="id" type="hidden" id="id" value="${param.id}>" />
				<td><input type="button" name="confirmdelet" value="刪除"  onclick="confirmDelete()">
				<td><input type="button" name="submitupdate" value="修改" onclick="updateCamp()">
					</tr>
				</c:forEach>
			</table>
			<input type="submit" name="confirmshow" value="送出">
			
		</center>
	</form>
</body>
</html>