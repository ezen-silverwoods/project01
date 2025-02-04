<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Select-Option Textarea</title>
		<script>
			function CheckValue(){
				// 제목, 카테고리, 내용 입력 객체 찾아오기
				var title = document.querySelector('#title');
				var content = document.querySelector('#content');
				var category = document.querySelector('#category');
				
				// 입력값 확인하기
				if( title.value.trim() == "" ){
					alert("제목을 입력해 주세요");
					title.focus();
					return false;
				}
				// select-option / textarea 의 value 가져오기
				// select-option 전체 객체가 찾아짐
				console.log(category);
				// select-option의 option 객체들의 컬렉션
				console.log(category.options);
				// 현재 선택되어있는 option의 value
				console.log(category.value);
				
				if( category.value == "" ) {
					alert("카테고리를 선택해주세요");
					return false;
				}
				if( content.value.trim() == "") {
					alert("내용을 입력해 주세요");
					content.focus();
					return false;
				}
				// submit 진행하기
				if( confirm("등록하시겠습니까?") ){
					return true;
				}else{
					return false;
				}
			}
			function setSelect(value){
				// select-option 객체 찾기
				var category = document.querySelector('#category');
				// 인자로 받은 value로 selected value를 변경
				category.value = value;
			}
		</script>
	</head>
	<body>
		<h2>글쓰기</h2>
		<form onsubmit="return CheckValue();">
			<label for="title">제목 : </label>
			<input type="text" name="title" id="title"><br>
			
			<label for="category">카테고리 : </label>
			<select id="category" name="category">
				<option value="">선택하세요</option>
				<option value="jv">자바</option>
				<option value="js">자바스크립트</option>
				<option value="jq">Jquery</option>
				<option value="py">파이썬</option>
			</select>
			<button type="button" onclick="setSelect('jv');">자바</button>
			<button type="button" onclick="setSelect('py');">파이썬</button>
			<!-- <button type="button" onclick="setSelect('db');">DBMS</button> -->
			<br>
			<label for="content">내용 : </label>
			<textarea id="content" name="content" row="10" cols="30"></textarea><br>
			<input type="submit" value="등록하기">
		</form>
	</body>
</html>