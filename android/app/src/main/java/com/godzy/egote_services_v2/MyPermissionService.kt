package com.godzy.egote_services_v2

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result

enum class PermissionType(val methodName: String) {
    CAMERA("Camera"),
    LOCATION("Location"),
    STORAGE("Storage"),
    MICROPHONE("Microphone"),
    BLUETOOTH("Bluetooth"),
    SENSORS("Sensors"),
    SMS("Sms"),
    CONTACTS("Contacts"),
    PHONE("Phone"),
    NEARBY_DEVICES("NearbyDevices"),
    NOTIFICATION("Notification"),
    ACTIVITY_RECOGNITION("ActivityRecognition"),
    CALENDAR("Calendar"),
    CALL_LOG("CallLog"),
    READ_MEDIA_AURAL("ReadMediaAural"),
    READ_MEDIA_VISUAL("ReadMediaVisual"),
}
class MyPermissionService : Service {

    private  var channel: MethodChannel? = null

    constructor() : super() {
        requestPermission<PermissionType>(
            permissionType = TODO(),
            result = TODO()
        )
    }

    constructor(channel: MethodChannel) : super() {
        this.channel = channel
    }

    // Fonction générique qui demande une permission donnée
    fun <T> requestPermission(permissionType: PermissionType, result: Result) {
        val permissionName = permissionType.methodName // Le nom de la permission basé sur le type

        try {
            // Appel dynamique de la méthode de demande de permission
            channel?.invokeMethod("request${permissionName}Permission", null, object : Result {
                override fun success(successResult: Any?) {
                    Log.d("PermissionService", "$permissionName permission granted")
                    result.success(true)
                }

                override fun error(p0: String, errorMessage: String?, errorDetails: Any?) {
                    Log.d("PermissionService", "$permissionName permission denied")
                    result.success(false)
                }


                override fun notImplemented() {
                    Log.d("PermissionService", "$permissionName permission request not implemented")
                    result.success(false)
                }
            })
        } catch (e: Exception) {
            Log.e("PermissionService", "Failed to request permission: $permissionName", e)
            result.success(false)
        }
    }

    companion object {
        private const val TAG = "MyPermissionService"
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

}
