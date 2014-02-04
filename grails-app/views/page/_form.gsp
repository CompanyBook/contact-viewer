<%@ page import="json.viewer.Page" %>



<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="page.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${pageInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'contactCount', 'error')} required">
	<label for="contactCount">
		<g:message code="page.contactCount.label" default="Contact Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="contactCount" type="number" value="${pageInstance.contactCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'emailCount', 'error')} required">
	<label for="emailCount">
		<g:message code="page.emailCount.label" default="Email Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="emailCount" type="number" value="${pageInstance.emailCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'keyContactCount', 'error')} required">
	<label for="keyContactCount">
		<g:message code="page.keyContactCount.label" default="Key Contact Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="keyContactCount" type="number" value="${pageInstance.keyContactCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'keyNameCount', 'error')} required">
	<label for="keyNameCount">
		<g:message code="page.keyNameCount.label" default="Key Name Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="keyNameCount" type="number" value="${pageInstance.keyNameCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="page.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${json.viewer.Company.list()}" optionKey="id" required="" value="${pageInstance?.company?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'companyBookPageId', 'error')} ">
	<label for="companyBookPageId">
		<g:message code="page.companyBookPageId.label" default="Company Book Page Id" />
		
	</label>
	<g:textField name="companyBookPageId" value="${pageInstance?.companyBookPageId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="page.contacts.label" default="Contacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pageInstance?.contacts?}" var="c">
    <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contact" action="create" params="['page.id': pageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="page.emails.label" default="Emails" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'keyContacts', 'error')} ">
	<label for="keyContacts">
		<g:message code="page.keyContacts.label" default="Key Contacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pageInstance?.keyContacts?}" var="k">
    <li><g:link controller="contact" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contact" action="create" params="['page.id': pageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contact.label', default: 'Contact')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'keyNames', 'error')} ">
	<label for="keyNames">
		<g:message code="page.keyNames.label" default="Key Names" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'level', 'error')} ">
	<label for="level">
		<g:message code="page.level.label" default="Level" />
		
	</label>
	<g:textField name="level" value="${pageInstance?.level}"/>
</div>

