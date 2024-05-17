import java.io.FileInputStream
import java.nio.file.Files
import java.util.Properties

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties").toPath()
if (Files.exists(localPropertiesFile)) {
    Files.newBufferedReader(localPropertiesFile).use { reader ->
        localProperties.load(reader)
    }
}

val flutterRoot = localProperties.getProperty("flutter.sdk")
    ?: throw GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val flutterProjectRoot = rootProject.projectDir.parentFile
val pluginFile = File(flutterProjectRoot, ".flutter-plugins-dependencies")
if (!pluginFile.exists()) {
    pluginFile.bufferedReader(Charsets.UTF_8).use { reader ->
        plugins.getPlugin(reader.toString())
    }
}
//plugins.forEach { name, path -> val pluginDirectory = flutterProjectRoot.resolve(path).resolve("android") }
//
//val obj = JsonSlurper().parseText(pluginFile.toString())
// Includes the Flutter plugins that support the Android platform.

plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.jetbrains.kotlin.android)
//    alias(libs.plugins.fabric)
//    alias(libs.plugins.com.android.library)
}

android {
    namespace = "com.godzy.egote_services_v2"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.godzy.egote_services_v2"
        minSdk = 28
        targetSdk = 34
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        signingConfig = signingConfigs.getByName("debug")

        ndk {
            // Filter for architectures supported by Flutter.
            abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
        }
        multiDexEnabled = true
        vectorDrawables.useSupportLibrary = true
        javaCompileOptions {
            annotationProcessorOptions {
                arguments["room.schemaLocation"] = "$projectDir/schemas"
            }
        }
        buildFeatures {
            viewBinding = true
        }
        manifestPlaceholders.clear()
        manifestPlaceholders["flutter"] = flutterRoot
        manifestPlaceholders["flutter_version_code"] = flutterVersionCode
        manifestPlaceholders["flutter_version_name"] = flutterVersionName
        manifestPlaceholders["keystore_properties"] = keystoreProperties.toString()
        manifestPlaceholders["keystore_properties_file"] = keystorePropertiesFile.toString()
        manifestPlaceholders["keystore_properties_file_exists"] = keystorePropertiesFile.exists().toString()
        manifestPlaceholders["auth0Domain"] = "godzy.eu.auth0.com"
    }
    signingConfigs {
        getByName("debug") {
            storeFile =
                file("keystoreProperties[\'storeFile\'] ? file(keystoreProperties[\'storeFile\']) : null")
            storePassword = "keystoreProperties[\'storePassword\']"
            keyAlias = "keystoreProperties[\'keyAlias\']"
            keyPassword = "keystoreProperties[\'keyPassword\']"
        }
    }
    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            applicationIdSuffix = ".debug"
        }

        create("profile") {
            initWith(getByName("debug"))
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
            res.srcDirs("src/main/res")
            manifest.srcFile("src/main/AndroidManifest.xml")

        }
        getByName("test") {
            java.srcDirs("src/test/kotlin")
        }
        getByName("androidTest") {
            java.srcDirs("src/androidTest/kotlin")
            setRoot("src/androidTest/kotlin")
        }
    }
    ndkVersion = "27.0.11718014 rc1"

    packaging {
        dex {
            useLegacyPackaging = false
        }
    }
}

dependencies {

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.androidx.vectordrawable)
    implementation(libs.material)
    /*   implementation(platform(libs.firebase.bom))
       implementation(libs.firebase.core)
       implementation(libs.firebase.messaging.ktx)
       implementation(libs.firebase.database.ktx)
       implementation(libs.firebase.firestore.ktx)
       implementation(libs.firebase.auth.ktx)
       implementation(libs.compose.auth)*/
    implementation(libs.fabric)
    implementation(libs.annotations)
    implementation(libs.com.android.library.gradle.plugin)
//    implementation(libs.flutter)
    implementation(libs.kotlin.compiler.embeddable)
    implementation(libs.androidx.lifecycle.common)
    implementation(libs.engine)
    implementation(libs.asset.delivery.ktx)
    implementation(libs.androidx.work.runtime)
    implementation(libs.androidx.work.runtime.ktx)
    implementation(libs.androidx.work.rxjava3)
    implementation(libs.androidx.work.gcm)
    implementation(libs.androidx.work.multiprocess)
    implementation(libs.androidx.work.testing)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
//    implementation(libs.flutter.engine.dart)
}

