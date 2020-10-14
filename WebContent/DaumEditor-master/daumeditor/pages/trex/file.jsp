<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 파일 첨부</title> 
<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../../css/popup.css" type="text/css"  charset="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
// <![CDATA[
	
	function done() {

		var file = document.getElementById('inputfile');
		var filePath = file.value;
		var filePathSplit = filePath.split('\\'); 
		var filePathLength = filePathSplit.length;
		var fileNameSplit = filePathSplit[filePathLength-1].split('.');
		var fileName = fileNameSplit[0];
		var fileExt = fileNameSplit[1];
		var fileSize = file.files[0].size;
		var fileMime = file.files[0].type;

		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		
		var _mockdata = {
			'attachurl': filePath,
			'filemime': fileMime,
			'filename': fileName,
			'filesize': fileSize
		};
		execAttach(_mockdata);
		closeWindow();
	}

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('file', _opener);
	    registerAction(_attacher);
	}
	
</script>
</head>
<body onload="initUploader();">
<div class="wrapper">
	<form id = "uploadform" method="post" enctype="multipart/form-data">
		<div class="header">
			<h1>파일 첨부</h1>
		</div>	

		<div class="body">
		<input name="inputfile" type="file" id="inputfile"/>
			<dl class="alert">
			    <dt>파일 첨부 확인</dt>
			    <dd>
			    	확인을 누르시면 임시 데이터가 파일첨부 됩니다.<br /> 
					인터페이스는 소스를 확인해주세요.
				</dd>
			</dl>
		</div>
		<div class="footer">
			<p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p>
			<ul>
				<li class="submit"><a href="#" onclick="done();" title="등록" class="btnlink">등록</a> </li>
				<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
			</ul>
		</div>
	</form>
</div>
</body>
</html>
