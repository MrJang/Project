package com.example.joon3.test;
/**메뉴 화면 클래스
 * 여기서 각 버튼을 이용
 */
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class HomeActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity2_main);
       // Button button1 = (Button)findViewById(R.id.imageButton);
        Button button2 = (Button)findViewById(R.id.imageButton2);
        Button button3 = (Button)findViewById(R.id.imageButton3);
        Button button4 = (Button)findViewById(R.id.imageButton4);
        Button button6 = (Button)findViewById(R.id.imageButton6);

        /*button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HomeActivity.this, Button1.class);
                startActivity(intent);
            }
        });
        */
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HomeActivity.this, Button7.class);
                startActivity(intent);
            }
        });
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HomeActivity.this, Button3.class);
                startActivity(intent);
            }
        });
        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HomeActivity.this, Button4.class);
                startActivity(intent);
            }
        });

        button6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HomeActivity.this, Button6.class);
                startActivity(intent);
            }
        });
    }

    }
