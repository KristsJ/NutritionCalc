<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nutrition Calc</title>
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
                background: brown;
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
            
            .personInfo {
                position: relative;
                width: 200px;
                height: 180px;
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
            
            .Date {
                position: absolute;
                width: 990px;
                height: 125px;
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
            
        </style>
    </head>

    <body>
        <div id="wrap">
            <div class="header">
                <div class="name">
                    Nutrition Calc
                </div>
                <div class="personInfo">
                    <div class="personName">
                            Krists Jankovskis
                        </div>
                    <div class="personColumn1">
                        Vecums: <br>
                        Dzimums: <br>
                        Augums: <br>
                        Svars: <br>
                        <a href title="Ķermeņa masas indekss">ĶMI:</a>
                    </div>
                    <div class="personColumn2">
                        21<br>
                        Vīrietis<br>
                        188 cm<br>
                        67.5 kg<br>
                        18.5
                    </div>
                </div>
                <div class="Date">
                    Piektdiena, 09.05.2014.
                </div>
            </div>
            
            <div class="content">
            
            </div>
        </div>
    </body>
</html>
