function gradeCheck(){
	
	if(frm.sid.value.length==0){
		alert("학번이 입력되지 않았습니다!")
		frm.sid.focus()
		return false
	}
	else if(frm.subcode.value==0){
		alert("교과코드가 선택되지 않았습니다!")
		frm.subcode.focus()
		return false
	}
	else if(frm.midscore.value.length==0){
		alert("중간고사 성적이 입력되지 않았습니다!")
		frm.midscore.focus()
		return false
	}
	else if(frm.finalscore.value.length==0){
		alert("기말고사 성적이 입력되지 않았습니다!")
		frm.finalscore.focus()
		return false
	}
	else if(frm.attend.value.length==0){
		alert("출석 성적이 입력되지 않았습니다!")
		frm.attend.focus()
		return false
	}
	else if(frm.report.value.length==0){
		alert("레포트 성적이 입력되지 않았습니다!")
		frm.report.focus()
		return false
	}
	else if(frm.etc.value.length==0){
		alert("기타 성적이 입력되지 않았습니다!")
		frm.etc.focus()
		return false
	}
	else{
		alert("성적정보가 정상적으로 등록되었습니다!")
		document.frm.submit()
	}
	return true
}

function res(){
	document.frm.reset()
	alert("정보를 지우고 처음부터 다시 입력합니다!")
	frm.sid.focus()
}

function search(){
	document.frm2.submit()
}