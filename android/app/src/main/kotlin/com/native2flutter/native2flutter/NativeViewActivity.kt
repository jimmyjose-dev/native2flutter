package com.native2flutter.native2flutter

import android.os.Bundle
import android.util.Log
import android.widget.Button
import com.native2flutter.native2flutter.MainActivity
import com.native2flutter.native2flutter.R
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class NativeViewActivity : FlutterActivity() {

    companion object {

        const val flutterMethodName = "invoke_flutter"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val channel = MethodChannel(flutterView, MainActivity.methodChannelName)

        setContentView(R.layout.layout)
        findViewById<Button>(R.id.button).setOnClickListener {
            channel.invokeMethod(flutterMethodName, "Invoked from Android native app")
            finish()
        }
    }
}


