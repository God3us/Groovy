<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Client</title>
    <style type='text/css' media='screen'>
    
    .title{
    border-color: black;
    border-style:solid;
    border-width:2px;
    background:#CD853F;
    }
    
       
    .button{
    width:150px;height:150px;
    font-size: 9em;
    background:#CD853F;
    cursor: pointer;
    }
      
    </style>
  </head>
 
  <body>
    
  <center>
    <div class='title'>      
      <h1>Bienvenue chez Tactil-Restaurant</h1>
    </div>
    <h2>Choisissez le nombre de personnes:</h2>
  
    <table>
      <tr>
        <td><img src="${resource(dir:'images',file:'couverts.jpg')}"></td>
        <td>
           <table style="margin-top:30px;margin-left:20px;margin-right:20px;">
            <tr>
              <td align="center"><input type="button" value="1" class="button" onclick="nb1()"/></td>
              <td align="center"><input type="button" value="2" class="button" onclick="nb2()"/></td>
              <td align="center"><input type="button" value="3" class="button" onclick="nb3()"/></td>
           </tr>
           <tr>
              <td align="center"><input type="button" value="4" class="button" onclick="nb4()"/></td>
              <td align="center"><input type="button" value="5" class="button" onclick="nb5()"/></td>
              <td align="center"><input type="button" value="6" class="button" onclick="nb6()"/></td>
           </tr>
          </table>
        </td>
        <td><img src="${resource(dir:'images',file:'tablette.jpg')}"></td>
      </tr>
    </table>
  </center>
  
</body> 
</html>

<script language=javascript> 

function nb1()
{ 
document.location.href = "choix_formule/1"; 
}
function nb2()
{ 
document.location.href = "choix_formule/2"; 
} 
function nb3()
{ 
document.location.href = "choix_formule/3"; 
} 
function nb4()
{ 
document.location.href = "choix_formule/4"; 
} 
function nb5()
{ 
document.location.href = "choix_formule/5"; 
}
function nb6()
{ 
document.location.href = "choix_formule/5"; 
} 

</script> 
