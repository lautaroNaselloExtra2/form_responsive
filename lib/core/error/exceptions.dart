class AppException implements Exception {
  final String message;

  AppException(this.message);
}

// Excepcion errores almacenamiento local.
class LocalStorageException extends AppException {
  LocalStorageException(super.message);
}

// Excepcion errores relacionados con la red
class NetworkException extends AppException {
  NetworkException(super.message);
}

// Excepcion errores genéricos
class UnexpectedException extends AppException {
  UnexpectedException(super.message);
}
