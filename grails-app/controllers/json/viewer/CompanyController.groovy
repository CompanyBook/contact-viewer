package json.viewer

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class CompanyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        respond Company.list(params), model: [companyInstanceCount: Company.count()]
    }

    def show(Company companyInstance) {
        respond companyInstance
    }

    def showPages(Company companyInstance) {
        def sort = params.sort ?: 'contactCount'
        def order = params.order ?: 'desc'
        log.info "sort=$sort, order=$order"
//        def results = Page.findAll(sort: sortField, order: orderType) {
//            companyId == companyInstance.id
//        }
        def results = Page.findAllByCompany(companyInstance, [sort: sort, order: order])

        [companyPages: results, companyName: companyInstance.name]
    }

    def create() {
        respond new Company(params)
    }

    @Transactional
    def save(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'create'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'companyInstance.label', default: 'Company'), companyInstance.stringId])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: CREATED] }
        }
    }

    def edit(Company companyInstance) {
        respond companyInstance
    }

    @Transactional
    def update(Company companyInstance) {
        if (companyInstance == null) {
            notFound()
            return
        }

        if (companyInstance.hasErrors()) {
            respond companyInstance.errors, view: 'edit'
            return
        }

        companyInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.stringId])
                redirect companyInstance
            }
            '*' { respond companyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Company companyInstance) {

        if (companyInstance == null) {
            notFound()
            return
        }

        companyInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Company.label', default: 'Company'), companyInstance.stringId])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'companyInstance.label', default: 'Company'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
