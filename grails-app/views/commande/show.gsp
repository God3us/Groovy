
<%@ page import="restaurant.Commande" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commande.label', default: 'Commande')}" />
		<title><g:message code="Commande: ${commandeInstance.id}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-commande" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des commandes" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-commande" class="content scaffold-show" role="main">
			<h1><g:message code="Commande: ${commandeInstance.id}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list commande">
			
				<g:if test="${commandeInstance?.table_id}">
				<li class="fieldcontain">
					<span id="table_id-label" class="property-label"><g:message code="commande.table_id.label" default="Table" /></span>
					
						<span class="property-value" aria-labelledby="table_id-label"><g:fieldValue bean="${commandeInstance}" field="table_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commandeInstance?.dat}">
				<li class="fieldcontain">
					<span id="dat-label" class="property-label"><g:message code="commande.dat.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="dat-label"><g:formatDate format="dd/MM/yyyy HH:mm" date="${commandeInstance?.dat}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${commandeInstance?.etat}">
				<li class="fieldcontain">
					<span id="etat-label" class="property-label"><g:message code="commande.etat.label" default="Etat" /></span>
					
						<span class="property-value" aria-labelledby="etat-label">
                                                  <g:if test="${commandeInstance.etat == 1}">
                                                  en cours
                                                </g:if>
                                                <g:else>
                                                  terminée
                                                </g:else>
                                                </span>
					
				</li>
				</g:if>
			
				<g:if test="${commandeInstance?.prix}">
				<li class="fieldcontain">
					<span id="prix-label" class="property-label"><g:message code="commande.prix.label" default="Prix" /></span>
					
						<span class="property-value" aria-labelledby="prix-label"><g:fieldValue bean="${commandeInstance}" field="prix"/>€</span>
					
				</li>
				</g:if>
                          
                                <li class="fieldcontain">
                                  <span id="plat" class="property-label">Plats</span>
                                  <br /><br />
                                  <g:each in="${cuisine.TypePlat.list()}" var="tp">
                                    <span style="width:100px; font-weight: bold; margin-left:200px">${tp.libelle}</span>
                                    <table style="width:600px; margin-left:200px">
                                      <tr>
                                        <th style="width:40%">Nom</th>
                                        <th style="width:10%; text-align: center">Quantité</th>
                                        <th style="width:30%; text-align: center">Etat</th>
                                        <th style="width:20%; text-align: center">Action</th>
                                      </tr>
                                      <g:each in="${restaurant.Commande_plat.findAllByCommande(commandeInstance)}">
                                        <g:if test="${it.type == 1 & cuisine.Plat.get(it.plat_id).typeplatid == tp.id}" >
                                          <tr style="background-color:${it.etat == 0 ? 'rgb(169, 234, 254)' : (it.etat == 1 ? '#00FE7E' :'#FE96A0')}">
                                            <td style="width:100px">${cuisine.Plat.get(it.plat_id).libelle}</td>
                                            <td style="text-align: center">${it.quantite}</td>
                                            <td style="text-align:center">
                                              <g:if test="${it.etat == 0}">
                                                en attente
                                              </g:if>
                                              <g:elseif test="${it.etat == 1}">
                                                en cours
                                              </g:elseif>
                                              <g:else>
                                                terminé
                                              </g:else>
                                            </td>
                                            <td style="text-align:center">
                                              <g:if test="${it.etat == 0}">
                                              <form methode="get" name="cloturer" action="../../commande_plat/commencer_plat">
                                                <input type="hidden" value="${commandeInstance.id}" name="commande" />
                                                <input type="hidden" value="${it.plat_id}" name="plat_id" />
                                                <input type="submit"  value="commencer" />
                                              </form>
                                              </g:if>
                                              <g:if test="${it.etat == 1}">
                                              <form methode="get" name="cloturer" action="../../commande_plat/cloturer_plat">
                                                <input type="hidden" value="${commandeInstance.id}" name="commande" />
                                                <input type="hidden" value="${it.plat_id}" name="plat_id" />
                                                <input type="submit"  value="fermer" />
                                              </form>
                                              </g:if>
                                              <g:if test="${it.etat == 2}">
                                              <form methode="get" name="cloturer" action="../../commande_plat/ouvrir_plat">
                                                <input type="hidden" value="${commandeInstance.id}" name="commande" />
                                                <input type="hidden" value="${it.plat_id}" name="plat_id" />
                                                <input type="submit"  value="ré-ouvrir" />
                                              </form>
                                              </g:if>
                                            </td>
                                          </tr>
                                        </g:if>
                                      </g:each>
                                    </table>
                                  </g:each>
                                
                                <li class="fieldcontain">
                                  <span id="boisson" class="property-label">Boissons</span>
                                  <br /><br />
                                  <g:each in="${cuisine.TypeBoisson.list()}" var="tp">
                                    <span style="width:100px; font-weight: bold; margin-left:200px">${tp.libelle}</span>
                                    <table style="width:500px; margin-left:200px">
                                      <tr>
                                        <th style="width:70%">Nom</th>
                                        <th style="width:30%; text-align: center">Quantité</th>
                                        <th style="width:30%; text-align: center">Etat</th>
                                        <th style="width:30%; text-align: center">Action</th>
                                      </tr>
                                      <g:each in="${restaurant.Commande_plat.findAllByCommande(commandeInstance)}">
                                        <g:if test="${it.type == 2 & cuisine.Boisson.get(it.plat_id)?.type?.id == tp.id}" >
                                          <tr style="background-color:${it.etat ? 'rgb(169, 234, 254)' : '#FE96A0'}">
                                            <td style="width:100px">${cuisine.Boisson.get(it.plat_id).libelle}</td>
                                            <td style="text-align: center">${it.quantite}</td>
                                            <td>
                                              <g:if test="${it.etat == true}">
                                              <form methode="get" name="cloturer" action="../../commande_plat/cloturer_boisson">
                                                <input type="hidden" value="${commandeInstance.id}" name="commande" />
                                                <input type="hidden" value="${it.plat_id}" name="plat_id" />
                                                <input type="submit"  value="fermer" />
                                              </form>
                                              </g:if>
                                              <g:if test="${it.etat == false}">
                                              <form methode="get" name="cloturer" action="../../commande_plat/ouvrir_boisson">
                                                <input type="hidden" value="${commandeInstance.id}" name="commande" />
                                                <input type="hidden" value="${it.plat_id}" name="plat_id" />
                                                <input type="submit"  value="ouvrir" />
                                              </form>
                                              </g:if>
                                            </td>
                                          </tr>
                                        </g:if>
                                      </g:each>
                                    </table>
                                  </g:each>
                                  
                                      
                                </li>
			
			</ol>
				<fieldset class="buttons">
                                  <g:if test="${commandeInstance.etat == 1}">
                                    <g:submitButton value="Cloturer" class="delete" name="Cloturer" onClick="window.location.href='../cloturer/'+${commandeInstance.id}"/>
                                  </g:if>
                                  <g:else>
                                    <g:submitButton value="Ré-ouvrir" class="add" name="add" onClick="window.location.href='../rouvrir/'+${commandeInstance.id}"/>
                                  </g:else>
                                </fieldset>
		</div>
	</body>
</html>
