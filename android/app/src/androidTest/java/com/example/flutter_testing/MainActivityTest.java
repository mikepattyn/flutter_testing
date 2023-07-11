package com.example.flutter_testing;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.pluggins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

import com.example.flutter_testing.MainActivity;

@RunWith(FlutterTestRunner.class)
public class MainActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
}