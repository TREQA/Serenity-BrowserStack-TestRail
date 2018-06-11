# functional-tests

#Serenity BDD - Automation Framework, built with Gradle

In order to run the test suites with the current configuration, tags (@) should be placed in front of each scenario that needs to be included in the Suite.
The same tag must be mentioned in the tags parameter of the @CucumberOptions tag within the TestRunner Class.
#
After the desired scenarios are included in the suite, the following command should be executed inside the functional-tests folder:
#gradle test aggregate
Using the aggregate option will make the runner also generate reports for each single test which was ran, and the reports can be found at the following location:
[functional-tests]\target\site\reports


## Running tests from gradle -- framework defaults using BrowserStack
make sure the `webdriver.remote.url=` & `webdriver.remote.driver` are commented out in the serenity.properties file and
run with the following command:

`$ gradle test aggregate -Dwebdriver.base.url="DEV / QA / STAGING base url"`

##Variables that need to be present in the gradle.properties file:
`browserStackKey=`   add the key which is provided by BrowserStack
`browserStackUsername=`  add the Username which can be found on the BrowserStack website (no quotation marks required).
Alternatively you can  define these values directly into the serenity.properties file.


##Running with Selenium Grid - for testing your tests
In order to run with selenium grid, make sure the `webdriver.remote.url=` & `webdriver.remote.driver` are not commented
out in the serenity.properties file.

