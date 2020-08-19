package com.example.joon3.test;
/**employee 가 employer가 작성한 반쪽 계약을 찾기위해 쓰는 클래스
 * 여기서 button5클래스로 진입해 반쪽 계약 완성
 */

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
import org.w3c.dom.Text;


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


//여기에서 employee가 Search실행
public class Button6 extends Activity {
    protected Button button_confirm;

    protected EditText employer_name;
    protected EditText contract_number;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.button6_main);
        button_confirm = (Button) findViewById(R.id.button_search);
        employer_name = (EditText) findViewById(R.id.employer_name);
        contract_number = (EditText) findViewById(R.id.contract_number);
        button_confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new DoJSON().execute("http://10.27.18.50:8500/searchhalf/");
            }
        });
    }

    //두번째 통신(Searchhalf)
    public class DoJSON extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... urls) {
            try {
                /**json**/
                //contract_number를 전송하여 계약서 찾기
                JSONObject jsonObject = new JSONObject();
                //로그인 세션에서 저장된 내용
                jsonObject.accumulate("employer_name", employer_name.getText());
                jsonObject.accumulate("contract_num", contract_number.getText());
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
            if (result.equals("Ok")) {
                Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
                Intent intent = new Intent(Button6.this,Button5.class);
                startActivity(intent);
            } else {
                Toast.makeText(getApplicationContext(), "Fail", Toast.LENGTH_LONG).show();
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
                editor.putString("contract_num", jsonObject1.getString("contract_num"));
                editor.putString("employer_num", jsonObject1.getString("employer_num"));
                editor.putString("employer_name", jsonObject1.getString("employer_name"));
                editor.putString("begin_labor_date", jsonObject1.getString("begin_labor_date"));
                editor.putString("end_labor_date", jsonObject1.getString("end_labor_date"));
                editor.putString("start_labor_time", jsonObject1.getString("start_labor_time"));
                editor.putString("end_labor_time", jsonObject1.getString("end_labor_time"));
                editor.putString("working_hours_per_day", jsonObject1.getString("working_hours_per_day"));
                editor.putString("working_hours_per_week", jsonObject1.getString("working_hours_per_week"));
                editor.putString("day_off", jsonObject1.getString("day_off"));
                editor.putString("wage_type", jsonObject1.getString("wage_type"));
                editor.putString("bonus_system", jsonObject1.getString("bonus_system"));
                editor.putString("other_wage_system", jsonObject1.getString("other_wage_system"));
                editor.putString("wage", jsonObject1.getString("wage"));
                editor.putString("pay_day_monthly", jsonObject1.getString("pay_day_monthly"));
                editor.putString("pay_day_weekly", jsonObject1.getString("pay_day_weekly"));
                editor.putString("pay_method", jsonObject1.getString("pay_method"));
                editor.putString("insurance", jsonObject1.getString("insurance"));
                editor.putString("company_name", jsonObject1.getString("company_name"));
                editor.putString("company_address", jsonObject1.getString("company_address"));
                editor.apply();

                result = "Ok";
            } catch (Exception e) {
                result = "fail";
            }
            return result;
        }
    }
}
