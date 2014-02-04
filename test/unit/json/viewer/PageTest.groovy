package json.viewer

class PageTest extends GroovyTestCase {
    void "test com.lukecharles/:http"() {
        Page page = new Page(companyBookPageId: "com.lukecharles/:http")
        String url = page.createUrl()
        assert url == "http://lukecharles.com/"
    }

    void "test uk.org.english-heritage/book-and-buy/filming-locations/:http"() {
        Page page = new Page(companyBookPageId: "uk.org.english-heritage/book-and-buy/filming-locations/:http")
        String url = page.createUrl()
        assert url == "http://english-heritage.org.uk/book-and-buy/filming-locations/"
    }

    void "test uk.co.cygnetfamilylaw/lawfirmhistory.php:http"() {
        Page page = new Page(companyBookPageId: "uk.co.cygnetfamilylaw/lawfirmhistory.php:http")
        String url = page.createUrl()
        assert url == "http://cygnetfamilylaw.co.uk/lawfirmhistory.php"
    }
}
