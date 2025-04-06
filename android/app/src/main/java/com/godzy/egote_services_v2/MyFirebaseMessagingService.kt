package com.godzy.egote_services_v2

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.media.RingtoneManager
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.work.OneTimeWorkRequest
import androidx.work.WorkManager
import androidx.work.Worker
import androidx.work.WorkerParameters
import com.google.firebase.Firebase
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import com.google.firebase.messaging.messaging
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MyFirebaseMessagingService : FirebaseMessagingService() {


/*    override fun onBind(intent: Intent): IBinder {
        try {
            sendNotification(
                messageBody = intent.getStringExtra("message") ?: "No message received",
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error sending notification", e)
            throw e
        }
        Log.d(TAG, "Received intent: $intent")


        return TODO("Provide the return value")
    }*/
    // [START receive_message]
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        // TODO(developer): Handle FCM messages here.
        // Not getting messages here? See why this may be: https://goo.gl/39bRNJ
        Log.d(TAG, "From: ${remoteMessage.from}")

        // Check if message contains a data payload.
        if (remoteMessage.data.isNotEmpty()) {
            Log.d(TAG, "Message data payload: ${remoteMessage.data}")

            // Check if data needs to be processed by long running job
            if (needsToBeScheduled()) {
                val message = remoteMessage.data["message"]
                Log.d(TAG, "Message received: $message")
                sendNotification(message ?: "No message received")
                // For long-running tasks (10 seconds or more) use WorkManager.
                scheduleJob()
            } else {
                // Handle message within 10 seconds
                handleNow()
            }
        }

        // Check if message contains a notification payload.
        remoteMessage.notification?.let {
            Log.d(TAG, "Message Notification Body: ${it.body}")
            val messageBody = it.body ?: "No message body received"
            sendNotification(messageBody)
        }

    }
    // [END receive_message]
    private fun needsToBeScheduled() = true

    // [START on_new_token]
    /**
     * Called if the FCM registration token is updated. This may occur if the security of
     * the previous token had been compromised. Note that this is called when the
     * FCM registration token is initially generated so this is where you would retrieve the token.
     */
    override fun onNewToken(token: String) {
        Log.d(TAG, "Refreshed token: $token")

        // If you want to send messages to this application instance or
        // manage this apps subscriptions on the server side, send the
        // FCM registration token to your app server.
        sendRegistrationToServer(token)

    }
    // [END on_new_token]

    private fun scheduleJob() {
        // [START dispatch_job]
        val work = OneTimeWorkRequest.Builder(MyWorker::class.java)
            .build()
        WorkManager.getInstance(this)
            .beginWith(work)
            .enqueue()
        // [END dispatch_job]
    }

    private fun handleNow() {
        Log.d(TAG, "Short lived task is done.")
    }

    private fun sendRegistrationToServer(token: String?) {
        Log.d(TAG, "sendRegistrationTokenToServer($token)")

        token?.let {

            CoroutineScope(Dispatchers.IO).launch {
                try {
                    val response = Firebase.messaging.subscribeToTopic(it)

                    if (response.isSuccessful) {

                        Log.d(TAG, "Token envoyé avec succès au serveur")
                    } else {
                        Log.w(TAG, "Échec de l'envoi du token au serveur: ${response.exception}")
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Erreur lors de l'envoi du token au serveur", e)
                    throw e
                }
            }
        }

    }

    private fun sendNotification(messageBody: String) {
        val intent = Intent(this, MainActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
        val requestCode = 0
        val pendingIntent = PendingIntent.getActivity(
            this,
            requestCode,
            intent,
            PendingIntent.FLAG_IMMUTABLE,
        )

        val channelId = "fcm_default_channel"
        val defaultSoundUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)
        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("FCM Message")
            .setContentText(messageBody)
            .setAutoCancel(true)
            .setSound(defaultSoundUri)
            .setContentIntent(pendingIntent)

        val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        // Since android Oreo notification channel is needed.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Channel human readable title",
                NotificationManager.IMPORTANCE_DEFAULT,
            ).apply {
                description = "Channel for FCM notifications"
            }
            notificationManager.createNotificationChannel(channel)
        }

        val notificationId = System.currentTimeMillis().toInt()
        notificationManager.notify(notificationId, notificationBuilder.build())
    }

  /*  fun runtimeEnableAutoInit() {
        // [START fcm_runtime_enable_auto_init]
        Firebase.messaging.isAutoInitEnabled = true
        // [END fcm_runtime_enable_auto_init]
    }

    fun sendUpstream() {
        val token = Firebase.messaging.token.result
        val SENDER_ID = "YOUR_SENDER_ID"
        val messageId = 0 // Increment for each
        // [START fcm_send_upstream]
        try {

            val message = RemoteMessage.Builder(token)
                .setMessageId(messageId.toString())
                .addData(SENDER_ID, "Hello from Android!")
                .addData("message", "Say Hello!")
                .build()


            Firebase.messaging.send(message)

        } catch (e: Exception) {
            Log.e(TAG, "Error sending upstream message", e)
            throw e
        }
        // [END fcm_send_upstream]
    }

    fun subscribeTopics() {
        // [START subscribe_topics]
        Firebase.messaging.subscribeToTopic("chat")
            .addOnCompleteListener { task ->
                var msg = "Subscribed"
                if (!task.isSuccessful) {
                    msg = "Subscribe failed"
                }
                Log.d(MainActivity.Companion.TAG, msg)
                Toast.makeText(baseContext, msg, Toast.LENGTH_SHORT).show()
            }
        // [END subscribe_topics]
    }
*/

    internal class MyWorker(appContext: Context, workerParams: WorkerParameters) : Worker(appContext, workerParams) {
        override fun doWork(): Result {
            // TODO(developer): add long running task here.
            Log.d(TAG, "Performing long running task in scheduled job")
            // TODO(developer): add long running task here.

            try {

                Thread.sleep(1000)
            } catch (e: InterruptedException) {
                Log.e(TAG, "Error performing long running task", e)
            }
            return Result.success()
        }
    }

    companion object {
        internal const val TAG = "MyFirebaseMsgService"
    }
}
