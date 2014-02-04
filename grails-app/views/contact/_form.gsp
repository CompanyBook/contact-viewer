<%@ page import="json.viewer.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contact.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${contactInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="contact.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${contactInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="contact.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${contactInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'page', 'error')} required">
	<label for="page">
		<g:message code="contact.page.label" default="Page" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="page" name="page.id" from="${json.viewer.Page.list()}" optionKey="id" required="" value="${contactInstance?.page?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'pageStringId', 'error')} ">
	<label for="pageStringId">
		<g:message code="contact.pageStringId.label" default="Page String Id" />
		
	</label>
	<g:textField name="pageStringId" value="${contactInstance?.pageStringId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="contact.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" value="${fieldValue(bean: contactInstance, field: 'score')}" required=""/>
</div>

