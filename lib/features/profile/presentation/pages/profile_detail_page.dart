import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_responsive/core/constants/app_styles.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_event.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_state.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(GetProfileEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Perfil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded && state.user != null) {
            final User? user = state.user;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Nombre de Usuario:', user!.username),
                  const SizedBox(height: 16),
                  _buildDetailRow('Correo Electrónico:', user.email),
                  const SizedBox(height: 16),
                  _buildDetailRow('Contraseña:', user.password),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(
                'Error: ${state.messageError}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('No hay datos disponibles'),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.bodyText,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: AppStyles.bodyText,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
