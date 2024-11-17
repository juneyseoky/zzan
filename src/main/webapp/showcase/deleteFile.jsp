<%@ page import="java.io.File" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Only_showcase.pack.DBUtill" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>파일 삭제 결과창</title>
    <link rel="stylesheet" href="../showcase/style/style_showcase.css">
</head>
<body>
    <div id="wrap">
        <h1>파일 삭제 결과</h1>
        <br>
        <hr>
        <br>
        <%
        String fileName = request.getParameter("fileName");
        String productName = request.getParameter("productName");
        boolean fileDeleted = false;
        boolean productDeleted = false;

        if (fileName != null && !fileName.isEmpty()) {
            String filePath = application.getRealPath("/") + "images/wisky/" + new File(fileName).getName();
            File file = new File(filePath);

            if (file.exists() && file.delete()) {
                fileDeleted = true;
            } 
        }

        if (fileDeleted && productName != null && !productName.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = DBUtill.getConnection();
                String sql = "DELETE FROM uploaded_files WHERE subject = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                int result = pstmt.executeUpdate();

                if (result > 0) {
                    productDeleted = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBUtill.closePreparedStatement(pstmt);
                DBUtill.closeConnection(conn);
            }
        }

        if (fileDeleted && productDeleted) {
            out.println("<p>파일 및 제품 정보가 성공적으로 삭제되었습니다.</p>");
        } else if (fileDeleted) {
            out.println("<p>파일 삭제는 성공했지만, 제품 정보 삭제에 실패했습니다.</p>");
        } else {
            out.println("<p>파일 삭제에 실패했습니다.</p>");
        }
        %>
        <br>
        <hr>
        <br>
        <button type="button" onclick="location.href='register.jsp'">돌아가기</button>
    </div>
</body>
</html>
