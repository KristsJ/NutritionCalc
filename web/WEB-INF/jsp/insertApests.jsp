<%-- 
    Document   : insertApests
    Created on : 2014.5.6, 03:07:03
    Author     : Katrina
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@page language="JAVA" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%! String driverName = "com.mysql.jdbc.Driver";%>
    <%!String url = "jdbc:mysql://atverts.lv:3306/accenture_madara";%>
    <%!String user = "accenture_madara";%>
    <%!String psw = "85dN17hk1yUEY:x";%>
    <%Lietotajs l = (Lietotajs)request.getSession().getAttribute("lietotajs");
    
    Calendar c = Calendar.getInstance();
    String m="",d="";
    if((c.get(Calendar.MONTH)+1)<=9)
        m="0"+(c.get(Calendar.MONTH)+1);
    else m=""+c.get(Calendar.MONTH)+1;
    if(c.get(Calendar.DAY_OF_MONTH)<=9)
        d="0"+c.get(Calendar.DAY_OF_MONTH);
    else d=""+c.get(Calendar.DAY_OF_MONTH);
    
    String product = request.getParameter("myProductsToEat");
    String userId = l.getId();
    String count = request.getParameter("cikDaudz");
    String date = c.get(Calendar.YEAR)+"-"+m+"-"+d;
    
    Connection connection = null;
    PreparedStatement pstatement = null;
    Class.forName(driverName);
    connection = DriverManager.getConnection(url, user, psw);
    try{
        String queryString = "INSERT INTO apests(idLietotajs,idProdukts,Daudzums,Datums) VALUES ("
                                + userId + ", (SELECT idProdukts FROM produkts WHERE Nosaukums='"+product+"'),'"
                                + count + "','"+date+"')";
        pstatement = connection.prepareStatement(queryString);
        int i = pstatement.executeUpdate();

        connection.close();
        response.sendRedirect("index.htm");
    }
    catch(SQLException e){
        out.println(e);
    }
    
    %>
</html>
