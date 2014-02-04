<%@ page import="json.viewer.Company" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-company" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list company">

        <g:if test="${companyInstance?.stringId}">
            <li class="fieldcontain">
                <span id="stringId-label" class="property-label"><g:message code="company.stringId.label"
                                                                            default="String Id"/></span>

                <span class="property-value" aria-labelledby="stringId-label"><g:fieldValue bean="${companyInstance}"
                                                                                            field="stringId"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="company.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.emailCount}">
            <li class="fieldcontain">
                <span id="emailCount-label" class="property-label"><g:message code="company.emailCount.label"
                                                                              default="Email Count"/></span>

                <span class="property-value" aria-labelledby="emailCount-label"><g:fieldValue bean="${companyInstance}"
                                                                                              field="emailCount"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.emails}">
            <li class="fieldcontain">
                <span id="emails-label" class="property-label"><g:message code="company.emails.label"
                                                                          default="Emails"/></span>

                <span class="property-value" aria-labelledby="emails-label"><g:fieldValue bean="${companyInstance}"
                                                                                          field="emails"/></span>

            </li>
        </g:if>
        <g:if test="${companyInstance?.unmatchedEmails}">
            <li class="fieldcontain">
                <span id="unmatchedEmails-label" class="property-label"><g:message code="company.unmatchedEmails.label"
                                                                                   default="Unmatched"/></span>

                <span class="property-value" aria-labelledby="emails-label"><g:fieldValue bean="${companyInstance}"
                                                                                          field="unmatchedEmails"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.contactCount}">
            <li class="fieldcontain">
                <span id="contactCount-label" class="property-label"><g:message code="company.contactCount.label"
                                                                                default="Contact Count"/></span>

                <span class="property-value" aria-labelledby="contactCount-label"><g:fieldValue
                        bean="${companyInstance}" field="contactCount"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.pageCount}">
            <li class="fieldcontain">
                <span id="pageCount-label" class="property-label"><g:message code="company.pageCount.label"
                                                                             default="Page Count"/></span>

                <span class="property-value" aria-labelledby="pageCount-label">
                    <g:link controller="company" action="showPages" id="${companyInstance.id}">
                        <g:fieldValue bean="${companyInstance}" field="pageCount"/></g:link></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.keyPeopleCount}">
            <li class="fieldcontain">
                <span id="keyPeopleCount-label" class="property-label"><g:message code="company.keyPeopleCount.label"
                                                                                  default="Key People Count"/></span>

                <span class="property-value" aria-labelledby="keyPeopleCount-label"><g:fieldValue
                        bean="${companyInstance}" field="keyPeopleCount"/></span>

            </li>
        </g:if>

        <g:if test="${companyInstance?.keyPeople}">
            <li class="fieldcontain">
                <span id="keyPeople-label" class="property-label"><g:message code="company.keyPeople.label"
                                                                             default="Key People"/></span>

                <g:each in="${companyInstance.keyPeople}" var="k">
                    <span class="property-value" aria-labelledby="keyPeople-label"><g:link controller="keyPeople"
                                                                                           action="show"
                                                                                           id="${k.id}">${k?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    %{--<g:if test="${companyInstance?.pages}">--}%
    %{--<li class="fieldcontain">--}%
    %{--<span id="pages-label" class="property-label"><g:message code="company.pages.label"--}%
    %{--default="Pages"/></span>--}%

    %{--<g:each in="${companyInstance.pages}" var="p">--}%
    %{--<span class="property-value" aria-labelledby="pages-label"><g:link controller="page" action="show"--}%
    %{--id="${p.id}">${p?.encodeAsHTML()}</g:link></span>--}%
    %{--</g:each>--}%

    %{--</li>--}%
    %{--</g:if>--}%

        <g:form url="[resource: companyInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${companyInstance}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
</div>
</body>
</html>
