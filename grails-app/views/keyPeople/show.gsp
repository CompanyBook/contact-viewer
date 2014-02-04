
<%@ page import="json.viewer.KeyPeople" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keyPeople.label', default: 'KeyPeople')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-keyPeople" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-keyPeople" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list keyPeople">
			
				<g:if test="${keyPeopleInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="keyPeople.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${keyPeopleInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keyPeopleInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="keyPeople.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${keyPeopleInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keyPeopleInstance?.hooverId}">
				<li class="fieldcontain">
					<span id="hooverId-label" class="property-label"><g:message code="keyPeople.hooverId.label" default="Hoover Id" /></span>
					
						<span class="property-value" aria-labelledby="hooverId-label"><g:fieldValue bean="${keyPeopleInstance}" field="hooverId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keyPeopleInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="keyPeople.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${keyPeopleInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keyPeopleInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="keyPeople.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${keyPeopleInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:keyPeopleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${keyPeopleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
