pluginManagement {

    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
                includeGroupByRegex("io\\.flutter.*")
                includeGroupByRegex("api\\.flutter.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }

}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven {

            url = uri("https://download.flutter.io")
            url = uri("https://jitpack.io")
            url = uri("https://plugins.gradle.org/m2/")
            url = uri("https://api.flutter.dev/")
        }
    }

 /*   versionCatalogs {
        create("libs") {
            plugin("io.flutter.embedding.android.gradle.plugin","android-enableImpeller").version("1.0.0")

        }
    }*/

}

rootProject.name = "egote_services_v2"
include(":app")