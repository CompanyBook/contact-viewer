import grails.converters.JSON
import json.viewer.Company
import json.viewer.Contact
import json.viewer.KeyPeople
import json.viewer.Page
import org.codehaus.groovy.grails.web.json.JSONElement
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

import java.util.regex.Matcher


class BootStrap {
    private static boolean READ_DATA = false

    def init = { servletContext ->
        if (READ_DATA) {
            def appContext = servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)
            def filePath = "resources/find-people-output.txt"
            def data = appContext.getResource("classpath:$filePath").inputStream.text
            readData(data)
        }
    }

    def readData(String data) {
        data.eachLine { line ->
            Matcher m = line =~ /^(\w+)\s+(.*)$/
            String key = m[0][1]
            JSONElement json = JSON.parse(m[0][2])

            Company company = new Company(stringId: key, name: json['name'])
            addPagesToCompany(company, json['pages'] as JSONElement)
            updateCounters(company)
            if (company.pageCount > 0 && company.emails.size() > 0) {
                parseKeyPeople(json['people']).each { company.addToKeyPeople(it) }
                company.save(failOnError: true, validate: true, flush: true)
            }
        }
    }

    def updateCounters(Company company) {
        company.pageCount = company.pages ? company.pages.size() : 0
        if (company.pageCount > 0) {
            company.emails = company.pages.collect { it.emails ?: [] }.flatten().unique()
            company.contacts = company.pages.collect { it.contacts ?: [] }.flatten().unique()
        }
    }

    void addPagesToCompany(Company company, JSONElement element) {
        element.each { companyBookPageId, value ->
            Page page = new Page(companyBookPageId: companyBookPageId)
            // keyNames
            page.keyNames = value['keyNames'] as List<String>
            //emails
            page.emails = (value['emails'] as List<String>).collect { it.toLowerCase() }
            page.level = value['level']
            addContactsToPage(value['contacts'] as JSONElement, page)
            addKeyContactsToPage(value['keyContacts'] as JSONElement, page)
            company.addToPages(page)
        }
    }

    void addContactsToPage(JSONElement element, Page page) {
        element.each {
            Contact contact = createContactFromJson(it, page)
            if (!page.contacts?.contains(contact)) {
                page.addToContacts(contact)
            }
        }
    }

    void addKeyContactsToPage(JSONElement element, Page page) {
        element.each {
            Contact contact = createContactFromJson(it, page)
            if (!page.contacts?.contains(contact)) {
                page.addToKeyContacts(contact)
            }
        }
    }

    private Contact createContactFromJson(JSONElement element, Page page) {
        Contact.findOrCreateWhere(
                name: element['name'],
                phone: element['phone'],
                email: element['email'],
                score: Double.parseDouble(element['score'] as String),
                pageStringId: page.companyBookPageId
        )
    }

    Set<KeyPeople> parseKeyPeople(element) {
        element.with { println it }.collect {
            long id = Long.parseLong(it['hooverId'] as String)
            if (id) {
                new KeyPeople(hooverId: id,
                        firstName: it['first_name'],
                        middleName: it['middle_name'] ?: '',
                        lastName: it['last_name'],
                        role: it['role'],
                )
            } else {
                println it
                null
            }
        }.findAll { it != null }
    }

    def destroy = {
    }
}
