<%-- 
    Document   : pievienot
    Created on : May 23, 2014, 10:19:19 AM
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
            <div class="content">
                <h1>New product / Jauns produkts</h1>
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
                    albumen / olbaltumvielas :
                    <br>
                    salt / sāls :  
                    <br>
                     / transtaukskābes : 
                     <br>
                    cellulose / škiedrvielas : 
                    <br>
                    sugar / cukurs : 
                    </div>
                <div class="main">
                    <form name="input">
                        <input type="text" name="prodName" style="width: 100px"> * 
                        <br></br>
                        <select name="mervieniba" style="width: 103px">
                            <option value="ml">ml</option>
                            <option value="g">g</option>
                            <option value="pc">piece</option>
                        </select> *
                        <br></br>
                        <input type="text" name="kcal" style="width: 100px"> *
                        <br></br>
                        <input type="text" name="fat" style="width: 100px">
                        <br></br>
                        <input type="text" name="oglHidr" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="olbalt" style="width: 100px">
                        <br></br>
                        <input type="text" name="sals" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="transk" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="skiedrv" style="width: 100px"> 
                        <br></br>
                        <input type="text" name="cukurs" style="width: 100px"> 
                        <br></br><br></br>
                        <input type="submit" value="Add/Pievienot">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
