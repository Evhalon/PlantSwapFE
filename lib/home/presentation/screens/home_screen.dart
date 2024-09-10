import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_swap/home/presentation/bloc/sign_up_bloc_cubit.dart';
import 'package:plant_swap/login/domain/login_repository_impl.dart';
import 'package:plant_swap/utils/routes/routes_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBlocCubit(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    return BlocConsumer<SignUpBlocCubit, ApiState>(
      listener: (context, state) {
        switch (state) {
          case ApiSuccessState<bool>():
            if (state.data) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteConstantsPath.login, (_) => false);
            }
          case ApiErrorState():
            showDialog(
              context: context,
              builder: (context) => const Dialog(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Errore durante la registrazione!"),
                ),
              ),
            );
          default:
            return;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //sign up form button
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                controller: emailController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                controller: passwordController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
                controller: firstNameController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
                controller: lastNameController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.read<SignUpBlocCubit>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                    ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        );
      },
    );
  }
}
