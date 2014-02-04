<%@ page import="json.viewer.Page" %>

<thead>
<tr>

    <g:sortableColumn property="url" title="${message(code: 'page.url.label', default: 'Url')}"/>

    <g:sortableColumn property="contactCount"
                      title="${message(code: 'page.contactCount.label', default: 'Contact Count')}"/>

    <g:sortableColumn property="emailCount" title="${message(code: 'page.emailCount.label', default: 'Email Count')}"/>

    <g:sortableColumn property="keyContactCount"
                      title="${message(code: 'page.keyContactCount.label', default: 'Key Contact Count')}"/>

    <g:sortableColumn property="keyNameCount"
                      title="${message(code: 'page.keyNameCount.label', default: 'Key Name Count')}"/>

    <th><g:message code="page.company.label" default="Company"/></th>

</tr>
</thead>
<tbody>
<g:each in="${pageInstanceList}" status="i" var="pageInstance">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show" id="${pageInstance.id}">${fieldValue(bean: pageInstance, field: "url")}</g:link></td>

        <td>${fieldValue(bean: pageInstance, field: "contactCount")}</td>

        <td>${fieldValue(bean: pageInstance, field: "emailCount")}</td>

        <td>${fieldValue(bean: pageInstance, field: "keyContactCount")}</td>

        <td>${fieldValue(bean: pageInstance, field: "keyNameCount")}</td>

        <td>${fieldValue(bean: pageInstance, field: "company")}</td>

    </tr>
</g:each>
</tbody>
</table>
