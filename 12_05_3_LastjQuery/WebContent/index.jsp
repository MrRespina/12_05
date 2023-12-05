<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp입니다!</title>
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript">
	// 	eb43c48551b94f0ddc100b8a8020d311
	$(function(){
		
		$('#mainInput').keyup(function(e){
					
			if(e.keyCode==8){
				
				$('#mainTbl').empty();
				let th1 = $('<th></th>').text('이미지');
				let th2 = $('<th></th>').text('책제목');
				let th3 = $('<th></th>').text('출판사');
				let th4 = $('<th></th>').text('정가');
				let th5 = $('<th></th>').text('판매가');
				let trr = $('<tr></tr>').append(th1, th2, th3,th4,th5);
				$('#mainTbl').prepend(trr);	
				
			}else{
				
				$('#mainTbl').empty();
				let th1 = $('<th></th>').text('이미지');
				let th2 = $('<th></th>').text('책제목');
				let th3 = $('<th></th>').text('출판사');
				let th4 = $('<th></th>').text('정가');
				let th5 = $('<th></th>').text('판매가');
				let trr = $('<tr></tr>').append(th1, th2, th3,th4,th5);
				$('#mainTbl').prepend(trr);	
				
				let iVal = $('#mainInput').val();
				
				// $.getJSON() : 요청 헤더에 대한 기능이 존재하지 않음!
				$.ajax({
				
					url : 'https://dapi.kakao.com/v3/search/book',
					data : { query : iVal },
					beforeSend : function(req){	// 요청 보내기 전에 실행시킬 콜백함수(헤더 처리)
						req.setRequestHeader(
								'Authorization', 'KakaoAK eb43c48551b94f0ddc100b8a8020d311'		
						);
					},
					success: function(book){
						//alert(JSON.stringify(book));	
						$('#mainTbl').empty();

						let th1 = $('<th></th>').text('이미지');
						let th2 = $('<th></th>').text('책제목');
						let th3 = $('<th></th>').text('출판사');
						let th4 = $('<th></th>').text('정가');
						let th5 = $('<th></th>').text('판매가');

						let trr = $('<tr></tr>').append(th1, th2, th3,th4,th5);
						$('#mainTbl').prepend(trr);	
						
						$.each(book.documents, function(i, e) {
							
							let img1 = $('<img src ='+e.thumbnail+' />');
							let td1 = $('<td></td>').append(img1);
							let td2 = $('<td></td>').text(e.title);
							let td3 = $('<td></td>').text(e.publisher);
							let td4 = $('<td></td>').text(e.price);
							let td5 = $('<td></td>').text(e.sale_price);
							let tr1 = $('<tr></tr>').append(td1,td2,td3,td4,td5);
							$('#mainTbl').append(tr1);

						});
					}							
					
				});
				
			}

		});
		
	});
</script>
</head>
<body>
	<table border="1" align="center" style="font-size:30px;margin-top:10px;text-align:center;
	border : black dotted 3px;border-radius: 3px;">
	<tr>
		<td><input id="mainInput"><button id="mainBtn">책 찾기</button></td>
	</tr>
	</table>
	<table id="mainTbl" border="1" align="center" style="font-size:30px;margin-top:10px;text-align:center;
	border : black dotted 3px;border-radius: 3px;">
	</table>
</body>
</html>