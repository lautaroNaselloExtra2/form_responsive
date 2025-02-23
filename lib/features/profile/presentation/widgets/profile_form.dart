import 'package:flutter/cupertino.dart';
import 'package:form_responsive/core/utils/validators/profile_stream_validator.dart';

class ProfileForm extends StatefulWidget {
  final ProfileStreamValidator profileStreamValidator;

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ProfileForm(
      {super.key,
      required this.profileStreamValidator,
      required this.usernameController,
      required this.emailController,
      required this.passwordController});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
              stream: widget.profileStreamValidator.usernameStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      controller: widget.usernameController,
                      keyboardType: TextInputType.name,
                      placeholder: 'Nombre de usuario',
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (userValue) => widget.profileStreamValidator
                          .changeUsername(userValue),
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
              stream: widget.profileStreamValidator.emailStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      controller: widget.emailController,
                      placeholder: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (emailValue) =>
                          widget.profileStreamValidator.changeEmail(emailValue),
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
              stream: widget.profileStreamValidator.passwordStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CupertinoTextField(
                      controller: widget.passwordController,
                      placeholder: 'Password',
                      obscureText: true,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onChanged: (passwordValue) => widget
                          .profileStreamValidator
                          .changePassword(passwordValue),
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
