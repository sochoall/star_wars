package com.example.star_wars

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.EventChannel

class StreamHandler(private val sensorManager: SensorManager, sensorType: Int, private var interval: Int = SensorManager.SENSOR_DELAY_NORMAL):
        EventChannel.StreamHandler, SensorEventListener {
    private val sensor = sensorManager.getDefaultSensor(sensorType)
    private var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        if (sensor != null){
            eventSink = events
            sensorManager.registerListener(this, sensor, interval)
        }
    }

    override fun onCancel(arguments: Any?) {
        sensorManager.unregisterListener(this)
        eventSink = null
    }

    override fun onSensorChanged(event: SensorEvent?) {
        // val sensorValues = event!!.values
        // val sensorValueX = event!!.values[0]
        // val sensorValueY = event!!.values[1]
        // val sensorValues = {'X': event!!.values[0], 'Y': event!!.values[1]}
        eventSink?.success(event!!.values)
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {

    }

}