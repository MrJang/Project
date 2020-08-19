package com.example.joon3.test;

/**로그인 화면 클래스
 * 여기서 로그인하고 정보를 SharedPreference를 통해 저장해 세션을 유지
 */

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
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
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    protected EditText pwText;
    protected EditText idText;
    protected RadioGroup radioGroup;
    protected RadioButton rb;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button = (Button) findViewById(R.id.button);
        Button button2 = (Button) findViewById(R.id.button2);
        Button button3 = (Button) findViewById(R.id.button3);
        TextView title = (TextView) findViewById(R.id.Title);
        TextView textView1 = (TextView) findViewById(R.id.textView1);
        TextView textView2 = (TextView) findViewById(R.id.textView2);
        radioGroup = (RadioGroup) findViewById(R.id.radioGroup);
        pwText = (EditText) findViewById(R.id.PwText);
        idText = (EditText) findViewById(R.id.IdText);
        //Temp 버튼************************************
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(), "Temp", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(MainActivity.this, HomeActivity.class);
                startActivity(intent);
            }
        });

        //***********************로그인
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new DoJSON().execute("http://10.27.18.50:8500/login/");

            }
        });
        /****************회원가입***********/
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, LoginActiivity.class);
                startActivity(intent);
            }
        });
    }

    public class DoJSON extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... urls) {
            try {
                /***라디오버튼**/
                int radioid = radioGroup.getCheckedRadioButtonId();
                rb = (RadioButton) findViewById(radioid);
                /**json**/
                JSONObject jsonObject = new JSONObject();
                jsonObject.accumulate("user_id", idText.getText());
                jsonObject.accumulate("user_pwd", pwText.getText());
                jsonObject.accumulate("type", rb.getText());
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
                    String result = "";
                    while ((line = reader.readLine()) != null) {
                        buffer.append(line);
                    }
                    result = GetJson(buffer.toString());
                    return result;
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
            if (result.equals("Y")) {
                Toast.makeText(getApplicationContext(), "LoginOK", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(MainActivity.this, HomeActivity.class);
                startActivity(intent);
            } else {
                Toast.makeText(getApplicationContext(), "Wrong Login", Toast.LENGTH_LONG).show();
            }
        }
    }

    //받은 데이터 JSON -> String 변환 및 세션 저장
    public String GetJson(String data) {
        String result = "";
        SharedPreferences pref = getSharedPreferences("PreFer", 0);
        SharedPreferences.Editor editor = pref.edit();
        try {
            JSONObject jsonObject1 = new JSONObject(data);
            String type = jsonObject1.getString("type");
            String state = jsonObject1.getString("login_state");

            String number = "";
            String id = "";
            String name = "";
            if (state.equals("Y")) {
                if (type.equals("employee")) {
                    number = jsonObject1.get("employee_num").toString();
                    id = jsonObject1.get("employee_id").toString();
                    name = jsonObject1.get("employee_name").toString();
                    editor.putString("employee_num",number);
                    editor.putString("employee_name",name);
                    editor.putString("employee_id",id);
                } else {
                    number = jsonObject1.get("employer_num").toString();
                    id = jsonObject1.get("employer_id").toString();
                    name = jsonObject1.get("employer_name").toString();
                    editor.putString("employer_num",number);
                    editor.putString("employer_id",id);
                    editor.putString("employer_name",name);
                }
                result = "Y";

                editor.putString("type", type);
               // editor.putString("user_id", id);
                //editor.putString("number", number);
                //editor.putString("name", name);
                //저장
                editor.apply();
                /******여기까지 SharedPreferences**/
                return result;
            } else {
                result = "Wrong";
                return result;
            }
        } catch (Exception e) {
            result = "fail";
        }

        return result;
    }
}



