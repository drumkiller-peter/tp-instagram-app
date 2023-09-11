// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_instagram_app/screens/auth/bloc/auth_bloc.dart';
import 'package:tp_instagram_app/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login success"),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                controller: context.read<AuthBloc>().emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                controller: context.read<AuthBloc>().passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) =>
                    current is AuthLoading ||
                    current is AuthInitial ||
                    current is AuthSuccess,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 72,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLoginRequested());
                      },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : const Text("Login"),
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
