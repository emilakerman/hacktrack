import "dart:convert";
import "package:http/http.dart" as http;

class HackTrack {
  static Future<void> logError({
    required String message,
    required String apiUrl,
    required String apiKey,
    String level = "error",
    String? stackTrace,
    String? userId,
    String? userEmail,
    Map<String, dynamic>? deviceInfo,
    String? appVersion,
  }) async {
    try {
      await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json", "x-api-key": apiKey},
        body: jsonEncode({
          "level": level,
          "message": message,
          "stack_trace": stackTrace,
          "user_uid": userId,
          "user_email": userEmail,
          "device_info": deviceInfo,
          "app_version": appVersion,
        }),
      );
    } catch (e) {
      // Silently fail - don't crash the app for logging errors
    }
  }
}

// Example Usage in Flutter/Dart in main.dart:
//
// Email and uid is optional among other params. Decide yourself what you want to log.
//
// if (!kDebugMode) {
//   final prefs = await SharedPreferences.getInstance();

//   PlatformDispatcher.instance.onError = (error, stack) {
//     HackTrack.logError(
//       message: "$error",
//       level: "error",
//       stackTrace: "$stack",
//       userEmail: (prefs.getString("userEmail") ?? "N/A").toString(),
//       userUid: "N/A",
//       // Pass both of these in via environment variables. Available in Integration Guide in HackTrack web portal
//       apiKey: "",
//       apiUrl: "",
//     );
//     return true;
//   };
// }
