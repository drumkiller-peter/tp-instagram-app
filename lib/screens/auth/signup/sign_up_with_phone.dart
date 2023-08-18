import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_instagram_app/screens/auth/bloc/auth_bloc.dart';
import 'package:tp_instagram_app/screens/auth/login/login_screen.dart';

class SignUpWithPhoneScreen extends StatelessWidget {
  const SignUpWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign up success"),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up with phone"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                controller: context.read<AuthBloc>().phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone number",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                // buildWhen: (previous, current) =>
                //     current is AuthLoading ||
                //     current is AuthInitial ||
                //     current is AuthSuccess,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 72,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(AuthSignUpWithPhoneNumberRequested());
                      },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : const Text("sign up"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
