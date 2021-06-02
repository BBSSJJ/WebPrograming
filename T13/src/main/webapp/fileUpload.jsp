<%@ page contentType="text/html;charset=utf-8" 
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.util.*, java.io.*" 
%>
<%
request.setCharacterEncoding("utf-8");

int maxsize = 5*1024*1024;		//최대 업로드 파일 크기 : 5Mb

//upload 이름을 가지는 실제 서버의 경로명 알아내기 
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");		

//String realFolder = "E:\\workspace\\....\\upload";

out.println("서버의 upload 실제 경로 : " + realFolder + "<HR>");

try {
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
												maxsize, "utf-8",
												new DefaultFileRenamePolicy());
	
	//input 태그의 type이 file이 아닌 태그들에 대한 name 속성에 대한 
	//파라미터 입력 값 알아내기
	Enumeration<?> params = multi.getParameterNames();

	while( params.hasMoreElements()) {
		String name = (String) params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + " = " + value + "<BR>");
	}

	out.println("<HR>");
	
	//파일 정보 출력하기
	
	//input 태그의 type이 file인 name 속성들 알아내기
	Enumeration<?> fileParams = multi.getFileNames();	
	while(fileParams.hasMoreElements() ) {
		String name = (String) fileParams.nextElement();
		out.println("&lt;input type=file&gt;인 name값 : " + name);
	}

	out.println("<HR>");

	String fileName = multi.getFilesystemName("fileName");  //서버에 저장된 파일 이름
	String orgName = multi.getOriginalFileName("fileName");	//서버 전송 전 파일 이름
	String typeFile = multi.getContentType("fileName");	//전송된 파일의 MIME 타입

	File file = multi.getFile("fileName");	//전송된 파일에 대한 File 객체 생성
%>
서버에 저장된 파일 이름 : <%= fileName %><BR>
전송전 원래 파일 이름 : <%= orgName %><BR>
파일 타입 : <%= typeFile %><BR>
파일 크기 : <%= file.length() %> bytes<BR>
<%
} catch(IOException e) { 
	out.println("파일 전송 오류 : " + e);
}
%>