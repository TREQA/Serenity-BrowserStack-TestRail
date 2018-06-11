package utils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import testrail.APIClient;
import testrail.APIException;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by azainea on 04.06.2018.
 */
public class TestRailRule {




    public static String TEST_RUN_ID;
    public static String PLAN_ID = "84";
    public static String TESTRAIL_USERNAME = System.getProperty("TESTRAIL_USERNAME");
    public static String TESTRAIL_PASSWORD = System.getProperty("TESTRAIL_PASSWORD");
    public static String RAILS_ENGINE_URL = System.getProperty("TESTRAIL_URL");
    public static final int TEST_CASE_PASSED_STATUS = 1;
    public static final int TEST_CASE_FAILED_STATUS = 5;

    public static String current_date = java.util.Calendar.getInstance().getTime().toString();


    public static Long addPlanEntry() throws IOException, APIException {
        String planId = PLAN_ID;
        APIClient client = new APIClient(RAILS_ENGINE_URL);
        client.setUser(TESTRAIL_USERNAME);
        client.setPassword(TESTRAIL_PASSWORD);

        Map data = new HashMap();
        data.put("suite_id", 14);
        data.put("include_all", true);
        data.put("assignedto_id", 3);
        data.put("name", current_date);

        JSONObject r = (JSONObject) client.sendPost("add_plan_entry/" + planId, data);
        JSONArray runs = (JSONArray) r.get("runs");
        JSONObject run0 = (JSONObject) runs.get(0);

        Long id = (Long) run0.get("id");

        System.out.println(id);

        TEST_RUN_ID = id.toString();

        return id;
    }

    public static Long addDemoPlanEntry() throws IOException, APIException {
        APIClient client = new APIClient(RAILS_ENGINE_URL);
        client.setUser(TESTRAIL_USERNAME);
        client.setPassword(TESTRAIL_PASSWORD);

        Map data = new HashMap();
        data.put("suite_id", 16);
        data.put("include_all", true);
        data.put("assignedto_id", 3);
        data.put("name", current_date);

        JSONObject r = (JSONObject) client.sendPost("add_plan_entry/" + 166, data);
        JSONArray runs = (JSONArray) r.get("runs");
        JSONObject run0 = (JSONObject) runs.get(0);

        Long id = (Long) run0.get("id");

        System.out.println(id);

        TEST_RUN_ID = id.toString();

        return id;
    }

}



