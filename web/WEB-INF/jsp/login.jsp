<%-- 
    Document   : login
    Created on : May 23, 2014, 10:18:22 AM
    Author     : Madara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form name="input">
                        <input type="text" style="width: 100px"> login
                        <br></br>
                        <input type="text" style="width: 100px"> password
                        <br></br>
                        <input type="submit" value="Sign in">
                    </form>
                </div>
                <div class="links">
                    <a href="#">Sign up</a>
                </div>
            </div>
        </div>
    </body>
</html>
