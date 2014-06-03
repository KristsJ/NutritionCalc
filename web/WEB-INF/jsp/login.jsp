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
                background: lightcyan;
            }
            
            .header {
                position: relative;
                width: 990px;
                height: auto;
                color: black;
                background-color: yellow;
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
                top: 30px;
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
                    <form name="input" method="post">
                        <input type="text" name="login" style="width: 100px"> login
                        <br></br>
                        <input type="password" name="pass" style="width: 100px"> password
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
   Class.forName(driverName);
   
   if(login!=null && pass!=null){
       if(login!="" && pass!="") {
              try {
                   connection = DriverManager.getConnection(url, user, psw);
                   String queryString = "SELECT Lietotajvards,Parole FROM lietotajs";
                   pstatement = connection.prepareStatement(queryString);
                   ResultSet rs1 = pstatement.executeQuery(); 
                        out.println(login+" "+pass);
                   while(rs1.next()){
                        String lietotajs = rs1.getString("Lietotajvards");
                        String parole = rs1.getString("Parole");       
                        if(login.equals(lietotajs) && pass.equals(parole)){
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
