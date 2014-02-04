
<%@ page import="json.viewer.KeyPeople" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keyPeople.label', default: 'KeyPeople')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-keyPeople" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-keyPeople" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="middleName" title="${message(code: 'keyPeople.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'keyPeople.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="hooverId" title="${message(code: 'keyPeople.hooverId.label', default: 'Hoover Id')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'keyPeople.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'keyPeople.role.label', default: 'Role')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${keyPeopleInstanceList}" status="i" var="keyPeopleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${keyPeopleInstance.id}">${fieldValue(bean: keyPeopleInstance, field: "middleName")}</g:link></td>
					
						<td>${fieldValue(bean: keyPeopleInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: keyPeopleInstance, field: "hooverId")}</td>
					
						<td>${fieldValue(bean: keyPeopleInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: keyPeopleInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${keyPeopleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
