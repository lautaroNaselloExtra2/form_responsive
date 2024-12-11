import 'package:flutter/cupertino.dart';
import 'package:form_responsive/core/utils/validators/profile_stream_validator.dart';

class ProfileForm extends StatelessWidget {
  final ProfileStreamValidator profileStreamValidator;
  const ProfileForm({super.key, required this.profileStreamValidator});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
              stream: profileStreamValidator.usernameStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      keyboardType: TextInputType.name,
                      placeholder: 'Nombre de usuario',
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (userValue) =>
                          profileStreamValidator.changeUsername(userValue),
                    ),
                    if (snapshot.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(
                              color: CupertinoColors.destructiveRed),
                        ),
                      ),
                  ],
                );
              }),
          const SizedBox(height: 16),
          StreamBuilder(
              stream: profileStreamValidator.emailStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      placeholder: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (emailValue) =>
                          profileStreamValidator.changeEmail(emailValue),
                    ),
                    if (snapshot.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(
                              color: CupertinoColors.destructiveRed),
                        ),
                      ),
                  ],
                );
              }),
          const SizedBox(height: 16),
          StreamBuilder(
              stream: profileStreamValidator.passwordStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      placeholder: 'Password',
                      obscureText: true,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (passwordValue) =>
                          profileStreamValidator.changePassword(passwordValue),
                    ),
                    if (snapshot.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(
                              color: CupertinoColors.destructiveRed),
                        ),
                      ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
