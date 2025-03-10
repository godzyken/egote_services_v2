package com.godzy.egote_services_v2

interface ExampleHostApi {
    fun getMessage() : MessageData
    fun sendMessage(message: MessageData)
}