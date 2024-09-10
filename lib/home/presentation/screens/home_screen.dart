import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_swap/login/domain/login_repository_impl.dart';
import 'package:plant_swap/utils/api_service/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
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
            onPressed: () async {
              await LoginRepositoryImpl().signUp(
                email: emailController.text,
                password: passwordController.text,
                firstName: firstNameController.text,
                lastName: lastNameController.text,
              );
            },
            child: const Text('Sign Up'),
          ),

        ],
      ),
    );
  }
}
