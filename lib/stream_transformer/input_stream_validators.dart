import 'dart:async';

import 'package:form_responsive/core/constants/app_strings.dart';

class InputStreamValidators {
  static StreamTransformer<String, String> isNotEmpty() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (field, sink) {
      if (field.isEmpty) {
        sink.add('');
        sink.addError(AppStrings.requiredField);
      } else {
        sink.add(field);
      }
    });
  }

  static StreamTransformer<String, String> validateEmail() {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if (!emailRegex.hasMatch(email)) {
          // Caso: Formato inválido
          sink.addError(AppStrings.invalidEmail); // Indica el error
        } else {
          // Caso: Email válido
          sink.add(email); // Envía el valor válido
        }
      },
    );
  }

  static StreamTransformer<String, String> minLength(int length) {
    return StreamTransformer<String, String>.fromHandlers(
      handleData: (text, sink) {
        if (text.length < length) {
          sink.add('');
          sink.addError(AppStrings.validateCount);
        } else {
          sink.add(text);
        }
      },
    );
  }
}
