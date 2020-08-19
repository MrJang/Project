package com.example.joon3.test;
/**employer 계약 작성 화면 클래스
 *
 */
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import android.widget.ImageView;
import android.widget.Toast;

import org.json.JSONObject;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;


public class Button4 extends Activity {
    protected EditText en;
    protected EditText bld;
    protected EditText eld;
    protected EditText slt;
    protected EditText elt;
    protected EditText whpd;
    protected EditText whpw;
    protected EditText dayo;
    protected EditText wt;
    protected EditText w;
    protected EditText bs;
    protected EditText ows;
    protected EditText pdm;
    protected EditText pdw;
    protected EditText pm;
    protected EditText i;
    protected EditText cn;
    protected EditText ca;
    protected String contract_number="";
    protected ImageView background;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.button4_main);
        en = (EditText) findViewById(R.id.employer);
        bld = (EditText) findViewById(R.id.begindate);
        eld = (EditText) findViewById(R.id.enddate);
        slt = (EditText) findViewById(R.id.starttime);
        elt = (EditText) findViewById(R.id.endtime);
        whpd = (EditText) findViewById(R.id.daywork);
        whpw = (EditText) findViewById(R.id.weekwork);
        dayo = (EditText) findViewById(R.id.h_day);
        wt = (EditText) findViewById(R.id.wt);
        w = (EditText) findViewById(R.id.wage);
        bs = (EditText) findViewById(R.id.bonussys);
        ows = (EditText) findViewById(R.id.otherwagesys);
        pdm = (EditText) findViewById(R.id.payday_m);
        pdw = (EditText) findViewById(R.id.payday_w);
        pm = (EditText) findViewById(R.id.paymethod);
        i = (EditText) findViewById(R.id.insurance);
        cn = (EditText) findViewById(R.id.companyname);
        ca = (EditText) findViewById(R.id.companyaddress);
        background = (ImageView)findViewById(R.id.Contract);
        background.setImageResource(R.drawable.contract3);
        Button b_c = (Button) findViewById(R.id.button_confirm);

        //변수들을 작성하고 확인버튼 클릭 시
        b_c.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Button4.DoJSON().execute("http://10.27.18.50:8500/fillhalf/");
                Toast.makeText(getApplicationContext(), "확인", Toast.LENGTH_LONG).show();

            }
        });
    }

    public class DoJSON extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... urls) {
            try {
                SharedPreferences pref1 = getSharedPreferences("PreFer", 0);
                String employer_num = pref1.getString("employer_num","");
                /**json**/
                JSONObject jsonObject = new JSONObject();
                jsonObject.accumulate("employer_num",employer_num);
                jsonObject.accumulate("employer_name",en.getText());
                jsonObject.accumulate("begin_labor_date", bld.getText());
                jsonObject.accumulate("end_labor_date", eld.getText());
                jsonObject.accumulate("start_labor_time", slt.getText());
                jsonObject.accumulate("end_labor_time", elt.getText());
                jsonObject.accumulate("working_hours_per_day", whpd.getText());
                jsonObject.accumulate("working_hours_per_week", whpw.getText());
                jsonObject.accumulate("day_off", dayo.getText());
                jsonObject.accumulate("wage_type", wt.getText());
                jsonObject.accumulate("wage", w.getText());
                jsonObject.accumulate("bonus_system", bs.getText());
                jsonObject.accumulate("other_wage_system", ows.getText());
                jsonObject.accumulate("pay_day_monthly", pdm.getText());
                jsonObject.accumulate("pay_day_weekly", pdw.getText());
                jsonObject.accumulate("pay_method", pm.getText());
                jsonObject.accumulate("insurance", i.getText());
                jsonObject.accumulate("company_name", cn.getText());
                jsonObject.accumulate("company_address", ca.getText());

                HttpURLConnection con = null;
                BufferedReader reader = null;

                try {
                    //URL url = new URL("http://192.168.25.16:3000/users");
                    URL url = new URL(urls[0]);
                    //연결을 함
                    con = (HttpURLConnection) url.openConnection();

                    con.setRequestMethod("POST");//POST방식으로 보냄
                    con.setRequestProperty("Cache-Control", "no-cache");//캐시 설정
                    con.setRequestProperty("Content-Type", "application/json");//application JSON 형식으로 전송
                    con.setRequestProperty("Accept", "application/json");//서버에 response 데이터를 html로 받음
                    con.setDoOutput(true);//Outstream으로 post 데이터를 넘겨주겠다는 의미
                    con.setDoInput(true);//Inputstream으로 서버로부터 응답을 받겠다는 의미
                    con.connect();

                    //서버로 보내기위해서 스트림 만듬
                    OutputStream outStream = con.getOutputStream();
                    //버퍼를 생성하고 넣음
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outStream));
                    writer.write(jsonObject.toString());
                    writer.flush();
                    writer.close();//버퍼를 받아줌

                    //서버로 부터 데이터를 받음
                    InputStream stream = con.getInputStream();

                    reader = new BufferedReader(new InputStreamReader(stream));

                    StringBuffer buffer = new StringBuffer();

                    String line = "";

                    while ((line = reader.readLine()) != null) {
                        buffer.append(line);
                    }
                    //contract_num 받아오자
                    JSONObject jsonObject1 = new JSONObject(buffer.toString());
                    contract_number = jsonObject1.getString("contract_num");
                    return contract_number;
                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (con != null) {
                        con.disconnect();
                    }
                    try {
                        if (reader != null) {
                            reader.close();//버퍼를 닫아줌
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            //서버에서 받은contract_number를 저장
            SharedPreferences pref = getSharedPreferences("PreFer", 0);
            SharedPreferences.Editor editor = pref.edit();
            editor.putString("contract_number",result);
            editor.commit();
            //searchhalf 진행
            //new Button4.DoJSON1().execute("http://203.253.23.164:8500/searchhalf/");
                Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
        }
    }
    //두번째 통신(Searchhalf)

    public class DoJSON1 extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... urls) {
            try {
                /**json**/
                //contract_number를 전송하여 계약서 찾기
                JSONObject jsonObject = new JSONObject();
                SharedPreferences pref1 = getSharedPreferences("PreFer",0);//로그인 세션에서 저장된 내용
                String employer_name = pref1.getString("employer_name","");
                jsonObject.accumulate("employer_name",employer_name);
                jsonObject.accumulate("contract_number",contract_number);
                HttpURLConnection con = null;
                BufferedReader reader = null;
                try {
                    URL url = new URL(urls[0]);
                    con = (HttpURLConnection) url.openConnection();
                    con.setRequestMethod("POST");//POST방식으로 보냄
                    con.setRequestProperty("Cache-Control", "no-cache");//캐시 설정
                    con.setRequestProperty("Content-Type", "application/json");//application JSON 형식으로 전송
                    con.setRequestProperty("Accept", "application/json");//서버에 response 데이터를 html로 받음
                    con.setDoOutput(true);//Outstream으로 post 데이터를 넘겨주겠다는 의미
                    con.setDoInput(true);//Inputstream으로 서버로부터 응답을 받겠다는 의미
                    con.connect();


                    OutputStream outStream = con.getOutputStream();

                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outStream));
                    writer.write(jsonObject.toString());
                    writer.flush();
                    writer.close();


                    InputStream stream = con.getInputStream();

                    reader = new BufferedReader(new InputStreamReader(stream));

                    StringBuffer buffer = new StringBuffer();

                    String line = "";
                    while ((line = reader.readLine()) != null) {
                        buffer.append(line);
                    }
                    //서버에서 받은 데이터 확인(contract_number 보내서 search할때 서버에서 주는 확인메세지)
                    String isOk = GetJson(buffer.toString());
                    return isOk;
                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (con != null) {
                        con.disconnect();
                    }
                    try {
                        if (reader != null) {
                            reader.close();//버퍼를 닫아줌
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return null;
        }
        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if(result.equals("Ok")) {
                Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
                Intent intent = new Intent(Button4.this, HomeActivity.class);
                startActivity(intent);
            }
            else {
                Toast.makeText(getApplicationContext(), "Fail", Toast.LENGTH_LONG).show();
            }
        }
    }
    //받은 데이터 JSON -> String 변환 및 계약세션 저장
    public String GetJson(String data) {
        String result = "";
        try {
            SharedPreferences pref = getSharedPreferences("Contract", 0);
            SharedPreferences.Editor editor = pref.edit();
            //서버에서 반쪽계약서 찾기 후 반쪽계약서 데이터 받은 후 저장 -> 이 데이터는 button5에서 사용

            JSONObject jsonObject1 = new JSONObject(data);
            editor.putString("contract_num",jsonObject1.getString("contract_num"));
            editor.putString("employer_num",jsonObject1.getString("employer_num"));
            editor.putString("begin_labor_date",jsonObject1.getString("begin_labor_date"));
            editor.putString("end_labor_date",jsonObject1.getString("end_labor_date"));
            editor.putString("start_labor_time",jsonObject1.getString("start_labor_time"));
            editor.putString("end_labor_time",jsonObject1.getString("end_labor_time"));
            editor.putString("working_hours_per_day",jsonObject1.getString("working_hours_per_day"));
            editor.putString("working_hours_per_week",jsonObject1.getString("working_hours_per_week"));
            editor.putString("day_off",jsonObject1.getString("day_off"));
            editor.putString("wage_type",jsonObject1.getString("wage_type"));
            editor.putString("wage",jsonObject1.getString("wage"));
            editor.putString("pay_day_monthly",jsonObject1.getString("pay_day_monthly"));
            editor.putString("pay_day_weekly",jsonObject1.getString("pay_day_weekly"));
            editor.putString("pay_method",jsonObject1.getString("pay_method"));
            editor.putString("insurance",jsonObject1.getString("insurance"));
            editor.putString("company_name",jsonObject1.getString("company_name"));
            editor.putString("company_address",jsonObject1.getString("company_address"));
            editor.apply();
            result = "Ok";
        } catch(Exception e){
            result = "fail";
        }
        return result;
    }
}
