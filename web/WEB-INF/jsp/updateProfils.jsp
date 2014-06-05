<%-- 
    Document   : updateProfils
    Created on : 2014.5.6, 00:55:00
    Author     : Katrina
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page language="JAVA" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%! String driverName = "com.mysql.jdbc.Driver";%>
    <%!String url = "jdbc:mysql://atverts.lv:3306/accenture_madara";%>
    <%!String user = "accenture_madara";%>
    <%!String psw = "85dN17hk1yUEY:x";%>
    <%/*String pass = request.getParameter("passBox");
    String pass2 = request.getParameter("passBox2");
    String name = request.getParameter("nameBox");
    String surname = request.getParameter("surnameBox");
    String height = request.getParameter("height");
    String weight = request.getParameter("weightBox");
    String id = request.getParameter("l1");
    Connection connection = null;
    PreparedStatement pstatement = null;
    Class.forName(driverName);

    try{
    String queryString = "UPDATE lietotajs SET Parole = '"+ pass+"', Vards ='" +name+"', Uzvards='"+surname
                        +"', Garums='"+height+"', Svars='"+weight+"' WHERE idLietotajs="+id;
    out.println(queryString);
    connection = DriverManager.getConnection(url, user, psw);
    pstatement = connection.prepareStatement(queryString);
    int i = pstatement.executeUpdate();

    connection.close();
    response.sendRedirect("index.htm");
    }
    catch(SQLException e){
        out.println(e);
    }*/%>
</html>