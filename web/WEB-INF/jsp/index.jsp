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
                        <%=lietotajs.getAge()%> <br>
                        <%=dzimums%> <br>
                        <%=garums%> <br>
                        <%=svars%> <br>
                        <%=lietotajs.getBMI()%>
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
                                onclick="UzzimetTabulu()">Add</button>
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
                            <td>Product</td>
                            <td><b>X</b></td>
                            <td><b>Kcal. / 100</b></td>
                            <td><b>Value</b></td>
                            <td><b>Kcal.</b></td>
                            <td><b>Carbohydrate</b></td>
                            <td><b>Of which sugars</b></td>
                            <td><b>Protein</b></td>
                            <td><b>Fat</b></td>
                            <td><b>Of which saturates</b></td>
                            <td><b>Salt</b></td>
                            <td><b>Fibre</b></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                            <td>9</td>
                            <td>10</td>
                            <td>11</td>
                            <td>12</td>
                            </tr>
                        <!--tr align="center">
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
                        </tr-->
                    </table>
                    
                    

                <button onclick="UzzimetTabulu()">ParaditTabulu</button>
                

<script>
function UzzimetTabulu()
            {
               var table = document.getElementById("myTable");
  {    
  var row = table.insertRow(table.rows.length);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);
  var cell4 = row.insertCell(3); 
  var cell5 = row.insertCell(4); 
  var cell6 = row.insertCell(5); 
  var cell7 = row.insertCell(6); 
  var cell8 = row.insertCell(7); 
  var cell9 = row.insertCell(8); 
  var cell10 = row.insertCell(9); 
  var cell11 = row.insertCell(10); 
  var cell12 = row.insertCell(11); 
  cell1.innerHTML = "NEW CELL1";
  cell2.innerHTML = "NEW CELL2";
  cell3.innerHTML = "kjkh";
  cell4.innerHTML = "teksts4";
  cell5.innerHTML = "teksts5";
  cell6.innerHTML = "teksts6";
  cell7.innerHTML = "teksts7";
  cell8.innerHTML = "teksts8";
  cell9.innerHTML = "teksts9";
  cell10.innerHTML = "teksts10";
  cell11.innerHTML = "teksts11";
  cell12.innerHTML = "teksts12";
  
}
}
</script>
                </div>
            </div>
            
        </div>


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

<script>
            function ieliktDatubaze(){
                //String nosProdukts = request.getParameter("myProductsToEat");
            }
            function UzzimetTabulu1()
            {
                out.println("hello");
                            var table = document.getElementById("myTable");{
                            var row = table.insertRow(2);
                            var cell1 = row.insertCell(0);                            
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3); 
                            var cell5 = row.insertCell(4); 
                            var cell6 = row.insertCell(5); 
                            var cell7 = row.insertCell(6); 
                            var cell8 = row.insertCell(7); 
                            var cell9 = row.insertCell(8); 
                            var cell10 = row.insertCell(9); 
                            var cell11 = row.insertCell(10); 
                            var cell12 = row.insertCell(11); 
                            cell1.innerHTML = "teksts1";
                            cell2.innerHTML = "teksts2";
                            cell3.innerHTML = "teksts3";
                            cell4.innerHTML = "teksts4";
                            cell5.innerHTML = "teksts5";
                            cell6.innerHTML = "teksts6";
                            cell7.innerHTML = "teksts7";
                            cell8.innerHTML = "teksts8";
                            cell9.innerHTML = "teksts9";
                            cell10.innerHTML = "teksts10";
                            cell11.innerHTML = "teksts11";
                            cell12.innerHTML = "teksts12";
                        }
                /*
                            ArrayList <Produkts> produkti = new ArrayList<Produkts>();
                            ArrayList <String> idProduktiem = new ArrayList<String>();
                            ArrayList <String> daudzumi = new ArrayList<String>();
                            ArrayList <String> sakumaKcal = new ArrayList<String>();
                    try{
                            Lietotajs lietotajs1 = (Lietotajs)request.getSession().getAttribute("lietotajs");
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
                            
                            //izdabut visus produktu daudzumus un id konkretam lietotajam sodien no apests tabulas
                            String queryString = "SELECT idProdukts, Daudzums FROM apests WHERE idLietotajs="+lietotajs1.getId()+" AND Datums = "+today;
                            pstatement = connection.prepareStatement(queryString);
                            ResultSet rs1 = pstatement.executeQuery();
                                                      
                            while(rs1.next()){
                                String id = rs1.getString("idProdukts");
                                String daudz = rs1.getString("Daudzums");
                                idProduktiem.add(id);
                                daudzumi.add(daudz);
                            }
                            
                            for(int i=0; i<idProduktiem.size(); i++){
                                //saliek visus produktus listaa
                                String queryString1 = "SELECT * FROM produkts WHERE idProdukts="+idProduktiem.get(i);
                                pstatement1 = connection.prepareStatement(queryString1);
                                ResultSet rs2 = pstatement1.executeQuery();
                                while(rs1.next()){
                                    String nos = rs2.getString("Nosaukums");
                                    String mer = rs2.getString("Mervieniba");
                                    String kcal = rs2.getString("kCal");
                                    sakumaKcal.add(kcal);
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
                                    //uztaisa produktu un ieliek listaa
                                    Produkts p = new Produkts(idProduktiem.get(i), nos, mer, kcal1+"", tauki1+"", ogl1+"", ol1+"", sal1+"", tran1+"", ski1+"", cuk1+"");
                                    produkti.add(p);
                                }
                            }
                            
                        }
                        catch(SQLException sqe){
                            
                        }
                        */
                        /*for(int i = 1; i <= 1 i++){
                            //visus produktus ieliek tabulaa
                            String d = daudzumi.get(i);
                            String sakKCal = sakumaKcal.get(i);
                            String nos2 = produkti.get(i).getNosaukums();
                            String mer2 = produkti.get(i).getMervieniba();
                            String kcal2 = produkti.get(i).getkCal());
                            String tauki2 = produkti.get(i).getTauki();
                            String ogl2 = produkti.get(i).getOglHidr();
                            String ol2 = produkti.get(i).getOlBalt();
                            String sal2 = produkti.get(i).getSals();
                            String tran2 = produkti.get(i).getTranSk();
                            String ski2 = produkti.get(i).getSkiedrViel();
                            String cuk2 = produkti.get(i).getCukurs();
                            
                            var table = document.getElementById("myTable");
                            var row = table.insertRow(i);
                            
                            var cell1 = row.insertCell(0);                            
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3); 
                            var cell5 = row.insertCell(4); 
                            var cell6 = row.insertCell(5); 
                            var cell7 = row.insertCell(6); 
                            var cell8 = row.insertCell(7); 
                            var cell9 = row.insertCell(8); 
                            var cell10 = row.insertCell(9); 
                            var cell11 = row.insertCell(10); 
                            var cell12 = row.insertCell(11); 
                            cell1.innerHTML = nos2;
                            cell2.innerHTML = mer2;
                            cell3.innerHTML = sakKCal;
                            cell4.innerHTML = d;
                            cell5.innerHTML = kcal2;
                            cell6.innerHTML = ogl2;
                            cell7.innerHTML = cuk2;
                            cell8.innerHTML = ol2;
                            cell9.innerHTML = tauki2;
                            cell10.innerHTML = tran2;
                            cell11.innerHTML = sal2;
                            cell12.innerHTML = ski2;
                            
                        */
                            /*document.getElementById("myTable").insertRow(i).innerHTML = '\
                                    <td align="center"><%//=nos2%></td>\n\
                                    <td align="center"><%//=mer2%></td>\n\
                                    <td align="center"><%//=sakKCal%></td>\n\
                                    <td align="center"><%//=d%></td>\n\
                                    <td align="center"><%//=kcal2%></td>\n\
                                    <td align="center"><%//=ogl2%></td>\n\
                                    <td align="center"><%//=cuk2%></td>\n\
                                    <td align="center"><%//=ol2%></td>\n\
                                    <td align="center"><%//=tauki2%></td>\n\
                                    <td align="center"><%//=tran2%></td>\n\
                                    <td align="center"><%//=sal2%></td>\n\
                                    <td align="center"><%//=ski2%></td>';*/
                        }
                
            }
            function myDeleteFunction()
            {
                    //document.getElementById("myTable").deleteRow(0);
            }
            
        </script>
                        
   </body>
</html>