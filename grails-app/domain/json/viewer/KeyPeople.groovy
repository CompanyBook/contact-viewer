package json.viewer

class KeyPeople {
    static belongsTo = [company: Company]

    int hooverId

    String role
    String firstName
    String middleName
    String lastName

    static constraints = {
        middleName nullable: true
    }

    def beforeInsert() {
        this.id = hooverId.hashCode()
    }

    @Override
    public String toString() {
        return "$firstName ${middleName ? "$middleName " : ''}$lastName"
    }
}
