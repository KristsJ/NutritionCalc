<%-- 
    Document   : login
    Created on : May 23, 2014, 10:18:22 AM
    Author     : Madara
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://atverts.lv:3306/accenture_madara";%>
        <%!String user = "accenture_madara";%>
        <%!String psw = "85dN17hk1yUEY:x";%>
        
        <title>Nutrition and Diet calc</title>
        <style type="text/css">
            body, html {
	        background-color: #A0FFA0;
	        font-family: Verdana, Geneva, sans-serif;
	        color: #474747;
	        font-size: 12px;
	        height: 100%;
                margin-top: 0px;
            }
            
            #wrap {
                position: relative;
                width: 990px;
                height: auto;
                min-height: 100%;
                margin-left: auto;
                margin-right: auto;
                background: #E1FFE1;
            }
            
            .header {
                position: relative;
                width: 990px;
                height: auto;
                color: black;
                background-color: #E1FFE1;
            }
            
            .name {
                position: relative;
                width: auto;
                height: 120px;
                top: 30px;
                font-family: ravie;
                font-size: 48px;
                text-align: center;
            }
            
            .content{
                position: relative;
                width: auto;
                height: 120px;
                top: 100px;
                left:400px;
            }
            
            .main{
                position: relative;
                width: auto;
                height: 120px;
                top: 30px;
            }
            
            .links{
                position: relative;
                width: auto;
                height: 120px;
                top: 80px;
            }
        </style>
        
    </head>
    <body>
        <div id="wrap">
            <div class="header">
                <div class="name">
                    Nutrition and Diet calc
                </div>
            </div>
            <div class="content">
                <div class="main">
                    <h1>Log in</h1>
                    <br>
                    <form name="input" method="post">
                        <input type="text" name="login" style="width: 100px" value="krists"> login
                        <br></br>
                        <input type="password" name="pass" style="width: 100px" value="parole"> password
                        <br></br>
                        <input type="submit" value="Sign in">                    
                    </form>
                </div>
                <div class="links">
                    <a href="../NutritionCalc/registreties.htm">Sign up</a>
                </div>

                        
  <%
   String login = request.getParameter("login");
   String pass = request.getParameter("pass");
   
   Connection connection = null;
   PreparedStatement pstatement = null;
   PreparedStatement pstatement1 = null;
   Class.forName(driverName);
   
   if(login!=null && pass!=null){
       if(login!="" && pass!="") {
              try {
                   connection = DriverManager.getConnection(url, user, psw);
                   String queryString = "SELECT Lietotajvards,Parole FROM lietotajs";
                   pstatement = connection.prepareStatement(queryString);
                   ResultSet rs1 = pstatement.executeQuery();
                   while(rs1.next()){
                        String lietotajs = rs1.getString("Lietotajvards");
                        String parole = rs1.getString("Parole");       
                        if(login.equals(lietotajs) && pass.equals(parole)){
                            String queryString1 = "SELECT * FROM lietotajs WHERE Lietotajvards = '"+login+"'";
                            pstatement1 = connection.prepareStatement(queryString1);
                            ResultSet rs2 = pstatement1.executeQuery();
                            String id="";
                            String lietotajvards="";
                            String parole1="";
                            String vards="";
                            String uzvards="";
                            String dzimsanas_datums="";
                            String garums="";
                            String svars="";
                            String dzimums="";
                            Lietotajs lietotajs1=null;
                            while(rs2.next()){
                                id=rs2.getString("idLietotajs");
                                lietotajvards=rs2.getString("Lietotajvards");
                                parole1=rs2.getString("Parole");
                                vards=rs2.getString("Vards");
                                uzvards=rs2.getString("Uzvards");
                                dzimsanas_datums=rs2.getString("Dzimsanas_datums");
                                garums=rs2.getString("Garums");
                                svars=rs2.getString("Svars");
                                dzimums=rs2.getString("Dzimums");
                                lietotajs1 = new Lietotajs(id,lietotajvards,parole1,vards,uzvards,dzimsanas_datums,dzimums,garums,svars);
                            }
                            request.getSession().setAttribute("lietotajs",lietotajs1);
                            response.sendRedirect("index.htm");
                        }
                   }
                   connection.close();
                   
              }
              catch(SQLException sqe){ 
                    out.println(sqe);
              }
       }
   }
  %>          
                    
             </div>    
        </div>
    </body>
</html>
