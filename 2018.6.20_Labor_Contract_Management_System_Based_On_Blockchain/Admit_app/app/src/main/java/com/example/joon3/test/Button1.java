package com.example.joon3.test;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.view.ViewPager;

import java.util.ArrayList;

public class Button1 extends Activity {
    ViewPager viewPager;
    ImageAdapter viewPagerAdapter;
    ArrayList arrayList; // viewPager에서보여줄 item

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.button1_main);
        arrayList = new ArrayList();
        for (int i=0; i < 3 ; i++){
            arrayList.add(R.drawable.a1+i);
        }
        viewPager = (ViewPager)findViewById(R.id.viewpager);
        viewPagerAdapter = new ImageAdapter(getLayoutInflater(),arrayList);

        viewPager.setAdapter(viewPagerAdapter);
    }
}