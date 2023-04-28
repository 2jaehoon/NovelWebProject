<%@page import="LoginDAO.LoginDAO"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="프로필 사진 변경을 위한 DAO"
    %>
    <%
    
    String user_num_member = session.getAttribute("user_num_member").toString();
  //1. 저장디렉토리를 설정
    File saveDirectory=new File("C:/Users/user/git/project2/src/main/webapp/_next/static/images/profile_images");
    int fileSize=1024*1024*2;
    //2. FileUpload Component 생성(multipartRequest) => 생성함과 동시에 파일이 업로드된다
    MultipartRequest mr =new MultipartRequest(request,saveDirectory.getAbsolutePath(),fileSize,"UTF-8",new DefaultFileRenamePolicy());
    //3.<input type = "file">의 값을 받는다
    String fileName = mr.getFilesystemName("file");
    
  
  
 // 업로드한 파일의 이름 가져오기
    String originalFileName = mr.getOriginalFileName("file");
 
 //확장자만 남기기
 String extension = "";
 
 int lastIndex = originalFileName.lastIndexOf(".");
 
 if(lastIndex>= 0){
	 extension = originalFileName.substring(lastIndex).toLowerCase();
 }

    // 저장할 파일 이름 설정
    String savedFileName = user_num_member+extension;

    // 저장할 파일 객체 생성
    File savedFile = new File(saveDirectory, savedFileName);

    // 업로드한 파일을 읽어서 저장할 파일에 쓰기
    try (
        InputStream inStream = new FileInputStream(new File(saveDirectory, originalFileName));
        OutputStream outStream = new FileOutputStream(savedFile)
    ) {
        byte[] buffer = new byte[1024];
        int length;
        while ((length = inStream.read(buffer)) > 0) {
            outStream.write(buffer, 0, length);
        }
        
        LoginDAO lDAO = new LoginDAO();
        lDAO.updateProfile(savedFileName,Integer.parseInt(user_num_member));
        session.setAttribute("user_photo", savedFileName);
    }
    
    File originalFile = new File(saveDirectory, originalFileName);
    if (originalFile.exists()) {
        originalFile.delete();
    }
    
    response.sendRedirect("my_page.jsp");
    	%>