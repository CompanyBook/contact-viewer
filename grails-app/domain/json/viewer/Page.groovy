package json.viewer

class Page implements Serializable, Comparable<Page> {
    String companyBookPageId
    String level

    static hasMany = [contacts: Contact, keyContacts: Contact, emails: String, keyNames: String, unmatchedEmails: String]
    static belongsTo = [company: Company]
    static constraints = {
        url nullable: true
        contactCount()
        emailCount()
        keyContactCount()
        keyNameCount()
    }
    int contactCount
    int keyContactCount
    int emailCount
    int keyNameCount
    String url
    int unmatchedEmailCount

    def beforeInsert() {
        contactCount = contacts ? contacts.size() : 0
        keyContactCount = keyContacts ? keyContacts.size() : 0
        emailCount = emails ? emails.size() : 0
        keyNameCount = keyNames ? keyNames.size() : 0
        url = createUrl()
        id = companyBookPageId.hashCode()
        unmatchedEmails = emails - (contacts.collect { it.email } as Set)
        unmatchedEmailCount = unmatchedEmails.size()
    }

    private String createUrl() {
        def m = (companyBookPageId =~ /^([^\/]+?)(\/[^:]*?):([a-z]+)$/)
        if (m.matches() && m[0] && m[0].size() >= 3) {
            String domain = reverseDomain(m[0][1])
            String subdomain = m[0][2]
            String protocol = m[0][3]
            return "$protocol://$domain$subdomain"
        }
        companyBookPageId
    }

    private String reverseDomain(String domain) {
        domain.split(/\./).reverse().join('.')
    }

//    @Override
//    public String toString() {
//        return super.toString() + "{" +
//                "stringId=" + id +
//                ", companyBookPageId='" + companyBookPageId + '\'' +
//                '}';
//    }
    @Override
    int compareTo(Page other) {
        return this.emailCount <=> other.emailCount
    }
}
