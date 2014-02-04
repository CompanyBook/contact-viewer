<%@ page import="json.viewer.Page" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-page" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list page">

        <g:if test="${pageInstance?.url}">
            <li class="fieldcontain">
                <span id="url-label" class="property-label"><g:message code="page.url.label" default="Url"/></span>

                <span class="property-value" aria-labelledby="url-label"><a
                        href="<g:fieldValue bean="${pageInstance}" field="url"/>" target="_blank"><g:fieldValue
                            bean="${pageInstance}" field="url"/></a></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.contactCount}">
            <li class="fieldcontain">
                <span id="contactCount-label" class="property-label"><g:message code="page.contactCount.label"
                                                                                default="Contact Count"/></span>

                <span class="property-value" aria-labelledby="contactCount-label"><g:fieldValue bean="${pageInstance}"
                                                                                                field="contactCount"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.emailCount}">
            <li class="fieldcontain">
                <span id="emailCount-label" class="property-label"><g:message code="page.emailCount.label"
                                                                              default="Email Count"/></span>

                <span class="property-value" aria-labelledby="emailCount-label"><g:fieldValue bean="${pageInstance}"
                                                                                              field="emailCount"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.keyContactCount}">
            <li class="fieldcontain">
                <span id="keyContactCount-label" class="property-label"><g:message code="page.keyContactCount.label"
                                                                                   default="Key Contact Count"/></span>

                <span class="property-value" aria-labelledby="keyContactCount-label"><g:fieldValue
                        bean="${pageInstance}" field="keyContactCount"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.keyNameCount}">
            <li class="fieldcontain">
                <span id="keyNameCount-label" class="property-label"><g:message code="page.keyNameCount.label"
                                                                                default="Key Name Count"/></span>

                <span class="property-value" aria-labelledby="keyNameCount-label"><g:fieldValue bean="${pageInstance}"
                                                                                                field="keyNameCount"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.company}">
            <li class="fieldcontain">
                <span id="company-label" class="property-label"><g:message code="page.company.label"
                                                                           default="Company"/></span>

                <span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show"
                                                                                     id="${pageInstance?.company?.id}">${pageInstance?.company?.name?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.companyBookPageId}">
            <li class="fieldcontain">
                <span id="companyBookPageId-label" class="property-label"><g:message code="page.companyBookPageId.label"
                                                                                     default="Company Book Page Id"/></span>

                <span class="property-value" aria-labelledby="companyBookPageId-label"><g:fieldValue
                        bean="${pageInstance}" field="companyBookPageId"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.contacts}">
            <li class="fieldcontain">
                <span id="contacts-label" class="property-label"><g:message code="page.contacts.label"
                                                                            default="Contacts"/></span>

                <g:each in="${pageInstance.contacts}" var="c">
                    <span class="property-value" aria-labelledby="contacts-label"><g:link controller="contact"
                                                                                          action="show"
                                                                                          id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${pageInstance?.unmatchedEmails}">
            <li class="fieldcontain">
                <span id="emails-label" class="property-label"><g:message code="page.unmatchedEmails.label"
                                                                          default="Unmatched"/></span>

                <g:each in="${pageInstance.unmatchedEmails}" var="k">
                    <span class="property-value" aria-labelledby="unmatchedEmails-label">${k?.encodeAsHTML()}</span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${pageInstance?.keyContacts}">
            <li class="fieldcontain">
                <span id="keyContacts-label" class="property-label"><g:message code="page.keyContacts.label"
                                                                               default="Key Contacts"/></span>

                <g:each in="${pageInstance.keyContacts}" var="k">
                    <span class="property-value" aria-labelledby="keyContacts-label"><g:link controller="contact"
                                                                                             action="show"
                                                                                             id="${k.id}">${k?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${pageInstance?.keyNames}">
            <li class="fieldcontain">
                <span id="keyNames-label" class="property-label"><g:message code="page.keyNames.label"
                                                                            default="Key Names"/></span>

                <span class="property-value" aria-labelledby="keyNames-label"><g:fieldValue bean="${pageInstance}"
                                                                                            field="keyNames"/></span>

            </li>
        </g:if>

        <g:if test="${pageInstance?.level}">
            <li class="fieldcontain">
                <span id="level-label" class="property-label"><g:message code="page.level.label"
                                                                         default="Level"/></span>

                <span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${pageInstance}"
                                                                                         field="level"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: pageInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${pageInstance}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
