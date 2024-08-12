import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheckerHelper {
  static Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        (await Connectivity().checkConnectivity()) as ConnectivityResult;
    return handleResult(connectivityResult);
  }

  static Stream<ConnectivityResult> listenToConnectivityChanged() async* {
    await for (List<ConnectivityResult> results
        in Connectivity().onConnectivityChanged) {
      for (ConnectivityResult result in results) {
        yield result;
      }
    }
  }

  static handleResult(ConnectivityResult connectivityResult) {
    final bool connected;
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      connected = true;
    } else {
      connected = false;
    }

    return connected;
  }
}
