package json.viewer



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KeyPeopleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond KeyPeople.list(params), model: [keyPeopleInstanceCount: KeyPeople.count()]
    }

    def show(KeyPeople keyPeopleInstance) {
        respond keyPeopleInstance
    }

    def create() {
        respond new KeyPeople(params)
    }

    @Transactional
    def save(KeyPeople keyPeopleInstance) {
        if (keyPeopleInstance == null) {
            notFound()
            return
        }

        if (keyPeopleInstance.hasErrors()) {
            respond keyPeopleInstance.errors, view: 'create'
            return
        }

        keyPeopleInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'keyPeopleInstance.label', default: 'KeyPeople'), keyPeopleInstance.id])
                redirect keyPeopleInstance
            }
            '*' { respond keyPeopleInstance, [status: CREATED] }
        }
    }

    def edit(KeyPeople keyPeopleInstance) {
        respond keyPeopleInstance
    }

    @Transactional
    def update(KeyPeople keyPeopleInstance) {
        if (keyPeopleInstance == null) {
            notFound()
            return
        }

        if (keyPeopleInstance.hasErrors()) {
            respond keyPeopleInstance.errors, view: 'edit'
            return
        }

        keyPeopleInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'KeyPeople.label', default: 'KeyPeople'), keyPeopleInstance.id])
                redirect keyPeopleInstance
            }
            '*' { respond keyPeopleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(KeyPeople keyPeopleInstance) {

        if (keyPeopleInstance == null) {
            notFound()
            return
        }

        keyPeopleInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'KeyPeople.label', default: 'KeyPeople'), keyPeopleInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'keyPeopleInstance.label', default: 'KeyPeople'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
