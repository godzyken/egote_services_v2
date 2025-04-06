package com.godzy.egote_services_v2

// import io.sentry.android.core.SentryAndroid

import FirebaseApi
import FirebaseRequest
import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.lifecycleScope
import androidx.work.WorkManager
import com.google.firebase.Firebase
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.firestore.FieldValue
import com.google.firebase.firestore.firestore
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.messaging
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.github.jan.supabase.SupabaseClient
import io.github.jan.supabase.auth.Auth
import io.github.jan.supabase.auth.ExternalAuthAction
import io.github.jan.supabase.auth.FlowType
import io.github.jan.supabase.coil.Coil3Integration
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.functions.Functions
import io.github.jan.supabase.postgrest.Postgrest
import io.github.jan.supabase.postgrest.PropertyConversionMethod
import io.github.jan.supabase.postgrest.from
import io.github.jan.supabase.realtime.Realtime
import io.github.jan.supabase.storage.Storage
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await
import kotlin.time.Duration.Companion.seconds

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupPermissionChannel()
        setupFlutterFcmMethodChannel()
        setupFlutterSupabaseMethodChannel()
        setupFlutterFmInitializer()
        handleIntentExtras(intent.extras)
    }

    private fun getPlatformVersion() {
        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            DEFAULT_APP_NAME
        ).setMethodCallHandler { call, result ->
            if (call.method == "getPlatformVersion") {
                // Get platform version
                val version = Build.VERSION.RELEASE
                result.success("Android $version")  // Return the platform version to Dart
            } else {
                result.notImplemented()  // Handle cases where the method is not implemented
            }
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        when (requestCode) {
            PermissionRequestCodes.NOTIFICATION_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de notification
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission notification accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission notification refusée.")
                }
            }
            PermissionRequestCodes.CAMERA_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de caméra
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission caméra accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission caméra refusée.")
                }
            }
            PermissionRequestCodes.LOCATION_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de localisation
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission localisation accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission localisation refusée.")
                }
            }
            PermissionRequestCodes.MICROPHONE_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de microphone
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission microphone accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission microphone refusée.")
                }
            }
            PermissionRequestCodes.STORAGE_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de stockage
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission stockage accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission stockage refusée.")
                }
            }
            PermissionRequestCodes.BLUETOOTH_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de Bluetooth
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission Bluetooth accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission Bluetooth refusée.")
                }
            }
            PermissionRequestCodes.CONTACTS_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de contacts

                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission contacts accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission contacts refusée.")
                }
            }
            PermissionRequestCodes.PHONE_PERMISSION_REQUEST_CODE -> {
                // Traitez la réponse pour la permission de phone
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission accordée
                    Log.d(TAG, "Permission phone accordée.")
                } else {
                    // Permission refusée
                    Log.d(TAG, "Permission phone refusée.")
                }
            }
            else -> {
                // Gérer d'autres permissions
            }
        }
    }

    private fun setupFlutterFmInitializer() {
        FirebaseMessaging.getInstance().token.addOnCompleteListener { task ->
            if (task.isSuccessful) {
                val token = task.result
                Log.d(TAG, "Token du périphérique: $token")
            } else {
                Log.w(
                    TAG,
                    "Erreur lors de la récupération du token du périphérique",
                    task.exception
                )
            }
        }
    }

    private fun setupPermissionChannel() {
        flutterEngine?.dartExecutor?.let { dartExecutor ->
            MethodChannel(dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "requestNotificationPermission" -> {
                        permissionService.requestPermission<PermissionType>(PermissionType.NOTIFICATION, result)

                        result.success(requestNotificationPermission())
                    }
                    "requestCameraPermission" -> {
                        // Demander la permission caméra
                        permissionService.requestPermission<PermissionType>(PermissionType.CAMERA, result)
                        result.success(requestCameraPermission())  // Ou le résultat réel de la demande
                    }
                    "requestLocationPermission" -> {
                        // Demander la permission location
                        permissionService.requestPermission<PermissionType>(PermissionType.LOCATION, result)
                        result.success(requestLocationPermission())  // Ou le résultat réel de la demande
                    }
                    "requestMicrophonePermission" -> {
                        // Demander la permission microphone
                                  permissionService.requestPermission<PermissionType>(PermissionType.MICROPHONE, result)
                        result.success(requestMicrophonePermission())  // Ou le résultat réel de la demande
                    }
                    "requestStoragePermission" -> {
                        // Demander la permission stockage
                                  permissionService.requestPermission<PermissionType>(PermissionType.STORAGE, result)
                        result.success(requestStoragePermission())  // Ou le résultat réel de la demande
                    }
                    "requestBluetoothPermission" -> {
                        // Demander la permission Bluetooth
                                  permissionService.requestPermission<PermissionType>(PermissionType.BLUETOOTH, result)
                        result.success(requestBluetoothPermission())  // Ou le résultat réel de la demande
                    }
                    "requestContactsPermission" -> {
                        // Demander la permission contacts
                                  permissionService.requestPermission<PermissionType>(PermissionType.CONTACTS, result)
                        result.success(requestContactPermission())  // Ou le résultat réel de la demande
                    }
                    "requestPhonePermission" -> {
                        // Demander la permission phone
                                  permissionService.requestPermission<PermissionType>(PermissionType.PHONE, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestSmsPermission" -> {
                        // Demander la permission sms
                                  permissionService.requestPermission<PermissionType>(PermissionType.SMS, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestCallLogPermission" -> {
                        // Demander la permission call log
                                  permissionService.requestPermission<PermissionType>(PermissionType.CALL_LOG, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestAudioPermission" -> {
                        // Demander la permission read media aural
                                  permissionService.requestPermission<PermissionType>(PermissionType.READ_MEDIA_AURAL, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestVideosPermission" -> {
                        // Demander la permission read media visual
                                  permissionService.requestPermission<PermissionType>(PermissionType.READ_MEDIA_VISUAL, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestActivityRecognitionPermission" -> {
                        // Demander la permission activity recognition
                                  permissionService.requestPermission<PermissionType>(PermissionType.ACTIVITY_RECOGNITION, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestSensorsPermission" -> {
                        // Demander la permission sensors
                                  permissionService.requestPermission<PermissionType>(PermissionType.SENSORS, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestCalendarPermission" -> {
                        // Demander la permission calendar
                                  permissionService.requestPermission<PermissionType>(PermissionType.CALENDAR, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }
                    "requestNearbyDevicesPermission" -> {
                        // Demander la permission nearby devices
                                  permissionService.requestPermission<PermissionType>(PermissionType.NEARBY_DEVICES, result)
                        result.success(true)  // Ou le résultat réel de la demande
                    }

                    else -> result.notImplemented()
                }
            }
        }
    }

    private fun setupFlutterFcmMethodChannel() {

        flutterEngine?.dartExecutor?.let { dartExecutor ->
            MethodChannel(dartExecutor.binaryMessenger, FCMCHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "getAndStoreToken" -> {
                        // Run the function in a coroutine
                        lifecycleScope.launch {
                            try {
                                val token = getAndStoreRegToken()
                                result.success(token)
                            } catch (e: Exception) {
                                result.error("ERROR", "Failed to get or store token", e.message)
                            }
                        }
                    }
                    "logToken" -> {
                        logRegToken()
                        result.success(null)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
        }
    }
    private fun setupFlutterSupabaseMethodChannel() {
        val supabaseUrl = "https://ltcnlgqoeunywzlewydv.supabase.co"
        // Remplacez par votre clé publique
        val supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx0Y25sZ3FvZXVueXd6bGV3eWR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1OTA1OTUsImV4cCI6MjA1NDE2NjU5NX0.K1N1vp8TUxWypnT8o1ImN-hXkRli8OFhXvfMdTfKCrQ"

        supabase = createSupabaseClient(
            supabaseUrl, supabaseKey,
            builder =  {
                install(Auth) {
                    host = "deeplink host"
                    scheme = "deeplink scheme"

                    flowType = FlowType.PKCE

                    alwaysAutoRefresh = true
                    autoLoadFromStorage = true

                    defaultExternalAuthAction = ExternalAuthAction.CustomTabs()
                }
                install(Postgrest) {
                    defaultSchema = "schema" // default: "public"
                    propertyConversionMethod = PropertyConversionMethod.SERIAL_NAME // default: PropertyConversionMethod.CAMEL_CASE_TO_SNAKE_CASE
                }
                install(Realtime) {
                    reconnectDelay = 5.seconds
                }
                install(Storage) {
                    transferTimeout = 90.seconds // Default: 120 seconds
                }
                install(Coil3Integration)
                install(Functions)
            }
        )

        flutterEngine?.dartExecutor?.let { dartExecutor ->
            MethodChannel(dartExecutor.binaryMessenger, SUPACHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "fetchInstruments" -> {
                        // Run the function in a coroutine
                        lifecycleScope.launch {
                            try {
                                val token = fetchInstruments()
                                result.success(token)
                            } catch (e: Exception) {
                                result.error("ERROR", "Failed to get or store token", e.message)
                            }
                        }
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
        }
    }

/*
    private suspend fun setupRealtime()
    {
        val database: Realtime = supabase.realtime

        database.connect()
        database.supabaseClient.from("public:chépaencor")

        database.disconnect()
    }
*/

    private fun requestNotificationPermission(): Boolean {
        return requestPermission(Manifest.permission.POST_NOTIFICATIONS, PermissionRequestCodes.NOTIFICATION_PERMISSION_REQUEST_CODE)
    }

    private fun requestCameraPermission(): Boolean {
        return requestPermission(Manifest.permission.CAMERA, PermissionRequestCodes.CAMERA_PERMISSION_REQUEST_CODE)
    }

    private fun requestBluetoothPermission(): Boolean {
        return requestPermission(Manifest.permission.BLUETOOTH, PermissionRequestCodes.BLUETOOTH_PERMISSION_REQUEST_CODE)
    }

    private fun requestLocationPermission(): Boolean {
        return requestPermission(Manifest.permission.ACCESS_FINE_LOCATION, PermissionRequestCodes.LOCATION_PERMISSION_REQUEST_CODE)
    }

    private fun requestContactPermission(): Boolean {
        return requestPermission(Manifest.permission.READ_CONTACTS, PermissionRequestCodes.CONTACTS_PERMISSION_REQUEST_CODE)
    }

    private fun requestStoragePermission(): Boolean {
        return requestPermission(Manifest.permission.MANAGE_EXTERNAL_STORAGE, PermissionRequestCodes.STORAGE_PERMISSION_REQUEST_CODE)
    }

    private fun requestMicrophonePermission(): Boolean {
        return requestPermission(Manifest.permission.FOREGROUND_SERVICE_MICROPHONE, PermissionRequestCodes.MICROPHONE_PERMISSION_REQUEST_CODE)
    }

    private fun requestPermission(permission: String, permissionCode: Int): Boolean {
        // For Android 13 (API level 33) and above, request POST_NOTIFICATIONS permission
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            // Check if permission is granted
            if (ContextCompat.checkSelfPermission(this, permission) == PackageManager.PERMISSION_GRANTED) {
                true
            } else {
                // Request permission if not granted
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(permission),
                    permissionCode
                )
                false
            }
        } else {
            true // For devices below Android 13, no need to request this permission
        }
    }

    private fun logRegToken() {
        // [START log_reg_token]
        Firebase.messaging.token.addOnCompleteListener { task ->
            if (!task.isSuccessful) {
                Log.w(TAG, "Fetching FCM registration token failed", task.exception)
                return@addOnCompleteListener
            }

            // Get new FCM registration token
            val token = task.result

            // Log and toast
            val msg = "FCM Registration token: $token"
            Log.d(TAG, msg)
            Toast.makeText(baseContext, msg, Toast.LENGTH_SHORT).show()
        }
        // [END log_reg_token]
    }

    private suspend fun fetchInstruments(): List<Instrument> {
        try {
            val response = supabase.from("instruments").select().decodeList<Instrument>()
            Log.d(MyFirebaseMessagingService.Companion.TAG, "Response: $response")

            return response
        } catch (e: Exception) {
            Log.e(MyFirebaseMessagingService.Companion.TAG, "Error getting Supabase registration token", e)
            supabase.close()
            throw e
        }
    }

    private suspend fun getAndStoreRegToken(): String {
        // [START get_store_token]
        val openFirebaseMessagingService = Intent(this, MyFirebaseMessagingService::class.java)
        try {
            startService(openFirebaseMessagingService)
            val token = Firebase.messaging.token.await() // Fetch token
            val deviceToken = hashMapOf(
                "token" to token,
                "timestamp" to FieldValue.serverTimestamp()
            )

            val userId = "myuserid" // Replace with actual user ID
            Firebase.firestore.collection("fcmTokens").document(userId)
                .set(deviceToken).await() // Store token in Firestore
            return token
        } catch (e: Exception) {
            Log.e(MyFirebaseMessagingService.Companion.TAG, "Error getting FCM registration token", e)
            Firebase.firestore.app.removeBackgroundStateChangeListener {
                Log.d(MyFirebaseMessagingService.Companion.TAG, "Background state change listener removed")
                stopService(openFirebaseMessagingService)
            }
            throw e
        }
    }

    private fun getFirebaseData(binaryMessenger: BinaryMessenger) {
        MethodChannel(binaryMessenger, DEFAULT_APP_NAME).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFirebaseData" -> {
                    val request = call.arguments as FirebaseRequest
                    val response = firebaseApi.getFirebaseData(request)
                    result.success(response.toList())
                }
            }
        }
    }

    private fun handleIntentExtras(extras: Bundle?) {
        extras?.let {
            it.keySet().forEach { key ->
                val value = it.getString(key) ?: "Value not found"
                Log.d(TAG, "Key: $key Value: $value")
            }
        }
    }

    private fun setupMethodChannels(binaryMessenger: BinaryMessenger) {
        val myApi = object : Api {
            override fun getUserInfo(): User = User("John Doe", 42)
            override fun signInWithEmail(email: String, password: String): User = User(email, 42)
            override fun getMessage(): MessageData = MessageData("Hello from Kotlin", 42)
            override fun sendMessage(message: MessageData) {
                println("Message reçu: ${message.message}, ${message.value}")
            }
        }

        setupChannel(binaryMessenger, "dev.flutter.pigeon.egote_services_v2.Api", myApi)
        setupChannel(binaryMessenger, "net.nfet.printing", PrintingChannelHandler())
        setupChannel(binaryMessenger, "be.tramckrijte.workmanager", WorkManagerChannelHandler())
        setupFirebaseAuthChannel(binaryMessenger)
    }

    private fun setupChannel(binaryMessenger: BinaryMessenger, channelName: String, handle: Any) {
        MethodChannel(binaryMessenger, channelName).apply {
            setMethodCallHandler { call, result ->
                val methodName = call.method
                val handler = methodHandlers[methodName]
                if (handler != null) {
                    handler(call, result, handle)
                } else {
                    result.notImplemented()
                }
            }
        }
    }

    /**
     * Map des méthodes et de leur gestionnaire.
     */
    private val methodHandlers = mapOf<String, (call: MethodCall, result: MethodChannel.Result, handle: Any) -> Unit>(
        "getMessage" to { _, result, _ -> result.success(myApi.getMessage()) },
        "sendMessage" to { call, result, handle -> handleSendMessage(call, result, myApi) },
        // Vous pouvez ajouter d'autres méthodes ici à mesure que votre API s'étend
        "getUserInfo" to { _, result, _ -> result.success(myApi.getUserInfo()) },
        "signInWithEmail" to { call, result, _ -> handleSignIn(call, result, myApi) }
    )

    private fun handleSendMessage(call: MethodCall, result: MethodChannel.Result, myApi: Api) {
        val message = call.argument<String>("message")
        val value = call.argument<Int>("value")
        if (message != null && value != null) {
            val myMessage = MessageData(message, value)
            myApi.sendMessage(myMessage)
            result.success(message)
        } else {
            result.error("INVALID_ARGUMENT", "Message or value is null", null)
        }
    }

    private fun handleSignIn(call: MethodCall, result: MethodChannel.Result, myApi: Api) {
        val email = call.argument<String>("email")
        val password = call.argument<String>("password")
        if (email != null && password != null) {
            val user = myApi.signInWithEmail(email, password)
            result.success(user)
        } else {
            result.error("INVALID_ARGUMENT", "Email or password is null", null)
        }
    }

    private fun setupFirebaseAuthChannel(binaryMessenger: BinaryMessenger) {
        MethodChannel(binaryMessenger, DEFAULT_APP_NAME).apply {
            setMethodCallHandler { call, result ->
                when (call.method) {
                    "getUserInfo" -> getFirebaseUserInfo(result)
                    "signInWithEmail" -> signInWithEmail(call, result)
                    else -> result.notImplemented()
                }
            }
        }
    }

    /**
     * Crée un objet User à partir de l'objet FirebaseUser.
     */
    private fun getFirebaseUserInfo(result: MethodChannel.Result) {
        val firebaseUser = FirebaseAuth.getInstance().currentUser
        result.success(firebaseUser?.email ?: "No user is signed in")
    }

    private fun signInWithEmail(call: MethodCall, result: MethodChannel.Result) {
        val email = call.argument<String>("email")
        val password = call.argument<String>("password")
        if (email != null && password != null) {
            FirebaseAuth.getInstance().signInWithEmailAndPassword(email, password)
                .addOnCompleteListener { task ->
                    if (task.isSuccessful) {
                        result.success(true)
                    } else {
                        result.success(false)
                    }
                }
        } else {
            result.error("INVALID_ARGUMENT", "Email or password is null", false)
        }
    }

    private fun setupWorkManager() {
        val workManager = WorkManager.getInstance(this)
        workManager.takeIf { requestNotificationPermission() }
    }

    /**
     * Gère les erreurs liées à la tentative de connexion.
     */
    private fun handleSignInError(exception: Exception?, result: MethodChannel.Result) {
        val errorMessage = exception?.localizedMessage ?: "Unknown error"
        result.error("AUTH_ERROR", "Failed to sign in", errorMessage)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger

        setupMethodChannels(binaryMessenger)
        setupWorkManager()

        permissionService = MyPermissionService(MethodChannel(binaryMessenger , CHANNEL))

        getFirebaseData(binaryMessenger)
        Api.setUp(binaryMessenger, ApiImpl())

        // Set up the MethodChannel
        getPlatformVersion()
    }



    companion object {
        internal const val TAG = "MainActivity"
        private const val CHANNEL = "com.godzy.egote_services_v2/permissions"
        private const val FCMCHANNEL = "com.godzy.egote_services_v2/fcm"
        private lateinit var permissionService: MyPermissionService
        private const val SUPACHANNEL = "com.godzy.egote_services_v2/supabase"
        private lateinit var supabase: SupabaseClient
        private const val DEFAULT_APP_NAME = "com.godzy.egote_services_v2/firebase"
        private val myApi: Api = ApiImpl()
        private val firebaseApi : FirebaseApi = FirebaseApiImpl(
            messenger = TODO()
        )

    }

}

// Handler for printing channel
class PrintingChannelHandler : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "printingInfo") {
            val message = mapOf("text" to "printingInfo from Kotlin", "value" to true)
            result.success(message)
        } else {
            result.notImplemented()
        }
    }
}

// Handler for work manager channel
class WorkManagerChannelHandler : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "background_channel_work_manager") {
            val message = mapOf("text" to "background_channel_work_manager from Kotlin", "value" to true)
            result.success(message)
        } else {
            result.notImplemented()
        }
    }
}
