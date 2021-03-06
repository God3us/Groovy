<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="Accueil"/></title>
	<style type='text/css' media='screen'>
          #t1 tr:hover
          {
            background: none;
          }
          
          #t2 th:hover
          {
            background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
                filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#eaeaea');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
	
          }
          #t1 th:hover
          {
            background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
                filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#eaeaea');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
	
          }  
          
          table
          {
            border-top: 0px solid #DFDFDF;
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 1em;
          }
          
	</style>
</head>

<body>
  <div class="nav" role="navigation">
      <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
            <li class="logout"><g:link class="logout" controller="logout"><g:message code="Déconnection" args="[entityName]" /></g:link></li>
      </ul>
  </div>
  <div class="content scaffold-list">
    <h1>Tableau de bord</h1>
      <table id="t1" style="width:700px">
        <g:if test="${[ "ROLE_COOKER"].contains(userInstance.getAuthorities().authority[0])}">
          <td>
            <table style="width:250px">
              <tr>
                <th>Nombre de plats : ${cuisine.Plat.list().size()}</th>
              </tr>
              <g:each in="${cuisine.TypePlat.list()}">
                <tr>
                  <td style="text-indent: 20px">
                    ${it.libelle}(s) : ${cuisine.Plat.findAll("from Plat as p where p.typeplatid = ?", [it.id]).size()}
                  <td>
                </tr>
              </g:each>
            </table>
          </td><td>
            <table style="width:250px">
              <tr>
                <th>Nombre de boissons : ${cuisine.Boisson.list().size()}</th>
              </tr>
              <g:each in="${cuisine.TypeBoisson.list()}">
                <tr>
                  <td style="text-indent: 20px">
                    ${it.libelle}(s) : ${cuisine.Boisson.findAllByType(it).size()}
                  <td>
                </tr>
              </g:each>
            </table>
          </td>
          
        </g:if>
        <g:if test="${["ROLE_DIRECTOR"].contains(userInstance.getAuthorities().authority[0])}">
          <td>
            <table style="width:270px">
              <tr>
                <th>Nombre d'utilisateurs : ${grailsapplication2.User.list().size()}</th>
              </tr>
              <g:each in="${grailsapplication2.Role.list()}">
                <tr>
                  <td style="text-indent: 20px">
                    ${it.authority} : ${grailsapplication2.UserRole.findAllByRole(it).size()}
                  <td>
                </tr>
              </g:each>
            </table>
          </td>
        </g:if>
        <td>
          <table style="width:270px">
            <tr>
              <th>
                Nombre de menus : ${cuisine.Menu.list().size()}
              </th>
            </tr>

            <g:if test='${["ROLE_DIRECTOR"].contains(userInstance.getAuthorities().authority[0])}'>
              <tr>
                <th>
                  Nombre de plats : ${restaurant.Tabl.list().size()}
                </th>
              </tr>
              <tr>
                <th>
                  Nombre de boissons : ${cuisine.Boisson.list().size()}
                </th>
              </tr>
            </g:if>
            <tr>
              <th>
                Nombre de réservations : ${restaurant.Reservation.list().size()}
              </th>
            </tr>
             </tr>
             <tr>
              <th>
                Nombre de commandes : ${restaurant.Commande.findAllByEtat(1).size()}
              </th>
            </tr>
          </table>
        </td>
    </table>    
  </div>
  <div class="content scaffold-list">
    <h1>Administration</h1>
    <table id="t2">
      <g:if test="${["ROLE_DIRECTOR", "ROLE_COOKER"].contains(userInstance.getAuthorities().authority[0])}">
        <th style="width:150px; padding-right:2px">
          <table>
            <tr>
              <th>
                Gestion des plats
              </th>
            </tr>
            <tr>
              <td>
                <g:link controller="plat">Plats</g:link>
              </td>
            </tr>
            <tr>
              <td>
                <g:link controller="typePlat">Types de plats</g:link>
              </td>
            </tr>
            </tr>
          </table>
        </th>
        <g:if test="${["ROLE_SERVER"].contains(userInstance.getAuthorities().authority[0])}">
          <th style="width:180px; padding-left:2px; padding-right:2px">
            <table>
              <tr>
                <th>
                  Gestion des boissons
                </th>
              </tr>
              <tr>
                <td>
                  <g:link controller="boisson">Boissons</g:link>
                </td>
              </tr>
              <tr>
                <td>
                  <g:link controller="TypeBoisson">Types de boissons</g:link>
                </td>
              </tr>
            </table>
          </th>
        </g:if>
        <th style="width:155px; padding-left:2px; padding-right:2px">
          <table>
            <tr>
              <th>
                Gestion des menus
              </th>
            </tr>
            <tr>
              <td>
                <g:link controller="menu">Menus</g:link>
              </td>
            </tr>
          </table>
        </th>
      </g:if>
      <g:if test="${["ROLE_DIRECTOR", "ROLE_SERVER"].contains(userInstance.getAuthorities().authority[0])}">
        <th style="width:150px; padding-left:2px; padding-right:2px">
          <table>
            <tr>
              <th>
                Gestion des tables
              </th>
            </tr>
            <tr>
              <td>
                <g:link controller="tabl">Tables</g:link>
              </td>
            </tr>
            <tr>
              <td>
                <g:link controller="reservation">Réservations</g:link>
              </td>
            </tr>
          </table>
        </th>
      </g:if>
      <g:if test="${["ROLE_DIRECTOR"].contains(userInstance.getAuthorities().authority[0])}">
        <th style="width:190px; padding-left:2px; padding-right:2px">
          <table>
            <tr>
              <th>
                Gestion des utilisateurs
              </th>
            </tr>
            <tr>
              <td>
                <g:link controller="user">Utilisateurs</g:link>
              </td>
            </tr>
            <tr>
              <td>
                <g:link controller="role">Rôles</g:link>
              </td>
            </tr>
          </table>
      </th>
      </g:if>
      <g:if test="${["ROLE_COOKER", "ROLE_SERVER"].contains(userInstance.getAuthorities().authority[0])}">
        <th style="width:190px; padding-left:2px; padding-right:2px">
          <table>
            <tr>
              <th>
                Gestion des commandes
              </th>
            </tr>
            <tr>
              <td>
                <g:link controller="commande">Commandes</g:link>
              </td>
          </table>
      </th>
      </g:if>
    </table>    
  </div>
</body>
</html>
