import 'package:pigeon/pigeon.dart';

enum Code { one, two }

class MessageData {
  MessageData({required this.code, required this.data});
  String? name;
  String? description;
  Code code;
  Map<String?, String?> data;
}

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/config/pigeon/dart_api.g.dart',
  dartOptions: DartOptions(),
  cppOptions: CppOptions(namespace: 'egote_services_v2'),
  cppHeaderOut: 'windows/runner/dart_api.g.h',
  cppSourceOut: 'windows/runner/dart_api.g.cpp',
  kotlinOut:
      'android/app/src/main/kotlin/com/godzy/egote_services_v2/dart_api.g.kt',
  kotlinOptions: KotlinOptions(),
  javaOut: 'android/app/src/main/java/io/flutter/plugins/Messages.java',
  javaOptions: JavaOptions(package: 'com.godzy.egote_services_v2'),
  swiftOut: 'ios/Runner/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  objcHeaderOut: 'macos/Runner/messages.g.h',
  objcSourceOut: 'macos/Runner/messages.g.m',
  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  objcOptions: ObjcOptions(prefix: 'PGN'),
  //copyrightHeader: 'godzy/copyright.txt',
  dartPackageName: 'egote_services_v2',
))
@HostApi()
abstract class ExampleHostApi {
  String getHostLanguage();

  // These annotations create more idiomatic naming of methods in Objc and Swift.
  @ObjCSelector('addNumber:toNumber:')
  @SwiftFunction('add(_:to:)')
  int add(int a, int b);

  @async
  bool sendMessage(MessageData message);

  @async
  List<MessageData?> search(String keyword);
}
