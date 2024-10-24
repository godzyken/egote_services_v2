package com.godzy.egote_services_v2

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        Messages.ExampleHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, DartAPIImpl())
    }
}

class DartAPIImpl : Messages.ExampleHostApi {
    override fun getHostLanguage(): String {
        TODO("Not yet implemented")
    }

    override fun sendMessage(message: Messages.MessageData, result: Messages.Result<Boolean>) {
        TODO("Not yet implemented")
    }

    @OptIn(DelicateCoroutinesApi::class)
    override fun search(
        keyword: String,
        result: Messages.Result<MutableList<Messages.MessageData>>
    ) {
        GlobalScope.launch {
            delay(1000)

            result?.success(
                mutableListOf(
                    Messages.MessageData.Builder().setCode(Messages.Code.ONE).setName("test 1")
                        .setDescription("test 1 start").build(),
                    Messages.MessageData.Builder().setCode(Messages.Code.TWO).setName("test 2")
                        .setDescription("test 2 start").build(),
                    Messages.MessageData.Builder().setCode(Messages.Code.ONE).setName("test 3")
                        .setDescription("test 1 restart").build()
                )
            )
        }

    }

    override fun add(a: Long, b: Long): Long {
        TODO("Not yet implemented")
    }
}