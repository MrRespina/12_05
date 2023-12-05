<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript">
	$(function() {

		$('#parseBtn').click(
				function() {

					$.ajax({
						url : "getWeather.xml",
						success : function(func1) {
							$('#xmlTbl').empty();

							let th1 = $('<th></th>').text('시간');
							let th2 = $('<th></th>').text('기온');
							let th3 = $('<th></th>').text('날씨');

							let trr = $('<tr></tr>').append(th1, th2, th3);
							$('#xmlTbl').prepend(trr);

							let ar = [];

							$(func1).find('data').each(

									function(i, f) {
										let hour = $(f).find('hour').text();
										let temp = $(f).find('temp').text();
										let wfKor = $(f).find('wfKor').text();

										let hourTd = $(
												'<td align="center"></td>')
												.text(hour);
										let tempTd = $(
												'<td align="center"></td>')
												.text(temp);
										let wfKorTd = $(
												'<td align="center"></td>')
												.text(wfKor);

										let tr = $('<tr></tr>').append(hourTd,
												tempTd, wfKorTd);

										$('#xmlTbl').append(tr);

										ar[i] = {
											label : hour,
											y : temp * 1
										// JS에서 문자열 > 숫자 변환은 *1 해주면 됨!
										};

									});
							
							var chart = new CanvasJS.Chart("chartContainer", {
								animationEnabled: true,
								exportEnabled: true,
								theme : "dark2",
								title:{
									text: "서울시 강서구 방화2동 기온"              
								},							
								 
								data: [              
								{
									type : "spline",
									color : "red",
									markerBorderColor : "black",
									markerColor : "red",
									dataPoints: ar
								}
								]
							});
							chart.render();

						}

					});

				});

	});
</script>
</head>
<body>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	<table id="btnTbl" align="center">
		<tr>
			<td><button id="parseBtn">XML 파싱받기!</button></td>
		</tr>
	</table>

	<table id="xmlTbl" border="1" align="center"
		style="border: black dotted 3px; font-size: 30px; margin-top: 10px; border-radius: 3px;">
	</table>


</body>
</html>