import com.browserstack.BrowserStackSerenityTest;
import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

/**
 * Created by dgurau on 08-Feb-18.
 */


@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        features = "src/test/resources/features"
        , tags = "@prep"
)
public class TestRunner extends BrowserStackSerenityTest {

//    @Managed(driver = "chrome", uniqueSession = false)
//    WebDriver driver;

}
