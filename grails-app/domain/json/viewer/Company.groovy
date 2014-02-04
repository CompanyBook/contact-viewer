package json.viewer

class Company implements Serializable {

    static hasMany = [pages: Page, keyPeople: KeyPeople]

    static constraints = {
        stringId(display: true)
        name(display: true)
        emailCount(display: true)
        contactCount(display: true)
        pageCount(display: true)
        keyPeopleCount(display: true)
    }

    def beforeInsert() {
        id = Long.parseLong(stringId.replaceFirst(/[A-Z0]+/, ""))
        emailCount = emails.size()
        contactCount = contacts.size()
        unmatchedEmails = emails - (contacts.collect { it.email } as Set)
        unmatchedEmailCount = unmatchedEmails.size()
        pageCount = pages.size()
        keyPeopleCount = keyPeople ? keyPeople.size() : 0
    }
    String stringId
    String name
    int emailCount
    int contactCount
    int pageCount
    int keyPeopleCount
    int unmatchedEmailCount
    Set<String> emails
    Set<Contact> contacts
    Set<String> unmatchedEmails

//    @Override
//    public String toString() {
//        return super.toString() + "{" +
//                "stringId='" + stringId + '\'' +
//                ", name='" + name + '\'' +
//                ", emailCount=" + emailCount +
//                ", contactCount=" + contactCount +
//                ", pageCount=" + pageCount +
//                ", keyPeopleCount=" + keyPeopleCount +
//                '}';
//    }
}
