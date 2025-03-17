package com.godzy.egote_services_v2

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private  val TAG = "MainActivity"
    private  val CHANNEL = "egote_services_v2"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        WorkManager.initialize(this, Configuration.Builder().build())
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger

        val myApi = object : ExampleHostApi {
            override fun getMessage() : MessageData {
                return MessageData("Hello from kotlin", 42)
            }

            override fun sendMessage(message: MessageData) {
                // Traitement du message reçu
                println("Message reçu: ${message.message}, ${message.value}")
            }

        }

        if (true) {
            MethodChannel(binaryMessenger, CHANNEL).apply {
                setMethodCallHandler { call, result ->
                    if (call.method == "getMessage") {
                        // Create a custom message to send back to Flutter
                        val message = mapOf("text" to "Hello from Kotlin", "value" to 42)
                        result.success(message)
                    } else {
                        result.notImplemented()
                    }

                    when(call.method) {
                        "getMessage" -> {
                            result.success(myApi.getMessage())
                        }
                        "sendMessage" -> {
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
                        else -> result.notImplemented()
                        }

                }
            }

            MethodChannel(flutterEngine.dartExecutor, "net.nfet.printing").apply {
                setMethodCallHandler { call, result ->
                    if (call.method == "printingInfo") {
                        // Create a custom message to send back to Flutter
                        val message = mapOf("text" to "printingInfo from Kotlin", "value" to true)
                        result.success(message)
                    } else {
                        result.notImplemented()
                    }

                    when (call.method) {
                        "printingInfo" -> {
                            result.success(true)
                        }
                        else -> result.notImplemented()
                        }
                    }
            }
        } else {
            throw IllegalStateException("flutterEngine or Binary messenger is null")
        }

    }
}
