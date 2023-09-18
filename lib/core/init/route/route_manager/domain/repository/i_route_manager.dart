abstract class IRouteManager {
  Future<dynamic> page(String routeName, {Object? argument, bool rootNavigator, bool controlLogin});
  dynamic back({Object? argument});
}
