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
<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@page import="lv.nutritionCalc.objects.Produkts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://atverts.lv:3306/accenture_madara";%>
        <%!String user = "accenture_madara";%>
        <%!String psw = "85dN17hk1yUEY:x";%>
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
            
            .back{
                position: relative;
                width:auto;
                height:30px;
                top:30px;
                left:100px;
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
                line-height: 40px;
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
            <div class="back">
            <a href="../NutritionCalc/index.htm">Back</a>
            </div>
            <div class="content">
                <h1>New product</h1>
                <div class="main_nos">
                    Product name: <br>
                    Unit of measurement: <br> 
                    kCal: <br>
                    Fat: <br>
                    Carbohydrate: <br> 
                    Protein: <br>
                    Salt: <br>  
                    Bad fat: <br>
                    Fibre: <br>
                    Sugar:
                </div>
                <div class="main">
                    <form name="input" method="get">
                        <input type="text" name="prodName" style="width: 100px"> * 
                        <br><br>
                        <select name="mervieniba" style="width: 104px">
                            <option value="mL">ml</option>
                            <option value="g">g</option>
                            <option value="gab">piece</option>
                        </select> *
                        <br><br>
                        <input type="text" name="kcal" style="width: 100px"> *
                        <br><br>
                        <input type="text" name="fat" style="width: 100px">
                        <br><br>
                        <input type="text" name="oglHidr" style="width: 100px"> 
                        <br><br>
                        <input type="text" name="olbalt" style="width: 100px">
                        <br><br>
                        <input type="text" name="sals" style="width: 100px"> 
                        <br><br>
                        <input type="text" name="transk" style="width: 100px"> 
                        <br><br>
                        <input type="text" name="skiedrv" style="width: 100px"> 
                        <br><br>
                        <input type="text" name="cukurs" style="width: 100px"> 
                        <br><br>
                        <input type="submit" value="Add product" style="width: 104px">
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
                        Lietotajs lietotajs = (Lietotajs)request.getSession().getAttribute("lietotajs");
                        
                        Connection connection = null;
                        PreparedStatement pstatement = null;    //ievieto produkts
                        PreparedStatement pstatement1 = null;   //izgust id produkts
                        PreparedStatement pstatement2 = null;   //ievieto lietotajs_produkts
                        ResultSet result1 = null;
                        Class.forName(driverName);
                        int updateQuery = 0;
                        int updateQuery2 = 0;
                        String queryString ="";
                        String queryString1 ="";
                        String queryString2 ="";
                        
                        if(Nosaukums!=null && Mervieniba!=null && kCal!=null){
                            if(Nosaukums!="" && Mervieniba!="" && kCal!="") {
                                
                                try {
                                    connection = DriverManager.getConnection(url, user, psw);
                                    
                                    //--------------------------------------------------------------
                                    Produkts produkts = new Produkts(Nosaukums, Mervieniba, kCal);
                                    if(Tauki!=null || OglHidr!=null || OlBalt!=null || Sals!=null || TranSk!=null || SkiedrViel!=null || Cukurs!=null){
                                        if(Tauki!="" || OglHidr!="" || OlBalt!="" || Sals!="" || TranSk!="" || SkiedrViel!="" || Cukurs!=""){
                                            if(Tauki!=null && Tauki!=""){
                                                produkts.setTauki(Tauki);
                                            }
                                            if(OglHidr!=null && OglHidr!=""){
                                                produkts.setOglHidr(OglHidr);
                                            }
                                            if(OlBalt!=null && OlBalt!=""){
                                                produkts.setOlBalt(OlBalt);
                                            }
                                            if(Sals!=null && Sals!=""){
                                                produkts.setSals(Sals);
                                            }
                                            if(TranSk!=null && TranSk!=""){
                                                produkts.setTranSk(TranSk);
                                            }
                                            if(SkiedrViel!=null && SkiedrViel!=""){
                                                produkts.setSkiedrViel(SkiedrViel);
                                            }
                                            if(Cukurs!=null && Cukurs!=""){
                                                produkts.setCukurs(Cukurs);
                                            }
                                        }
                                    }
                                    queryString = "INSERT INTO produkts(Nosaukums,Mervieniba,kCal,Tauki,OglHidr,OlBalt,Sals,TranSk,SkiedrViel,Cukurs)"
                                            +" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                    pstatement = connection.prepareStatement(queryString);
                                    pstatement.setString(1, produkts.getNosaukums());
                                    pstatement.setString(2, produkts.getMervieniba());
                                    pstatement.setString(3, produkts.getkCal());
                                    pstatement.setString(4, produkts.getTauki());
                                    pstatement.setString(5, produkts.getOglHidr());
                                    pstatement.setString(6, produkts.getOlBalt());
                                    pstatement.setString(7, produkts.getSals());
                                    pstatement.setString(8, produkts.getTranSk());
                                    pstatement.setString(9, produkts.getSkiedrViel());
                                    pstatement.setString(10, produkts.getCukurs());
                                    updateQuery = pstatement.executeUpdate();
                                    //-----------------------------------------------------------------
                                    queryString1 = "SELECT idProdukts FROM produkts";
                                    pstatement1 = connection.prepareStatement(queryString1);
                                    ResultSet rs1 = pstatement1.executeQuery();
                                    String idProdukts="";
                                    while(rs1.next()){
                                        idProdukts=rs1.getString("idProdukts");
                                    }
                                    //-----------------------------------------------------------------
                                    queryString2 = "INSERT INTO lietotajs_produkts(idLietotajs,idProdukts) VALUES(?,?)";
                                    pstatement2=connection.prepareStatement(queryString2);
                                    pstatement2.setString(1,lietotajs.getId());
                                    pstatement2.setString(2,idProdukts);
                                    updateQuery2 = pstatement2.executeUpdate();
                                    //-----------------------------------------------------------------
                                    connection.close();
                                    response.sendRedirect("index.htm");
                                }
                                catch(SQLException sqe){
                                    out.println(sqe);
                                    %>
                                    
                                    <p style="color:red">Ievadītas nepareizas vērtības!</p>
                                    
                                    <%
                                }
                            }
                        }
                        else{
                        %>
                                    
                        <p style="color:red"><b>*Obligāti aizpildāmie lauki!</b></p>
                                    
                        <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
