<%-- 
    Document   : index
    Created on : May 15, 2014, 05:17:06 PM
    Author     : Krists
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@page import="lv.nutritionCalc.objects.Produkts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nutrition and Diet calc</title>
        
        <%!String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://atverts.lv:3306/accenture_madara";%>
        <%!String user = "accenture_madara";%>
        <%!String psw = "85dN17hk1yUEY:x";%>
        
        
        <script type="text/javascript">
            function ieliktDatubaze(){
                
            }
            function displayResult()
            {
                    try{
                        //String nosProdukts = request.getParameter("myProductsToEat");
                        Lietotajs lietotajs = (Lietotajs)request.getSession().getAttribute("lietotajs");
                            Connection connection = null;
                            PreparedStatement pstatement = null; //izgut produktus un daudzumus cik sodien apesti
                            PreparedStatement pstatement1 = null; //izgut info par produktiem
                            Class.forName(driverName);
                            connection = DriverManager.getConnection(url, user, psw);
                            String today="";
                            
                            Calendar c = Calendar.getInstance();
                            String m="",d="";
                            if((c.get(Calendar.MONTH)+1)<=9)
                            m="0"+(c.get(Calendar.MONTH)+1);
                            else m=""+c.get(Calendar.MONTH)+1;
                            if(c.get(Calendar.DAY_OF_MONTH)<=9)
                            d="0"+c.get(Calendar.DAY_OF_MONTH);
                            else d=""+c.get(Calendar.DAY_OF_MONTH);
                            today=c.get(Calendar.YEAR)+"-"+m+"-"+d;
                            
                            String queryString = "SELECT idProdukts, Daudzums FROM apests WHERE idLietotajs="+lietotajs.getId()+" AND Datums = "+today;
                            pstatement = connection.prepareStatement(queryString);
                            ResultSet rs1 = pstatement.executeQuery();
                            
                            ArrayList <Produkts> produkti = new ArrayList<Produkts>();
                            ArrayList <String> idProduktiem = new ArrayList<String>();
                            ArrayList <String> daudzumi = new ArrayList<String>();
                            
                            while(rs1.next()){
                                String id = rs1.getString("idProdukts");
                                String daudz = rs1.getString("Daudzums");
                                idProduktiem.add(id);
                                daudzumi.add(daudz);
                            }
                            
                            for(int i=0; i<idProduktiem.size(); i++){
                                String queryString1 = "SELECT * FROM produkts WHERE idProdukts="+idProduktiem.get(i);
                                pstatement1 = connection.prepareStatement(queryString1);
                                ResultSet rs2 = pstatement1.executeQuery();
                                while(rs1.next()){
                                    String nos = rs2.getString("Nosaukums");
                                    String mer = rs2.getString("Mervieniba");
                                    String kcal = rs2.getString("kCal");
                                    String tauki = rs2.getString("Tauki");
                                    String ogl = rs2.getStrng("OglHidr");
                                    String ol = rs2.getString("OlBalt");
                                    String sal = rs2.getString("Sals");
                                    String tran = rs2.getString("TranSk");
                                    String ski = rs2.getString("SkiedrViel");
                                    String cuk = rs2.getString("Cukurs");
                                    
                                    float kcal1 = Float.parseFloat(kcal);
                                    float tauki1 = Float.parseFloat(tauki);
                                    float ogl1 = Float.parseFloat(ogl);
                                    float ol1 = Float.parseFloat(ol);
                                    float sal1 = Float.parseFloat(sal);
                                    float tran1 = Float.parseFloat(tran);
                                    float ski1 = Float.parseFloat(ski);
                                    float cuk1 = Float.parseFloat(cuk);
                                    
                                    int daudzum = Int.parseInt(daudzumi.get(i));
                                    
                                    if(mer.equals("g") || mer.equals("mL")){
                                        kcal1 = daudzum * kcal1 / 100;
                                        tauki1 = daudzum * tauki1 / 100;
                                        ogl1 = daudzum * ogl1 / 100;
                                        ol1 = daudzum * ol1 / 100;
                                        sal1 = daudzum * sal1 / 100;
                                        tran1 = daudzum * tran1 / 100;
                                        ski1 = daudzum * ski1 / 100;
                                        cuk1 = daudzum * cuk1 / 100;
                                    }
                                    else{
                                        kcal1 = daudzum * kcal1;
                                        tauki1 = daudzum * tauki1;
                                        ogl1 = daudzum * ogl1;
                                        ol1 = daudzum * ol1;
                                        sal1 = daudzum * sal1;
                                        tran1 = daudzum * tran1;
                                        ski1 = daudzum * ski1;
                                        cuk1 = daudzum * cuk1;
                                    }
                                    Produkts p = new Produkts(idProduktiem.get(i), nos, mer, kcal1+"", tauki1+"", ogl1+"", ol1+"", sal1+"", tran1+"", ski1+"", cuk1+"");
                                    produkti.add(p);
                                }
                            }
                            
                        }
                        catch(SQLException sqe){
                            
                        }
                        for(int i = 1; i <= produkti.size(); i++){
                            document.getElementById("myTable").insertRow(i).innerHTML = '\
                                    <td align="center">Lietotāja ID :</td>\n\
                                    <td align="center">ProdID:</td>\n\
                                    <td align="center">\n\
                    <%
                        String daudzums = request.getParameter("cikDaudz");
                    %><%=daudzums%></td>\n\
                <td align="center">Date:</td>\n\
                <td align="center">700</td>\n\
                <td align="center">77.7 g</td>\n\
                <td align="center">7.8 g</td>\n\
                <td align="center">12.0 g</td>\n\
                <td align="center">15.3 g</td>\n\
                <td align="center">3.1 g</td>\n\
                <td align="center">0.0 g</td>\n\
                <td align="center">4.8 g</td>';
                        }
                document.getElementById("myTable").insertRow(1).innerHTML = '\
                <td align="center">Lietotāja ID :</td>\n\
                <td align="center">ProdID:</td>\n\
                <td align="center">\n\
                    <%
                        String daudzums = request.getParameter("cikDaudz");
                    %><%=daudzums%></td>\n\
                <td align="center">Date:</td>\n\
                <td align="center">700</td>\n\
                <td align="center">77.7 g</td>\n\
                <td align="center">7.8 g</td>\n\
                <td align="center">12.0 g</td>\n\
                <td align="center">15.3 g</td>\n\
                <td align="center">3.1 g</td>\n\
                <td align="center">0.0 g</td>\n\
                <td align="center">4.8 g</td>';
            }
            
        </script>
        
        
        <style type="text/css">
             body, html {
	        background-color: #A0FFA0;
	        font-family: Verdana, Geneva, sans-serif;
	        color: #474747;
	        font-size: 12px;
	        height: 100%;
                margin-top: 0px;
                margin-left: 0px;
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
            
            .title {
                position: relative;
                width: auto;
                height: 120px;
                top: 30px;
                font-family: ravie;
                font-size: 48px;
                text-align: center;
            }
            
            .personInfo {
                position: relative;
                width: 200px;
                height: 150px;
                left: 20px;
                font-family: arial;
                font-style: italic;
                line-height: 18px;
                background-color: blue;
                z-index: 1;
            }
            
            .personName {
                position: relative;
                width: 200px;
                height: 25px;
                text-align: center;
                font-size: 16px;
                background-color: silver;
            }
            
            .personColumn1 {
                position: relative;
                float: left;
                width: 75px;
                height: 100px;
                font-size: 12px;
                background-color: green;
            }
            
            .personColumn1 a {
                text-decoration: none;
                color: black;
            }
            
            .personColumn1 a:hover {
                color: gold;
            }
            
            .personColumn2 {
                position: relative;
                float: left;
                width: 125px;
                height: 100px;
                font-size: 12px;
                background-color: red;
            }
            
            .menu {
                position: relative;
                float: right;
                width: 200px;
                height: 150px;
                top: -150px;
                right: 20px;
                font-family: arial;
                font-style: italic;
                font-weight: bold;
                font-size: 14px;
                line-height: 18px;
                background-color: orange;
                z-index: 1;
            }
            
            .menuButtons {
                position: relative;
                margin-left: 50px;
            }
            
            .menuStrip {
                position: absolute;
                width: 990px;
                height: 150px;
                top: 120px;
                left: 0px;
                text-align: center;
                vertical-align: middle;
                font-family: arial;
                font-size: 24px;
                font-weight: bold;
                line-height: 125px;
                background-color: darkorchid;
            }
            
            .profile {
                position: relative;
                width: 100px;
                height: 25px;
                margin-left: 50px;
            }
            
            .content {
                position: relative;
                width: 990px;
                height: auto;
                background-color: cornsilk;
            }
            
            .addProduct {
                position: relative;
                left: 100px;
                text-align: center;            
            }
            
            .ProgessBars {
                position: relative;
                width: 990px;
                height: 100px;
                left: 400px;
            }
            
            .table {
                position: relative;
                width: 950px;
                height: auto;
                left: 20px;
            }
            
            .table th {
                border: 1px solid black;
            }
            
            .table td {
                border: 1px solid black;
            }
            
        </style>
    </head>

    
<% 
    Lietotajs lietotajs = (Lietotajs)request.getSession().getAttribute("lietotajs");

    String id = lietotajs.getId() + "";
    String vards = lietotajs.getName() + "";
    String uzvards = lietotajs.getSurname() + "";
    String dzimsanasDatums = lietotajs.getDateOfBirth() + "";
    String garums = lietotajs.getHeight() + "";
    String svars = lietotajs.getWeight() + "";
    String dzimums = lietotajs.getGender() + "";
        
    //--------------------------
    
    if (garums.equals("0"))
    {
        garums = "-";
    }
    else
    {
        garums += " cm";
    }
    
    if (svars.equals("0"))
    {
        svars = "-";
    }
    else
    {
        svars += " kg";
    }
    
    if (dzimums.equals("V"))
    {
        dzimums = "Men";
    }
    else if (dzimums.equals("S"))
    {
        dzimums = "Women";
    }
    else
    {
        dzimums = "-";
    }
    
    //------------------------------------
    
    Calendar c1 = Calendar.getInstance();
    
    String tempD = c1.get(Calendar.DATE) + "";
    String tempM = (c1.get(Calendar.MONTH) + 1) + "";
    
    String dd1 = "";
    String mm1 = "";
    String yyyy1 = c1.get(Calendar.YEAR) + "";
    
    if (tempD.length() == 1)
    {
        dd1 = "0" + tempD;
    }
    
    if (tempM.length() == 1)
    {
        mm1 = "0" + tempM;
    }

    String currentDate = dd1 + "." + mm1 + "." + yyyy1;

    //---------------------------------
    
    int day = Integer.parseInt(tempD);
    int month = Integer.parseInt(tempM);
    int year = Integer.parseInt(yyyy1);
    
    String dateString = String.format("%d-%d-%d", year, month, day);
    Date date = new SimpleDateFormat("yyyy-M-d").parse(dateString);

    String dayOfWeek = new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date);
    
%>    

    <body>
        <div id="wrap">
            <div class="header">
                <div class="title">
                    Nutrition and Diet calc
                </div>
                <div class="personInfo">
                    <div class="personName">
                         <%=vards + " " + uzvards%>
                    </div>
                    <div class="personColumn1">
                        Age: <br>
                        Sex: <br>
                        Height: <br>
                        Weight: <br>
                        <a href title="Body mass index">BMI:</a>
                    </div>
                    <div class="personColumn2">
                        <%=dzimsanasDatums%> <br>
                        <%=dzimums%> <br>
                        <%=garums%> <br>
                        <%=svars%> <br>
                        18.5
                    </div>
                    <div class="profile">                    
                        <form action="../NutritionCalc/profils.htm">
                            <input type="submit" value="Edit profile" style="width: 100px">
                        </form>
                    </div>
                </div>
                <div class="menuStrip">
                    <%=dayOfWeek + ", " + currentDate%>
                </div>
                <div class="menu">
                    Choose the product:
                    <select name="myProducts" style="width: 200px">
                        <%
                        //ArrayList<String> produkti = new ArrayList<String>();
                        String produktaNosaukums = "";
                        
                        try {
                            Connection connection = null;
                            PreparedStatement pstatement = null;
                            Class.forName(driverName);

                            connection = DriverManager.getConnection(url, user, psw);

                            String queryString = "SELECT Nosaukums FROM produkts";
                            pstatement = connection.prepareStatement(queryString);
                            ResultSet rs1 = pstatement.executeQuery();

                            while (rs1.next()){
                                produktaNosaukums = rs1.getString("Nosaukums");
                                //produkti.add(produktaNosaukums);
                                %>
                                <option value="<%=produktaNosaukums %>"><%=produktaNosaukums%></option>
                                <%
                            }

                            connection.close();                    
                        }

                        catch(SQLException sqe) { 
                              out.println(sqe);
                        }  
                        %>
                    </select>
                    
                    <br><br>
                    <div class="menuButtons">
                        <form action="../NutritionCalc/pievienot.htm">
                            <input type="submit" value="Add product" style="width: 100px">
                        </form>
                        <form action="../NutritionCalc/produkts_edit.htm">
                            <input type="submit" value="Edit product" style="width: 100px">
                        </form>
                        <input type="submit" value="Delete product" style="width: 100px">
                    </div>
                </div>
            </div>
            
            <div class="content">
                <div class="addProduct">
                    <select name="myProductsToEat" style="width: 200px">
                        <%
                        //ArrayList<String> produkti = new ArrayList<String>();
                        String produktaNosaukums2 = "";
                        
                        try {
                            Connection connection = null;
                            PreparedStatement pstatement = null;
                            Class.forName(driverName);

                            connection = DriverManager.getConnection(url, user, psw);

                            String queryString = "SELECT Nosaukums FROM produkts";
                            pstatement = connection.prepareStatement(queryString);
                            ResultSet rs1 = pstatement.executeQuery();

                            while (rs1.next()){
                                produktaNosaukums2 = rs1.getString("Nosaukums");
                                //produkti.add(produktaNosaukums);
                                %>
                                <option value="<%=produktaNosaukums2%>"><%=produktaNosaukums2%></option>
                                <%
                            }

                            connection.close();                    
                        }

                        catch(SQLException sqe) { 
                              out.println(sqe);
                        }  
                        %>
                        
                        <%--
                        <%
                        for (int i = 0; i <= produkti.size(); i++){
                            String tempProd = produkti.get(i);
                        %>
                            <option value="<%=tempProd%>"><%=tempProd%></option>
                        <%
                        }
                        %>
                        --%>
                    </select>
                    <form name="input" method="get">
                        <input type="text" name="cikDaudz" style="width: 100px"> X 
                        <button type="button" style="width: 75px" 
                                onclick="displayResult()">Add</button>
                    </form>
                </div>
                <br />
                <div class="ProgessBars">
                    <progress value="10" max="100"></progress> Kcal. <br />
                    <progress value="20" max="100"></progress> Sugar <br />
                    <progress value="30" max="100"></progress> Salt <br />
                    <progress value="40" max="100"></progress> Carbohydrate <br />
                    <progress value="50" max="100"></progress> Protein <br />
                    <progress value="60" max="100"></progress> Fat <br />
                </div>
                <br />
                <div class="table">
                    <table id="myTable" style="border: 1px solid black; 
                           border-collapse: collapse; width: 950px" align="center" cellpadding="5">
                        <tr style="background-color: purple; color: white" align="center"> 
                            <th>Product</th>
                            <th><b>X</b></td>
                            <th><b>Kcal. / 100</b></td>
                            <th><b>Value</b></td>
                            <th><b>Kcal.</b></td>
                            <th><b>Carbohydrate</b></td>
                            <th><b>Of which sugars</b></td>
                            <th><b>Protein</b></td>
                            <th><b>Fat</b></td>
                            <th><b>Of which saturates</b></td>
                            <th><b>Salt</b></td>
                            <th><b>Fibre</b></td>
                        </tr>
                        <tr align="center">
                            <td colspan="4" align="right"><b>Total:</b></td>
                            <td><b>727.5</b></td>
                            <td><b>97.6 g</b></td>
                            <td><b>18.1 g</b></td>
                            <td><b>13.0 g</b></td>
                            <td><b>19.8 g</b></td>
                            <td><b>3.1 g</b></td>
                            <td><b>0.0 g</b></td>
                            <td><b>4.8 g</b></td>
                        </tr>
                        <tr align="center">
                            <td colspan="4" align="right"><b>Recommended:</b></td>
                            <td><b>2000</b></td>
                            <td><b>230 g</b></td>
                            <td><b>90 g</b></td>
                            <td><b>55 g</b></td>
                            <td><b>70 g</b></td>
                            <td><b>20 g</b></td>
                            <td><b>6 g</b></td>
                            <td><b>24 g</b></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
</html>

<%
    try {
        Connection connection = null;
        PreparedStatement pstatement = null;
        Class.forName(driverName);

        connection = DriverManager.getConnection(url, user, psw);
        String nos = request.getParameter("myProducts");              
        String queryString1 = "SELECT * FROM produkts WHERE Nosaukums = '" + nos + "'";
        pstatement = connection.prepareStatement(queryString1);
        ResultSet rs2 = pstatement.executeQuery();
        
        String idProdukts="";
        String Nosaukums="";
        String Mervieniba="";
        String kCal="";
        String Tauki="";
        String Oglhidr="";
        String OlBalt="";
        String Sals="";
        String TranSk="";
        String SkiedrViel="";
        String Cukurs="";
        Produkts produkts=null;

        while(rs2.next()){
            idProdukts=rs2.getString("idProdukts");
            Nosaukums=rs2.getString("Nosaukums");
            Mervieniba=rs2.getString("Mervieniba");
            kCal=rs2.getString("kCal");
            Tauki=rs2.getString("Tauki");
            Oglhidr=rs2.getString("Oglhidr");
            OlBalt=rs2.getString("OlBalt");
            Sals=rs2.getString("Sals");
            TranSk=rs2.getString("TranSk");
            SkiedrViel=rs2.getString("SkiedrViel");
            Cukurs=rs2.getString("Cukurs");
            produkts = new Produkts(idProdukts, Nosaukums, Mervieniba, kCal,
                    Tauki, Oglhidr, OlBalt, Sals, TranSk, SkiedrViel, Cukurs);
        }
        request.getSession().setAttribute("produkts",produkts);
        //response.sendRedirect("produkts_edit.htm");

        connection.close();                    
    }

    catch(SQLException sqe){ 
          out.println(sqe);
    }
%>

