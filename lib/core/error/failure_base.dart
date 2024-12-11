/// Archivo: failures.dart

// Clase base para todos los fallos.
abstract class FailureBase {
  final String message;

  FailureBase(this.message);
}

/// Fallo relacionado con almacenamiento local.
class LocalStorageFailure extends FailureBase {
  LocalStorageFailure(super.message);
}

/// Fallo relacionado con la red.
class NetworkFailure extends FailureBase {
  NetworkFailure(super.message);
}

/// Fallo genérico o inesperado.
class UnexpectedFailure extends FailureBase {
  UnexpectedFailure(super.message);
}
