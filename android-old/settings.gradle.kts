pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("io\\.flutter.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }

    plugins {
        id("com.android.application") version "7.0.4"
        id("com.android.library") version "7.0.4"
        id("com.google.gms.google-services") version "4.4.2"
        id("io.flutter.flutter-plugin") version "1.0.0"
        id("io.flutter")
    }
    resolutionStrategy {
        eachPlugin {
            if (requested.id.namespace == "io.flutter") {
                useModule("io.flutter:flutter_embedding:3.0.0")
            }
        }
    }
}

plugins {
    // Note the use of the flutter-plugin-loader versus reading '.flutter-plugins'
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    //id("com.android.application") version "8.1.0" apply false
    //id("org.jetbrains.kotlin.android") version "1.8.22" apply false
}

dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            (files("gradle/libs.versions.toml"))
        }
    }
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        maven("https://storage.googleapis.com/download.flutter.io")
        maven("https://jitpack.io")
    }

    components {

    }
}


rootProject.name = "egote_services_v2"
include(":app")
rootDir.path "../"
