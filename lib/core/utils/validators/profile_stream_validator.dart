import 'package:form_responsive/stream_transformer/input_stream_validators.dart';
import 'package:rxdart/rxdart.dart';

class ProfileStreamValidator {
  final usernameController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();

  Stream<String> get emailStream => emailController.stream
      .transform(InputStreamValidators.isNotEmpty())
      .transform(InputStreamValidators.validateEmail());
  Stream<String> get usernameStream =>
      usernameController.stream.transform(InputStreamValidators.isNotEmpty());
  Stream<String> get passwordStream => passwordController.stream
      .transform(InputStreamValidators.isNotEmpty())
      .transform(InputStreamValidators.minLength(6));
  Stream<bool> get profileSaveStream =>
      Rx.combineLatest3(usernameStream, passwordStream, emailStream, (a, b, c) {
        return a != '' && b != '' && c != '';
      }).startWith(true);

  Function(String) get changeUsername => usernameController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;
  Function(String) get changeEmail => emailController.sink.add;

  String get user => usernameController.value;
  String get pass => passwordController.value;
  String get email => emailController.value;

  void closeStream() {
    usernameController.close();
    passwordController.close();
    emailController.close();
  }
}
