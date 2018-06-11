package utils;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import testrail.APIClient;

import java.util.HashMap;
import java.util.Map;

import static utils.TestRailRule.*;

/**
 * Created by azainea on 05.06.2018.
 */
public class CucumberHooks {




    @After( order = 0 )
    public void afterScenario(Scenario scenario){

        String testRunId = TEST_RUN_ID;


        String status_id = scenario.getStatus().equals("passed") ? "1" : "5";
        String status_message = status_id.equals("1") ? scenario.getName() + " Test has passed " : scenario.getName() + "Test has failed!";
        String testRailId = extractTestRailId(scenario);
        if( testRailId != null ){
            APIClient client = new APIClient(RAILS_ENGINE_URL);
            client.setUser(TESTRAIL_USERNAME);
            client.setPassword(TESTRAIL_PASSWORD);
            Map data = new HashMap();
            data.put("status_id", status_id);
            data.put("comment", status_message);
            try {
                String uri = "add_result_for_case/" + testRunId + "/" + testRailId + "";
                client.sendPost(uri, data);
            } catch (Exception a) {
                System.out.println("Exception Happened");
            }
        }
    }


    private String extractTestRailId(Scenario scenario){
        for( String tag : scenario.getSourceTagNames()){
           if( tag.contains("TestRailId-")){
               return tag.split("-")[1];
           }
        }
        return null;
    }
}
