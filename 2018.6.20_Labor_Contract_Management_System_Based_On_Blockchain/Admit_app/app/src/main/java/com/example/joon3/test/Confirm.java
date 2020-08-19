package com.example.joon3.test;
/**
 * button7 에서 넘어와서 완성된 계약서와 Confirm을 할 수 있는 클래스
 * 양측이 confirm을 누르면 계약서 생성
 */

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
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


public class Confirm extends Activity {

    protected TextView e1;
    protected TextView e2;
    protected TextView bld;
    protected TextView eld;
    protected TextView slt;
    protected TextView elt;
    protected TextView whpd;
    protected TextView whpw;
    protected TextView dayo;
    protected TextView wt;
    protected TextView w;
    protected TextView bs;
    protected TextView ows;
    protected TextView pdm;
    protected TextView pdw;
    protected TextView pm;
    protected TextView i;
    protected TextView cn;
    protected TextView ca;
    protected TextView ea;
    protected TextView ec;

    protected Button confirm;
    protected String type;
    protected String contract_num;
    @Override
    protected void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.confirm_main);
        SharedPreferences pref = getSharedPreferences("Contract", 0);//button4에서 받아온 내용
        SharedPreferences pref1 = getSharedPreferences("PreFer", 0);

        type = pref1.getString("type", "");
        String employee_name = pref.getString("employee_name", "");
        String employer_name = pref.getString("employer_name", "");
        String begin_labor_date = pref.getString("begin_labor_date", "");
        String end_labor_date = pref.getString("end_labor_date", "");
        String start_labor_time = pref.getString("start_labor_time", "");
        String end_labor_time = pref.getString("end_labor_time", "");
        String working_hours_per_day = pref.getString("working_hours_per_day", "");
        String working_hours_per_week = pref.getString("working_hours_per_week", "");
        String day_off = pref.getString("day_off", "");
        String wage_type = pref.getString("wage_type", "");
        String wage = pref.getString("wage", "");
        String bonus_system = pref.getString("bonus_system", "");
        String other_wage_system = pref.getString("other_wage_system", "");
        String pay_day_monthly = pref.getString("pay_day_monthly", "");
        String pay_day_weekly = pref.getString("pay_day_weekly", "");
        String pay_method = pref.getString("pay_method", "");
        String insurance = pref.getString("insurance", "");
        String company_name = pref.getString("company_name", "");
        String company_address = pref.getString("company_address", "");
        String employee_address = pref.getString("employee_address", "");
        String employee_contact = pref.getString("employee_contact", "");
        contract_num = pref.getString("contract_num", "");

        String employee_confirm = pref.getString("employee_confirm", "");
        String employer_confirm = pref.getString("employer_confirm", "");



        confirm = (Button) findViewById(R.id.button_confirm);
        ea = (TextView) findViewById(R.id.employee_address);
        e1 = (TextView) findViewById(R.id.employee_name);
        e2 = (TextView) findViewById(R.id.employer);
        ec = (TextView) findViewById(R.id.employee_contact);
        ca = (TextView) findViewById(R.id.companyaddress);
        cn = (TextView) findViewById(R.id.companyname);
        i = (TextView) findViewById(R.id.insurance);
        pm = (TextView) findViewById(R.id.paymethod);
        pdw = (TextView) findViewById(R.id.payday_w);
        pdm = (TextView) findViewById(R.id.payday_m);
        ows = (TextView) findViewById(R.id.otherwagesys);
        bs = (TextView) findViewById(R.id.bonussys);
        w = (TextView) findViewById(R.id.wage);
        wt = (TextView) findViewById(R.id.wt);
        dayo = (TextView) findViewById(R.id.h_day);
        whpw = (TextView) findViewById(R.id.weekwork);
        whpd = (TextView) findViewById(R.id.daywork);
        elt = (TextView) findViewById(R.id.endtime);
        slt = (TextView) findViewById(R.id.starttime);
        eld = (TextView) findViewById(R.id.enddate);
        bld = (TextView) findViewById(R.id.begindate);
        ImageView background = (ImageView)findViewById(R.id.Contract);
        background.setImageResource(R.drawable.contract3);

        e1.setText(employee_name);
        e2.setText(employer_name);
        bld.setText(begin_labor_date);
        eld.setText(end_labor_date);
        slt.setText(start_labor_time);
        elt.setText(end_labor_time);
        whpd.setText(working_hours_per_day);
        whpw.setText(working_hours_per_week);
        dayo.setText(day_off);
        wt.setText(wage_type);
        w.setText(wage);
        bs.setText(bonus_system);
        ows.setText(other_wage_system);
        pdm.setText(pay_day_monthly);
        pdw.setText(pay_day_weekly);
        pm.setText(pay_method);
        i.setText(insurance);
        cn.setText(company_name);
        ca.setText(company_address);
        ea.setText(employee_address);
        ec.setText(employee_contact);
        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (type.equals("employer")) {
                    new DoJSON().execute("http://10.27.18.50:8500/employerconfirm/");
                } else {
                    new DoJSON().execute("http://10.27.18.50:8500/employeeconfirm/");
                }
            }
        });
    }
        public class DoJSON extends AsyncTask<String, String, String> {
            @Override
            protected String doInBackground(String... urls) {
                try {

                    /**json**/
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.accumulate("contract_num", contract_num);
                    if(type.equals("employer")) {
                        jsonObject.accumulate("employer_confirm", "Y");
                    }
                    else
                    {
                        jsonObject.accumulate("employee_confirm", "Y");
                    }
                    HttpURLConnection con = null;
                    BufferedReader reader = null;

                    try {
                        URL url = new URL(urls[0]);
                        con = (HttpURLConnection) url.openConnection();

                        con.setRequestMethod("POST");//POST방식으로 보냄
                        con.setRequestProperty("Cache-Control", "no-cache");//캐시 설정
                        con.setRequestProperty("Content-Type", "application/json");//application JSON 형식으로 전송
                        con.setRequestProperty("Accept", "application/json");
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
                        String Ok = "";
                        while ((line = reader.readLine()) != null) {
                            buffer.append(line);
                        }
                        JSONObject jsonObject1 = new JSONObject(buffer.toString());
                        if(type.equals("employer")) {
                            Ok = jsonObject1.getString("contract_employer_confirm_info");
                        }
                        else{
                            Ok = jsonObject1.getString("contract_creation_info");
                        }
                        return Ok;
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
                if (result.equals("Y")) {//메모장 4번 진행
                    Toast.makeText(getApplicationContext(), "전송 완료", Toast.LENGTH_LONG).show();
                    Intent intent = new Intent(Confirm.this, HomeActivity.class);
                    startActivity(intent);
                }
                else{
                Toast.makeText(getApplicationContext(), "Wrong", Toast.LENGTH_LONG).show();
            }
            }
        }
    }


