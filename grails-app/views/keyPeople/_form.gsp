<%@ page import="json.viewer.KeyPeople" %>



<div class="fieldcontain ${hasErrors(bean: keyPeopleInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="keyPeople.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${keyPeopleInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyPeopleInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="keyPeople.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${keyPeopleInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyPeopleInstance, field: 'hooverId', 'error')} ">
	<label for="hooverId">
		<g:message code="keyPeople.hooverId.label" default="Hoover Id" />
		
	</label>
	<g:textField name="hooverId" value="${keyPeopleInstance?.hooverId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyPeopleInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="keyPeople.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${keyPeopleInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keyPeopleInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="keyPeople.role.label" default="Role" />
		
	</label>
	<g:textField name="role" value="${keyPeopleInstance?.role}"/>
</div>

