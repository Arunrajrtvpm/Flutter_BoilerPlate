class NetworkConfig {
  static const isProduction = false;
  static const baseURL = isProduction ? prodUrl : devUrl;
  static const devUrl = "https://.............../";
  static const prodUrl = "https://.............../";

  static const signUpURL = "https://...............";
  static const login = "/.../login";
  static const home = "/.../home/";
}
