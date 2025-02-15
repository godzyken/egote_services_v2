# LineNumberTable is needed otherwise the mapping file will be discarded.
-keepattributes LineNumberTable,SourceFile

-keep class io.flutter.embedding.android.FlutterActivity
-keep class androidx.core.app.CoreComponentFactory
-keep class io.flutter.plugins.GeneratedPluginRegistrant

#-dontwarn androidx.window.extensions.**
#-dontwarn androidx.window.extensions.embedding.**
#-dontwarn androidx.window.sidecar.**