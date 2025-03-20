import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static const platform =
      MethodChannel('com.godzy.egote_services_v2.permissions');

  late final PermissionWithService permissionWithService;
  late final Permission permission;

  PermissionService() : super();

  Future<PermissionStatus> getStatusPermissionWithService(
      PermissionWithService permissionWithService) async {
    try {
      await Future.delayed(Duration(seconds: 1));

      final status = await permissionWithService.request();
      switch (status) {
        case PermissionStatus.granted:
          developer.log(
              '${permissionWithService.toString()} Permission granted: ${status.toString()}');
          return status;
        case PermissionStatus.denied:
          developer.log(
              '${permissionWithService.toString()} Permission denied: ${status.toString()}');
          return status;
        case PermissionStatus.restricted:
          developer.log(
              '${permissionWithService.toString()} Permission restricted: ${status.toString()}');
          return status;
        case PermissionStatus.limited:
          developer.log(
              '${permissionWithService.toString()} Permission limited: ${status.toString()}');
          return status;
        case PermissionStatus.permanentlyDenied:
          developer.log(
              '${permissionWithService.toString()} Permission permanently denied: ${status.toString()}');
          return status;
        case PermissionStatus.provisional:
          developer.log(
              '${permissionWithService.toString()} Permission provisional: ${status.toString()}');
          return status;
      }
    } on PlatformException catch (e) {
      developer.log("Failed to get ${permission.value}: '${e.message}'.");
      PlatformException(
          code: e.code,
          message: e.message,
          details: e.details,
          stacktrace: e.stacktrace);
      return PermissionStatus.denied;
    }
  }

  Future<bool> requestPermissionWithServiceHandler(
      PermissionWithService permissionWithService) async {
    try {
      // Vérifier que la méthode existe avant d'appeler la méthode native
      final permissionMethod =
          'request${permissionWithService.value}Permission';

      // Vous pouvez valider ici si la méthode existe avant de faire l'appel
      if (!await _isMethodAvailable(permissionMethod)) {
        throw PlatformException(
            code: 'METHOD_NOT_FOUND',
            message: 'Method $permissionMethod not found');
      }

      // Appel de la méthode native via MethodChannel
      final bool result =
          await platform.invokeMethod(permissionMethod, permissionWithService);

      // Vérification de la réponse
      if (result) {
        developer.log("${permissionWithService.value} granted");
        return permissionWithService.isGranted;
      } else {
        developer.log("${permissionWithService.value} denied");
        return permissionWithService.isDenied;
      }
    } on PlatformException catch (e) {
      // Gestion des erreurs si la méthode native échoue
      developer.log(
        "Failed to request ${permissionWithService.value} permission: '${e.message}'",
        error: e,
      );
      return permissionWithService.isDenied;
    } catch (e) {
      // Gestion des erreurs inattendues
      developer.log(
          "Unexpected error requesting ${permissionWithService.value} permission: $e");
      return permissionWithService.isDenied;
    }
  }

  Future<bool> _isMethodAvailable(String method) async {
    try {
      await platform.invokeMethod(
          method, null); // Vous pouvez envoyer `null` ou un paramètre vide ici
      return true; // La méthode existe
    } on PlatformException {
      return false; // La méthode n'existe pas
    }
  }

  Future<bool> requestPermissionHandler(Permission permission) async {
    try {
      final bool result = await platform.invokeMethod(
          'request${permission.value}Permission', permission);
      if (result) {
        developer.log("${permission.value} granted");
        return permission.isGranted;
      } else {
        developer.log("${permission.value} denied");
        return permission.isDenied;
      }
    } on PlatformException catch (e) {
      developer.log(
        "Failed to get ${permission.value}: '${e.message}'.",
        error: e,
        stackTrace: StackTrace.fromString(e.stacktrace!),
      );
      return permission.isDenied;
    }
  }

  Future<PermissionStatus?> requestPermissionWithService(
      List<PermissionWithService> permissions) async {
    try {
      for (final n in permissions) {
        await Future.delayed(Duration(seconds: 1));
        return await getStatusPermissionWithService(n);
      }
    } on PlatformException catch (e) {
      developer.log(
        "Failed to get ${permission.value}: '${e.message}'.",
        error: e,
        stackTrace: StackTrace.fromString(e.stacktrace!),
      );
      return null;
    }
    return null;
  }
}
