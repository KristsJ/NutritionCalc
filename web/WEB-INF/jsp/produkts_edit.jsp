<%-- 
    Document   : produkts_edit
    Created on : Jun 4, 2014, 11:40:39 AM
    Author     : Madara
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
            <div class="back">
            <a href="../NutritionCalc/index.htm">Back</a>
            </div>
            <div class="content">
                <h1>Edit product</h1>
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
                    protein / olbaltumvielas :
                    <br>
                    salt / sāls :  
                    <br>
                    transtaukskābes : 
                    <br>
                    cellulose / škiedrvielas : 
                    <br>
                    sugar / cukurs : 
                    </div>
                <div class="main">
                    <form name="input" method="get">
                        <%Produkts p = (Produkts)request.getSession().getAttribute("produkts");%>
                        <input type="text" name="prodName" style="width: 100px" value="<%//=p.getNosaukums()%>"> * 
                        <br></br>
                        <select name="mervieniba" style="width: 103px">
                            <option value="mL">ml</option>
                            <option value="g">g</option>
                            <option value="gab">piece</option>
                        </select> *
                        <br></br>
                        <input type="text" name="kcal" style="width: 100px" value="<%=p.getkCal()%>"> *
                        <br></br>
                        <input type="text" name="fat" style="width: 100px" value="<%=p.getTauki()%>">
                        <br></br>
                        <input type="text" name="oglHidr" style="width: 100px" value="<%=p.getOglHidr()%>"> 
                        <br></br>
                        <input type="text" name="olbalt" style="width: 100px" value="<%=p.getOlBalt()%>">
                        <br></br>
                        <input type="text" name="sals" style="width: 100px" value=""<%=p.getSals()%>> 
                        <br></br>
                        <input type="text" name="transk" style="width: 100px" value="<%=p.getTranSk()%>"> 
                        <br></br>
                        <input type="text" name="skiedrv" style="width: 100px" value="<%=p.getSkiedrViel()%>"> 
                        <br></br>
                        <input type="text" name="cukurs" style="width: 100px" value="<%=p.getCukurs()%>"> 
                        <br></br><br></br>
                        <input type="submit" value="Add/Pievienot">
                        <%
                        String id = p.getId();
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
                        
                        Connection connection = null;
                        PreparedStatement pstatement = null;    //ievieto produkts
                        Class.forName(driverName);
                        int updateQuery = 0;
                        String queryString ="";
                        if(Nosaukums!=null && Mervieniba!=null && kCal!=null){
                            if(Nosaukums!="" && Mervieniba!="" && kCal!="") {                              
                                try {
                                    connection = DriverManager.getConnection(url, user, psw);
                                    
                                    Produkts produkts1 = new Produkts(Nosaukums, Mervieniba, kCal);
                                    if(Tauki!=null || OglHidr!=null || OlBalt!=null || Sals!=null || TranSk!=null || SkiedrViel!=null || Cukurs!=null){
                                        if(Tauki!="" || OglHidr!="" || OlBalt!="" || Sals!="" || TranSk!="" || SkiedrViel!="" || Cukurs!=""){
                                            if(Tauki!=null && Tauki!=""){
                                                produkts1.setTauki(Tauki);
                                            }
                                            if(OglHidr!=null && OglHidr!=""){
                                                produkts1.setOglHidr(OglHidr);
                                            }
                                            if(OlBalt!=null && OlBalt!=""){
                                                produkts1.setOlBalt(OlBalt);
                                            }
                                            if(Sals!=null && Sals!=""){
                                                produkts1.setSals(Sals);
                                            }
                                            if(TranSk!=null && TranSk!=""){
                                                produkts1.setTranSk(TranSk);
                                            }
                                            if(SkiedrViel!=null && SkiedrViel!=""){
                                                produkts1.setSkiedrViel(SkiedrViel);
                                            }
                                            if(Cukurs!=null && Cukurs!=""){
                                                produkts1.setCukurs(Cukurs);
                                            }
                                        }
                                    }
                                    queryString = "UPDATE produkts SET Nosaukums = '"+ produkts1.getNosaukums()+"', Mervieniba = '"+ produkts1.getMervieniba()+
                                            "', kCal = '"+ produkts1.getkCal() +"', Tauki = '"+ produkts1.getTauki()+"', OglHidr = '"+ produkts1.getOglHidr()+ 
                                            "', OlBalt = '"+ produkts1.getOlBalt() +"', Sals = '"+produkts1.getSals() +"', TranSk = '"+ produkts1.getTranSk() +
                                            "', SkiedrViel = '"+ produkts1.getSkiedrViel() + "', Cukurs = '"+ produkts1.getCukurs() +"' WHERE idProdukts = "+id;
                                    
                                    pstatement = connection.prepareStatement(queryString);
                                    updateQuery = pstatement.executeUpdate();
                                    
                                    connection.close();
                                    //response.sendRedirect("index.htm");
                                }
                                catch(SQLException sqe){
                                    out.println(sqe);
                                    %>
                                    
                                    <p style="color:red">Ievadītas nepareizas vērtības!</p>
                                    
                                    <%
                                }
                                finally{
                                    response.sendRedirect("index.htm");
                                }
                                
                            }
                        }
                        
                    %>
                    </form>
                        
                </div>
            </div>
        </div>
    </body>
</html>
