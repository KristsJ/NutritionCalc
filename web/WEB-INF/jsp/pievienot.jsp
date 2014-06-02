<%-- 
    Document   : pievienot
    Created on : May 23, 2014, 10:19:19 AM
    Author     : Madara
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://10.1.52.8:3306/diet_calc";%>
        <%!String user = "root";%>
        <%!String psw = "zup1nja*";%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                top: 30px;
                left:300px;
            }
            
            .main{
                position: relative;
                float: left;
                width: auto;
                height: 120px;
                left:5px;
                top: 10px;
            }
            
            .main_nos{
                position: relative;
                line-height: 36px;
                float: left;
                width: auto;
                height: 120px;
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
                <h1>New product / Jauns produkts</h1>
                <div class="main_nos">
                    product name / produkta nosaukums : 
                    <br>
                    unit of measurement / mērvienība : 
                    <br>
                    kCal : 
                    <br>
                    fat / tauki :
                    <br>
                    carbohydrate / ogļhidrāti : 
                    <br>
                    albumen / olbaltumvielas :
                    <br>
                    salt / sāls :  
                    <br>
                     / transtaukskābes : 
                     <br>
                    cellulose / škiedrvielas : 
                    <br>
                    sugar / cukurs : 
                    </div>
                <div class="main">
                    <form name="input" method="get">
                        <input type="text" name="prodName" style="width: 100px"> * 
                        <br></br>
                        <select name="mervieniba" style="width: 103px">
                            <option value="mL">ml</option>
                            <option value="g">g</option>
                            <option value="gab">piece</option>
                        </select> *
                        <br></br>
                        <input type="text" name="kcal" style="width: 100px"> *
                        <br></br>
                        <input type="text" name="fat" style="width: 100px">
                        <br></br>
                        <input type="text" name="oglHidr" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="olbalt" style="width: 100px">
                        <br></br>
                        <input type="text" name="sals" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="transk" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="skiedrv" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="cukurs" style="width: 100px"> 
                        <br></br><br></br>
                        <input type="submit" value="Add/Pievienot">
                    </form>
                    
                    <%
                        String Nosaukums = request.getParameter("prodName");
                        String Mervieniba = request.getParameter("mervieniba");
                        String kCal = request.getParameter("kcal");
                        String Tauki = request.getParameter("fat");
                        String OglHidr = request.getParameter("oglHidr");
                        String OlBalt = request.getParameter("olbalt");
                        String Sals = request.getParameter("sals");
                        String TranSk = request.getParameter("transk");
                        String SkiedrViel = request.getParameter("skiedrv");
                        String Cukurs = request.getParameter("cukurs");
                        
                        String queryString2 ="";
                        Connection connection = null;
                        PreparedStatement pstatement = null;
                        PreparedStatement pstatement1 = null;
                        PreparedStatement pstatement2 = null;
                        Class.forName(driverName);
                        int updateQuery = 0;
                        int updateQuery2 = 0;
                        
                        if(Nosaukums!=null && Mervieniba!=null && kCal!=null){
                            if(Nosaukums!="" && Mervieniba!="" && kCal!="") {
                                try {
                                    connection = DriverManager.getConnection(url, user, psw);
                                    String queryString = "INSERT INTO produkts(Nosaukums,Mervieniba,kCal) VALUES (?, ?, ?)";
                                    pstatement = connection.prepareStatement(queryString);
                                    pstatement.setString(1, Nosaukums);
                                    pstatement.setString(2, Mervieniba);
                                    pstatement.setString(3, kCal);
                                    updateQuery = pstatement.executeUpdate();
                                    
                                    if(Tauki!=null || OglHidr!=null || OlBalt!=null || Sals!=null || TranSk!=null || SkiedrViel!=null || Cukurs!=null){
                                        if(Tauki!="" || OglHidr!="" || OlBalt!="" || Sals!="" || TranSk!="" || SkiedrViel!="" || Cukurs!=""){
                                        
                                            String queryString1 = "SELECT idProdukts FROM produkts";
                                            pstatement1 = connection.prepareStatement(queryString1);
                                            ResultSet rs1 = pstatement1.executeQuery(); 
                                            int id=0;
                                            while(rs1.next()){
                                                id = Integer.parseInt(rs1.getString("idProdukts"));
                                            }
                                            
                                            int sk=0;
                                            queryString2 = "UPDATE produkts SET ";
                                            
                                            if(Tauki!=null && Tauki!=""){
                                                queryString2=queryString2+"Tauki='"+Tauki+"'";
                                                sk++;
                                            }
                                            if(OglHidr!=null && OglHidr!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"OglHidr='"+OglHidr+"'";
                                                sk++;
                                                
                                            }
                                            if(OlBalt!=null && OlBalt!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"OlBalt='"+OlBalt+"'";
                                                sk++;
                                            }
                                            if(Sals!=null && Sals!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"Sals='"+Sals+"'";
                                                sk++;
                                            }
                                            if(TranSk!=null && TranSk!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"TranSk='"+TranSk+"'";
                                                sk++;
                                            }
                                            if(SkiedrViel!=null && SkiedrViel!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"SkiedrViel='"+SkiedrViel+"'";
                                                sk++;
                                            }
                                            if(Cukurs!=null && Cukurs!=""){
                                                if(sk>0){
                                                    queryString2=queryString2+", ";
                                                }
                                                queryString2=queryString2+"Cukurs='"+Cukurs+"'";
                                                sk++;
                                            }
                                            
                                            queryString2=queryString2+" WHERE idProdukts ="+id+"";
                                            
                                            pstatement2 = connection.prepareStatement(queryString2);
                                            updateQuery2 = pstatement2.executeUpdate();
                                            connection.close();
                                        }
                                    }
                                    
                                    //
                                    //
                                    //aiziet uz index lapu
                                    //
                                    //
                                }
                                catch(SQLException sqe)
                                { 
                                    //out.println(sqe);
                                    %>
                                    
                                    <p style="color:red">Ievadītas nepareizas vērtības!</p>
                                    
                                    <%
                                }
                            }
                        }
                        
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
