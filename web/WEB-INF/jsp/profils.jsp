<%-- 
    Document   : profils
    Created on : 2014.3.6, 18:20:12
    Author     : Katrina
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="lv.nutritionCalc.objects.Lietotajs"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
                background-color: yellow;
                
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
                background-color: lightcyan;
                z-index: 1;
            }
            .mainTitle{
                position: relative;
                width: 540px;
                height: 50px;
                left: 270px;
                top: 0px;
                z-index: 2;
                font-size: 36px;
                font-weight: bold;
            }
            
            .column1{
                position: relative;
                width: 235px;
                height: 216px;
                left:270px;
                top:0px;
                z-index:2;
                font-size: 15px;
                line-height: 36px;
                background-color: chartreuse;
            }
            .column2{
                position: relative;
                width: 170px;
                height: 216px;
                left:505px;
                top:-216px;
                line-height: 36px;
                z-index:2;
                background-color: magenta;
            }
            .button{
                position: relative;
                width:395px; 
                height: 60px; 
                left:270px;
                top:-215px;
                z-index:2;
            }
            .column3{
                position: relative;
                width: 170px;
                left: 675px;
                top:-492px;
                line-height: 36px;
                z-index:2;
                height: 216px;
                background-color: cyan;
            }
            
            .label4{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 0px;
                z-index:3;
            }
            .label3{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 144px;
                z-index:3;
        </style>
        
    </head>
    <body>
        <div id="wrap">
            <%Lietotajs l = (Lietotajs)request.getSession().getAttribute("lietotajs");%>
            <div class="header">
                <div class="name">
                    Nutrition and Diet calc
                </div>
            </div>
            <div class="main">
                <form name="input" method="get" action="../NutritionCalc/updateProfils.htm">
                    <div class="mainTitle">
                        Edit information
                    </div>
                    <div class="column1">
                        Password: <br>
                        Password again: <br>
                        Name: <br>
                        Surname: <br>
                        Height: <br>
                        Weight (round numbers only): <br>

                    </div>
                    <div class="column2">
                        <input type="password" style="width: 150px; height: 18px" name="passBox" value="<%=l.getPassword()%>" required>*
                        <input type="password" style="width: 150px; height: 18px" name="passBox2" value="<%=l.getPassword()%>" required>*
                        <input type="text" style="width: 150px; height: 18px" name="nameBox" value="<%=l.getName()%>" required>*
                        <input type="text" style="width: 150px; height: 18px" name="surnameBox" value="<%=l.getSurname()%>">
                        <select name="height" style="width: 153px; height: 22px">
                            <%for(int i=50; i<=250; i++){
                                int height = i;
                                if(!l.getHeight().equals("0")){
                                    if(height==Integer.parseInt(l.getHeight()))
                                        %><option value="<%=height %>" selected><%=height %></option><%
                                    if(height!=Integer.parseInt(l.getHeight()))
                                        %><option value="<%=height %>"><%=height %></option><%
                                }
                                else{
                                    %><option value="<%=height %>"><%=height %></option><%
                                }
                            }
                            
                            if(!l.getHeight().equals("0")){%>
                                <option value=""></option>
                            <%}else{
                                %><option value="" selected></option><%   
                            }%>
                        </select>
                        <input type="text" style="width: 150px; height: 18px" name="weightBox" value="<%=l.getWeight()%>">
                    </div>
                    <div class="button">
                        <input type="submit" value="Edit information" style="width:390px; height:30px; font-size: 16px"/>
                        <label style="display: none" id="l1">Error</label>
                    </div>
                    <div class="column3"> 
                        <div class="label4">
                            <label style="color: red; display: none" id="l4">Passwords does not match!</label>
                        </div>
                        <div class="label3">
                            <label style="color: red; display: none" id="l3">Invalid weight!</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
