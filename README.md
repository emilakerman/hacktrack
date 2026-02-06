A Flutter package for integrating HackTrack error and event tracking into Flutter applications.

Example Usage in Flutter/Dart in main.dart:
Email and uid is optional among other params. Decide yourself what you want to log.

```dart
 if (!kDebugMode) {
   final prefs = await SharedPreferences.getInstance();

   PlatformDispatcher.instance.onError = (error, stack) {
     HackTrack.logError(
       message: "$error",
       level: "error",
       stackTrace: "$stack",
       userEmail: (prefs.getString("userEmail") ?? "N/A").toString(),
       userUid: "N/A",
       // Pass both of these in via environment variables. 
       // Available in the Integration Guide in HackTrack web portal.
       apiKey: "",
       apiUrl: "",
     );
     return true;
   };
 }
```
