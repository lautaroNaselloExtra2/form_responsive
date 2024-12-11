import 'package:flutter/material.dart';
import 'package:form_responsive/core/constants/app_styles.dart';
import 'package:form_responsive/core/utils/validators/profile_stream_validator.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ProfileStreamValidator profileStreamValidator;

  const ProfileButton({
    super.key,
    required this.onPressed,
    required this.profileStreamValidator,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: profileStreamValidator.profileSaveStream,
        builder: (context, snapshot) {
          final hasErrors = snapshot.hasError && snapshot.data != null;
          return ElevatedButton(
            onPressed: !hasErrors ? onPressed : null,
            style: !hasErrors
                ? AppStyles.activeButtonStyle
                : AppStyles.disabledButtonStyle,
            child: const Text(
              'Guardar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        });
  }
}
