enum ManagerType { profiloDispoSecError, loginMobileError, loginWebError }

abstract class ErrorManager<T, C> {
  late C cubit;
  bool manageError(T response, {bool isDemoUser = false});
}
