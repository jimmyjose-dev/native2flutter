package com.native2flutter.native2flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.FlutterEngine


import android.content.Intent

class MainActivity: FlutterActivity() {
    companion object {

        const val nativeMethodName = "invoke_native_method"
        const val methodChannelName = "com.native2flutter"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelName).setMethodCallHandler { call, result ->
            if (call.method == nativeMethodName) {
                val intent = Intent(this, NativeViewActivity::class.java)
                startActivity(intent)
                result.success(true)
            } else {
                result.notImplemented()
            }
        }

    }


}


