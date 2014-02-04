<%@ page import="json.viewer.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'stringId', 'error')} ">
	<label for="stringId">
		<g:message code="company.stringId.label" default="String Id" />
		
	</label>
	<g:textField name="stringId" value="${companyInstance?.stringId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'emailCount', 'error')} required">
	<label for="emailCount">
		<g:message code="company.emailCount.label" default="Email Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="emailCount" type="number" value="${companyInstance.emailCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactCount', 'error')} required">
	<label for="contactCount">
		<g:message code="company.contactCount.label" default="Contact Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="contactCount" type="number" value="${companyInstance.contactCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'pageCount', 'error')} required">
	<label for="pageCount">
		<g:message code="company.pageCount.label" default="Page Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pageCount" type="number" value="${companyInstance.pageCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'keyPeopleCount', 'error')} required">
	<label for="keyPeopleCount">
		<g:message code="company.keyPeopleCount.label" default="Key People Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="keyPeopleCount" type="number" value="${companyInstance.keyPeopleCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'keyPeople', 'error')} ">
	<label for="keyPeople">
		<g:message code="company.keyPeople.label" default="Key People" />
		
	</label>
	<g:select name="keyPeople" from="${json.viewer.KeyPeople.list()}" multiple="multiple" optionKey="id" size="5" value="${companyInstance?.keyPeople*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'pages', 'error')} ">
	<label for="pages">
		<g:message code="company.pages.label" default="Pages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.pages?}" var="p">
    <li><g:link controller="page" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="page" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'page.label', default: 'Page')])}</g:link>
</li>
</ul>

</div>

