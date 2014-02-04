<%@ page import="json.viewer.Page" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="controller" controller="company" action="index">Company Index</g:link></li>
    </ul>
</div>

<div id="list-page" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="page" title="${message(code: 'page.id.label', default: 'Id')}"/>

            <g:sortableColumn property="url" title="${message(code: 'page.url.label', default: 'Url')}"/>

            <g:sortableColumn property="contactCount"
                              title="${message(code: 'page.contactCount.label', default: 'Contacts')}"/>

            <g:sortableColumn property="emailCount"
                              title="${message(code: 'page.emailCount.label', default: 'Emails')}"/>

            <g:sortableColumn property="unmatchedEmailCount"
                              title="${message(code: 'page.unmatchedEmailCount.label', default: 'Unmatched')}"/>

            <g:sortableColumn property="keyContactCount"
                              title="${message(code: 'page.keyContactCount.label', default: 'Key Contacts')}"/>

            <g:sortableColumn property="keyNameCount"
                              title="${message(code: 'page.keyNameCount.label', default: 'Key Names')}"/>

            <th><g:message code="page.company.label" default="Company"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${companyPages}" status="i" var="pageInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="page" action="show"
                            id="${pageInstance.id}">${fieldValue(bean: pageInstance, field: "id")}</g:link></td>

                <td><a href="${fieldValue(bean: pageInstance, field: "url")}" target="_blank">
                    ${fieldValue(bean: pageInstance, field: "url")}</a></td>

                <td>${fieldValue(bean: pageInstance, field: "contactCount")}</td>

                <td>${fieldValue(bean: pageInstance, field: "emailCount")}</td>

                <td>${fieldValue(bean: pageInstance, field: "unmatchedEmailCount")}</td>

                <td>${fieldValue(bean: pageInstance, field: "keyContactCount")}</td>

                <td>${fieldValue(bean: pageInstance, field: "keyNameCount")}</td>

                <td><g:link action="show" controller="company"
                            id="${pageInstance.id}">${fieldValue(bean: pageInstance, field: "company")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${pageInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
