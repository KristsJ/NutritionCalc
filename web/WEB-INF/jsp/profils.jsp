<%-- 
    Document   : profils
    Created on : 2014.3.6, 18:20:12
    Author     : Katrina
--%>
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
                line-height: 36px;
                background-color: chartreuse;
            }
            .column2{
                position: relative;
                width: 170px;
                height: 334px;
                left:505px;
                top:-334px;
                line-height: 36px;
                z-index:2;
                background-color: magenta;
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
                background-color: cyan;
            }
            
            .label4{
                position: relative;
                width: 170px;
                height: 36px;
                left: 0px;
                top: 36px;
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
                            Edit information
                        </div>
                        <div class="column1">
                            Password: <br>
                            Password again: <br>
                            Name: <br>
                            Surname: <br>
                            Height: <br>
                            Weight: <br>

                        </div>
                        <div class="column2">
                            <input type="password" style="width: 150px; height: 18px" name="passBox">
                            <input type="password" style="width: 150px; height: 18px" name="passBox2">
                            <input type="text" style="width: 150px; height: 18px" name="nameBox">
                            <input type="text" style="width: 150px; height: 18px" name="surnameBox">
                            <select name="height" style="width: 153px; height: 22px">

                                <%for(int i=50; i<=250; i++){
                                    int height = i;%>
                                    <option value="<%=height %>"><%=height %></option><%
                                }%>
                                <option value=""></option>;
                            </select>
                            <select name="weight1" style="width: 75px; height: 22px">

                                <%for(int i=5; i<=200; i++){
                                    int weight = i;%>
                                    <option value="<%=weight %>"><%=weight %></option><%
                                }%>
                                <option value=""></option>;
                            </select>
                            <select name="weight2" style="width: 75px; height: 22px; top:-22px">

                                <%for(int i=0; i<=9; i++){
                                    int weight2 = i;%>
                                    <option value="<%=weight2 %>"><%=weight2 %></option><%
                                }%>
                                <option value=""></option>;
                            </select>
                        </div>
                        <div class="button">
                            <input type="submit" value="Edit information" style="width:310px; height:30px; font-size: 16px"/>
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
        </div>
    </body>
</html>
