<%@ page import="cuisine.TypePlat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
		<title><g:message code="Nouveau type de plat" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-typePlat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des types de plats" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-typePlat" class="content scaffold-create" role="main">
			<h1><g:message code="Nouveau type de plat:" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${typePlatInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${typePlatInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'Créer', default: 'Créer')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
