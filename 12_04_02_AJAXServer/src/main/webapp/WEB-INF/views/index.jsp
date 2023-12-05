<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript">
	function getJSON() {

		location.href = "/spring009/error.getAllJSON?";

	}
	/* $(function(){

		$.ajax({
			
			url : 'error.getJSON',
			success : function ( func1 ){
				// alert(func1);
				//	JavaScript 객체 > 문자열 그대로 변환 가능
				alert(JSON.stringify(func1));
			}
			
		});
		
	}); */

	//	JSON으로 AJAX하기 간단한 버전
	//	$.getJSON('요청주소?파라미터=값&...',성공시 발동함수)
	$.getJSON('error.getAllJSON', function(eee) {
		// alert(JSON.stringify(eee));
		let td1 = $('<td></td>').text('에러');
		let td2 = $('<td></td>').text('위치');
		let tr = $('<tr></td>').append(td1, td2);
		$('#jsonTbl').append(tr);

		$.each(eee.error, function(i, e) {

			let td11 = $('<td></td>').text(e.e_what);
			let td22 = $('<td></td>').text(e.e_where);

			let tr1 = $('<tr></tr>').append(td11, td22);
			$('#jsonTbl').append(tr1);

		});

		$('#searchBtn').click(function() {
			let inp = $('#searchInput').val();

			$.getJSON('error.searchJSON?e_what=' + inp, function(ee) {

				$('#searchTbl').empty();
				
				let td1 = $('<td></td>').text('에러');
				let td2 = $('<td></td>').text('위치');
				let tr = $('<tr></td>').append(td1, td2);
				$('#searchTbl').append(tr);

				$.each(ee.error, function(i, e) {

					let td11 = $('<td></td>').text(e.e_what);
					let td22 = $('<td></td>').text(e.e_where);

					let tr1 = $('<tr></tr>').append(td11, td22);
					$('#searchTbl').append(tr1);

				});

			});

		});

		$('#searchInput').keyup(function (e){
			if(e.keyCode ==13){
				$('#searchBtn').trigger('click');
			}
		});

	});
</script>
</head>
<body>
	<table align="center" border="1">
		<form action="error.go">
			<tr>
				<td align="center">테이블 보기</td>
			</tr>
			<tr>
				<td align="center"><button>정보 확인</button></td>
			</tr>
		</form>
		<tr>
			<td align="center"><button name="Btn" onclick="getJSON();">JSON</button></td>
		</tr>
		<c:if test="${r!=null}">
			<tr>
				<td>${r}</td>
			</tr>
		</c:if>
	</table>

	<c:if test="${r!=null }">
		<table id="errorTable" align="center" border="1"
			style="border: black dotted 3px; border-radius: 3px; margin-top: 10px;">
			<c:forEach var="e" items="${ errors}">
				<tr>
					<td>에러</td>
					<td>${e.e_what}</td>
				</tr>
				<tr>
					<td>위치</td>
					<td>${e.e_where}</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<table border="1" id="jsonTbl" align="center"
		style="text-align: center; font-size: 30px; border-radius: 2px; margin-top: 10px;"></table>


	<table border="1" id="search" align="center"
		style="text-align: center; font-size: 30px; border-radius: 2px; margin-top: 10px;">
		<tr>
			<td colspan="2" style="font-size: 40px; margin-top: 10px;">특정
				단어로 검색</td>
		</tr>
		<tr>
			<td colspan="2"><input id="searchInput">
			<button id="searchBtn">특정</button></td>
		</tr>
	</table>
	<table border="1" id="searchTbl" align="center"
		style="text-align: center; font-size: 30px; border-radius: 2px; margin-top: 10px;">
		
	</table>

</body>
</html>