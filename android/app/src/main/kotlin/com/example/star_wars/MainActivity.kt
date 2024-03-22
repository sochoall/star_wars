package com.example.star_wars

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val METHOD_CHANNEL_NAME = "com.example.star_wars/method"
    private val GYROSCOPE_CHANNEL_NAME = "com.example.star_wars/gyroscope"

    private var methodChannel: MethodChannel? = null
    private lateinit var sensorManager: SensorManager
    private var gyroscopeChannel: EventChannel? = null
    private var gyroscopeStreamHandler:StreamHandler? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //Setup Channels
        setupChannels(this,flutterEngine.dartExecutor.binaryMessenger)

    }

    override fun onDestroy() {
        teardownChannels()
        super.onDestroy()
    }

    private fun setupChannels(context:Context, messenger:BinaryMessenger){
        sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager

        methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME)
        methodChannel!!.setMethodCallHandler{
            call,result ->
            if (call.method == "isSensorAvailable") {
                result.success(sensorManager!!.getSensorList(Sensor.TYPE_GYROSCOPE).isNotEmpty())
            } else {
                result.notImplemented()
            }
        }

        gyroscopeChannel = EventChannel(messenger, GYROSCOPE_CHANNEL_NAME)
        gyroscopeStreamHandler = StreamHandler(sensorManager!!, Sensor.TYPE_GYROSCOPE)
        gyroscopeChannel!!.setStreamHandler(gyroscopeStreamHandler)
    }

    private fun teardownChannels(){
        methodChannel!!.setMethodCallHandler(null)
        gyroscopeChannel!!.setStreamHandler(null)
    }

}
