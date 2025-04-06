package com.godzy.egote_services_v2

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

/**
 * Wraps the result to be sent to Flutter.
 */
private fun wrapResult(result: Any?): List<Any?> = listOf(result)

/**
 * Wraps an error into a format understood by Flutter.
 */
private fun wrapError(exception: Throwable): List<Any?> {
    return when (exception) {
        is FlutterError -> listOf(exception.code, exception.message, exception.details)
        else -> listOf(
            exception.javaClass.simpleName,
            exception.toString(),
            "Cause: ${exception.cause}, Stacktrace: ${Log.getStackTraceString(exception)}"
        )
    }
}

/**
 * Custom error class to pass error details via PlatformException to Flutter.
 */
class FlutterError(val code: String, override val message: String? = null, val details: Any? = null) : Throwable()

/**
 * Generated class from Pigeon representing data sent in messages.
 */
data class User(val name: String? = null, val age: Long? = null) {
    companion object {
        fun fromList(pigeonVarList: List<Any?>): User {
            val name = pigeonVarList[0] as String?
            val age = pigeonVarList[1] as Long?
            return User(name, age)
        }
    }

    fun toList(): List<Any?> = listOf(name, age)
}

/**
 * Custom Pigeon codec for encoding and decoding User objects.
 */
private open class PigeonCodec : StandardMessageCodec() {
    override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
        return when (type) {
            129.toByte() -> (readValue(buffer) as? List<Any?>)?.let { User.fromList(it) }
            else -> super.readValueOfType(type, buffer)
        }
    }

    override fun writeValue(stream: ByteArrayOutputStream, value: Any?) {
        when (value) {
            is User -> {
                stream.write(129)
                writeValue(stream, value.toList())
            }
            else -> super.writeValue(stream, value)
        }
    }
}

/**
 * Interface representing the API to handle messages from Flutter.
 */
interface Api {

    // User-related methods
    fun getUserInfo(): User
    fun signInWithEmail(email: String, password: String): User?

    // Message-related methods
    fun getMessage(): MessageData
    fun sendMessage(message: MessageData)

    companion object {
        /** The codec used by Api. */
        val codec: MessageCodec<Any?> = PigeonCodec()

        /** Sets up an instance of `Api` to handle messages through the `binaryMessenger`. */
        @JvmOverloads
        fun setUp(binaryMessenger: BinaryMessenger, api: Api?, messageChannelSuffix: String = "") {
            val suffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""

            // Helper function to set up a message channel
            fun setMessageChannel(channelName: String, handler: (Any?, (Any?) -> Unit) -> Unit) {
                val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.egote_services_v2.Api.$channelName$suffix", codec)
                api?.let {
                    channel.setMessageHandler { message, reply -> handler(message, reply::reply) }
                } ?: channel.setMessageHandler(null)
            }

            // Setting up getUserInfo
            setMessageChannel("getUserInfo") { _, reply ->
                val wrapped = try {
                    wrapResult(api?.getUserInfo())
                } catch (exception: Throwable) {
                    wrapError(exception)
                }
                reply(wrapped)
            }

            // Setting up signInWithEmail
            setMessageChannel("signInWithEmail") { message, reply ->
                val args = message as List<Any?>
                val email = args[0] as String
                val password = args[1] as String
                val wrapped = try {
                    wrapResult(api?.signInWithEmail(email, password))
                } catch (exception: Throwable) {
                    wrapError(exception)
                }
                reply(wrapped)
            }

            // Additional channels can be set up similarly
            setMessageChannel("getMessage") { _, reply ->
                val wrapped = try {
                    wrapResult(api?.getMessage())
                } catch (exception: Throwable) {
                    wrapError(exception)
                }
                reply(wrapped)
            }

            setMessageChannel("sendMessage") { message, reply ->
                val args = message as List<Any?>
                val messageData = args[0] as MessageData
                try {
                    api?.sendMessage(messageData)
                    reply(wrapResult(null))
                } catch (exception: Throwable) {
                    reply(wrapError(exception))
                }
            }
        }
    }
}
