function timeprint() {
	var curltime = new Date()
	var endtime = new Date()
	endtime.setTime(curltime.getTime() + 30 * 60 * 1000)
	document.write("<font style='font-size: 12pt'; font-style:'normal'><br />开始时间：" + curltime.getHours() + "时" + curltime.getMinutes() + "分")
	document.write("	结束时间：" + endtime.getHours() + "时" + endtime.getMinutes() + "分</font>")
}

function showTime() {
	var t = new Date()
	document.write(t.toLocaleDateString() + " " + t.getHours() + "时" + t.getMinutes() + "分")
}

function topaper() {
	window.location.replace("./paper.html")
}

function greeting() {
	var curl = new Date()
	var hour = curl.getHours()
	if (hour < 12) { document.write("早上好！") }
	else if (hour >= 12 && hour < 15) { document.write("中午好！") }
	else if (hour >= 15 <= 19) { document.write("下午好！") }
	else if (hour > 19) { document.write("晚上好！") }
}