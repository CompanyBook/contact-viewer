package json.viewer

class Contact implements Serializable {
    String name
    String email
    String phone
    double score
    String pageStringId
    static belongsTo = [page: Page]

    static mapping = {
    }

    def beforeInsert() {
        this.id = this.hashCode()
    }
    static constraints = {
        email nullable: true
        phone nullable: true
    }


    @Override
    public String toString() {
        return "$score: $name ($email, $phone)"
        ;
    }

    boolean equals(o) {
        if (o == null) return false
        if (this.is(o)) return true
        if (getClass() != o.getClass()) return false

        Contact contact = (Contact) o

        if (Double.compare(contact.score, score) != 0) return false
        if (email != contact.email) return false
        if (name != contact.name) return false
        if (pageStringId != contact.pageStringId) return false
        if (phone != contact.phone) return false

        return true
    }

    int hashCode() {
        int result
        long temp
        result = (name != null ? name.hashCode() : 0)
        result = 31 * result + (email != null ? email.hashCode() : 0)
        result = 31 * result + (phone != null ? phone.hashCode() : 0)
        temp = score != +0.0d ? Double.doubleToLongBits(score) : 0L
        result = 31 * result + (int) (temp ^ (temp >>> 32))
        result = 31 * result + pageStringId.hashCode()
        return result
    }
}
