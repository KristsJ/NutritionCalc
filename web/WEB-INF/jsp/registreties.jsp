<%-- 
    Document   : registreties
    Created on : May 23, 2014, 10:19:06 AM
    Author     : Madara
--%>

<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

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
                height: 100px;
                top: 30px;
                font-family: ravie;
                font-size: 48px;
                text-align: center;
            }
            
            .main{
                position: relative;
                width: auto;
                height: 480px;
                left: 0px;
                top: 0px;
                background-color: #E1FFE1;
                z-index: 1;
            }
            .mainTitle{
                position: relative;
                width: 540px;
                height: 50px;
                left: 350px;
                top: 0px;
                z-index: 2;
                font-size: 36px;
                font-weight: bold;
            }
            
            .column1{
                position: relative;
                width: 155px;
                height: 334px;
                left:350px;
                top:0px;
                z-index:2;
                font-size: 15px;
                line-height: 36px;;
            }
            .column2{
                position: relative;
                width: 170px;
                height: 334px;
                left:505px;
                top:-334px;
                line-height: 36px;
                z-index:2;
            }
            .button{
                position: relative;
                width:315px; 
                height: 30px; 
                left:350px;
                top:-335px;
                z-index:2;
            }
            .column3{
                position: relative;
                width: 170px;
                left: 675px;
                top:-698px;
                line-height: 36px;
                z-index:2;
                height: 334px;
            }
            .label1{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 0px;
                z-index:3;
            }
            
            .label4{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 36px;
                z-index:3;
            }
            
            .label2{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 108px;
                z-index:3;
            }
            .nextPageBtn{
                position: relative;
                width: 320px;
                height: 40px;
                left: 350px;
                top: -660px;
                z-index:3;
            }
            .label3{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 180px;
                z-index:3;
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
            <div class="body">
                <div class="main">
                    <form name="input" method="get">
                        <div class="mainTitle">
                            Create an Account
                        </div>
                        <div class="column1">
                            Username: <br>
                            Password: <br>
                            Password again: <br>
                            Name: <br>
                            Surname: <br>
                            Date of birth: <br>
                            Gender: <br>
                            Height: <br>
                            Weight: <br>

                        </div>
                        <div class="column2">
                            <input type="text" style="width: 150px; height: 18px" name="userBox" required> *
                            <input type="password" style="width: 150px; height: 18px" name="passBox" required> *
                            <input type="password" style="width: 150px; height: 18px" name="passBox2" required> *
                            <input type="text" style="width: 150px; height: 18px" name="nameBox" required> *
                            <input type="text" style="width: 150px; height: 18px" name="surnameBox">
                            <select name="year" style="width: 63px; height: 22px">

                                <%for(int i=2014; i>=1900; i--){
                                    int year = i;%>
                                    <option value="<%=year %>"><%=year %></option><%
                                }%>
                                <option value=""></option>
                            </select>
                            <select name="month" style="width: 41px; height: 22px; top:-22px">

                                <%for(int i=1; i<=12; i++){
                                    String month = "";
                                    if(i<=9&&i>=1)
                                        month = "0"+i;
                                    else month = ""+i;
                                %>
                                    <option value="<%=month %>"><%=month %></option><%
                                }%>
                                <option value=""></option>
                            </select>
                            <select name="day" style="width: 41px; height: 22px; top:-22px">

                                <%for(int i=1; i<=31; i++){
                                    String day="";
                                    if(i<=9&&i>=1)
                                        day = "0"+i;
                                    else day = ""+i;
                                    %>
                                    <option value="<%=day %>"><%=day %></option><%
                                }%>
                                <option value=""></option>
                            </select>
                            <select name="gender" style="width: 153px; height: 22px">

                                <option value="S">Female</option>
                                <option value="V">Male</option>
                                <option value=""></option>
                            </select>
                            <select name="height" style="width: 153px; height: 22px">

                                <%for(int i=50; i<=250; i++){
                                    int height = i;%>
                                    <option value="<%=height %>"><%=height %></option><%
                                }%>
                                <option value=""></option>
                            </select>
                            <select name="weight1" style="width: 153px; height: 22px">

                                <%for(int i=0; i<=200; i++){
                                    int weight = i;%>
                                    <option value="<%=weight %>"><%=weight %></option><%
                                }%>
                                <option value=""></option>
                            </select>
                        </div>
                        <div class="button">
                            <input type="submit" value="Create an Account" style="width:310px; height:30px; font-size: 16px"/>
                        </div>
                        <div class="column3"> 
                            <div class="label1">
                                <label style="color: red; display: none" id="l1">Select another username!</label>
                            </div>
                            <div class="label4">
                                <label style="color: red; display: none" id="l4">Passwords does not match!</label>
                            </div>
                            <div class="label2">
                                <label style="color: red; display: none" id="l2">Invalid date!</label>
                            </div>
                        </div>
                    </form>
                    <div class="nextPageBtn">
                        <form action="../NutritionCalc/login.htm">
                            <input type="submit" value="Log In" style="width:310px;height:30px">
                        </form>
                    </div>    
                </div>
            </div>
        </div>
<%
    String userName = request.getParameter("userBox");
    String pass = request.getParameter("passBox");
    String pass2 = request.getParameter("passBox2");
    String name = request.getParameter("nameBox");
    String surname = request.getParameter("surnameBox");
    String gender = request.getParameter("gender");
    String height = request.getParameter("height");
    String weight1 = request.getParameter("weight1");
    String date = request.getParameter("year");
    String date2 = request.getParameter("month");
    String date3 = request.getParameter("day"); 
    
    Connection connection = null;
    PreparedStatement pstatement = null;
    Class.forName(driverName);
    int updateQuery = 0;
    int equal=0;
    int passError=0;
    int dateError=0;
    if(userName!=null&&pass!=null&&name!=null){
        if(userName!="" && pass!="" && name!=""){
            try{
                connection = DriverManager.getConnection(url, user, psw);
                String queryGetUserName = "SELECT Lietotajvards FROM lietotajs";
                PreparedStatement stmt = connection.prepareStatement(queryGetUserName);
                ResultSet result = stmt.executeQuery();
                ArrayList<String> liste = new ArrayList<String>();
                while(result.next()){
                    liste.add(result.getString("Lietotajvards"));
                }
                connection.close();
                for(String uname:liste){
                    if(uname.equals(userName)){
                        equal++;
                    }
                }
                if(!pass.equals(pass2)) passError++;
                if(date==null || date2==null || date3==null || date=="" || date2=="" || date3=="") dateError++;
                if((date==null && date2==null && date3==null) || (date=="" && date2=="" && date3=="")) dateError=0;
                if(equal==0&&dateError==0&&passError==0){
                    Lietotajs l = new Lietotajs(userName, pass, name);
                    if(surname!=null || gender!=null || height!=null || weight1!=null || (date!=null && date2!=null && date3!=null)){
                        if(surname!="" || gender!="" || height!="" || weight1!="" || (date!="" && date2!="" && date3!="")){                            
                            if(surname!=null && surname!="") l.setSurname(surname);
                            if(gender!=null && gender!="") l.setGender(gender);
                            if(height!=null && height!="") l.setHeight(height);
                            if(weight1!=null && weight1!="") l.setWeight(weight1);
                            if(date!=null && date2!=null && date3!=null && date!="" && date2!="" && date3!="")
                                l.setDateOfBirth(date+"-"+date2+"-"+date3);
                        }
                    }
                    connection = DriverManager.getConnection(url, user, psw);
                    String queryString = "INSERT INTO lietotajs (Lietotajvards,Parole,Vards,Uzvards,Dzimsanas_datums,Garums,Svars,Dzimums)"
                                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setString(1, l.getUsername());
                    pstatement.setString(2, l.getPassword());
                    pstatement.setString(3, l.getName());
                    pstatement.setString(4, l.getSurname());
                    pstatement.setString(5, l.getDateOfBirth());
                    pstatement.setString(6, l.getHeight());
                    pstatement.setString(7, l.getWeight());
                    pstatement.setString(8, l.getGender());
                    updateQuery = pstatement.executeUpdate();
                    connection.close();
                }
                else{ 
                    if(equal!=0){
                        %><script type="text/javascript">
                        document.getElementById("l1").style.display="block";
                        </script><%
                    }
                    if(passError!=0){
                        %><script type="text/javascript">
                        document.getElementById("l4").style.display="block";
                        </script><%
                    }
                    if(dateError!=0){
                        %><script type="text/javascript">
                        document.getElementById("l2").style.display="block";
                        </script><%
                    }
                }
            }
            catch(SQLException sqe){
                out.println(sqe);
            }
        }
    }
    
%>
    
    </body>
</html>
