<%-- 
    Document   : registreties
    Created on : May 23, 2014, 10:19:06 AM
    Author     : Madara
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
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
            
            .main{
                position: relative;
                width: 540px;
                height: 400px;
                left: 350px;
                top: 30px;
                z-index: 1;
            }
            .column1{
                position: relative;
                width: 155px;
                height: 370px;
                top:0px;
                z-index:2;
                font-size: 15px;
                line-height: 36px;
            }
            .column2{
                position: relative;
                width: 170px;
                height: 370px;
                left:155px;
                top:-370px;
                line-height: 36px;
                z-index:2;
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
            <div class="main">
                <div class="column1">
                    Username: <br>
                    Password: <br>
                    Name: <br>
                    Surname: <br>
                    Date of birth: <br>
                    Gender: <br>
                    Height: <br>
                    Weight: <br>
                    
                </div>
                <div class="column2">
                    <form name="input" method="get">
                        <input type="text" style="width: 150px; height: 18px" name="userBox">
                        <input type="password" style="width: 150px; height: 18px" name="passBox">
                        <input type="text" style="width: 150px; height: 18px" name="nameBox">
                        <input type="text" style="width: 150px; height: 18px" name="surnameBox">
                        <select name="year" style="width: 63px; height: 22px">
                           
                            <%for(int i=2014; i>=1900; i--){
                                int year = i;%>
                                <option value="<%=year %>"><%=year %></option><%
                            }%>
                            <option value="NULL"></option>;
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
                            <option value="NULL"></option>;
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
                            <option value="NULL"></option>;
                        </select>
                        <select name="gender" style="width: 153px; height: 22px">
                            
                            <option value="S">Female</option>
                            <option value="V">Male</option>
                            <option value="NULL"></option>;
                        </select>
                        <select name="height" style="width: 153px; height: 22px">
                            
                            <%for(int i=50; i<=250; i++){
                                int height = i;%>
                                <option value="<%=height %>"><%=height %></option><%
                            }%>
                            <option value="NULL"></option>;
                        </select>
                        <select name="weight1" style="width: 75px; height: 22px">
                            
                            <%for(int i=5; i<=200; i++){
                                int weight = i;%>
                                <option value="<%=weight %>"><%=weight %></option><%
                            }%>
                            <option value="NULL"></option>;
                        </select>
                        <select name="weight2" style="width: 75px; height: 22px; top:-22px">
                            
                            <%for(int i=0; i<=9; i++){
                                int weight2 = i;%>
                                <option value="<%=weight2 %>"><%=weight2 %></option><%
                            }%>
                            <option value="NULL"></option>;
                        </select>
                        <input type="submit" value="Sign up" style="width: 150px">

                    </form>
                </div>
            </div>
        </div>
<%
    String user = request.getParameter("userBox");
    String pass = request.getParameter("passBox");
    String name = request.getParameter("nameBox");
    String surname = "";
    String birthDate = "";
    String gender = request.getParameter("gender");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight1")+"."+request.getParameter("weight2");
    
    
    if(!request.getParameter("surnameBox").equals("NULL")){
        surname = request.getParameter("surnameBox");
    }
    
    if(request.getParameter("year")=="NULL" || request.getParameter("month")=="NULL" || request.getParameter("day")=="NULL")
        birthDate="NULL";
    else{
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        int day = Integer.parseInt(request.getParameter("day"));
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH,day);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.YEAR, year); 
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        birthDate = sdf.format(cal.getTime());
    }*/

    
    

    
%>
    </body>
</html>
