import 'package:dio_pract/feature/registeration/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/validator.dart';
import '../../category/view/screen/home_screen.dart';
import '../cubit/cubit/register_cubit.dart';
import '../cubit/cubit/register_state.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<RegisterCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.indigoAccent,
              content: Text(state.userData["message"]),
            ));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: loginFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    label: const Text("Email"),
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                  ),
                  CustomTextField(
                    obscureText: visible,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: Icon(visible ? Icons.visibility_off : Icons.remove_red_eye),
                    ),
                    controller: passwordController,
                    label: const Text("Password"),
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.password),
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        context.read<RegisterCubit>().loginCubit(
                          nameData: emailController.text,
                          passwordData: passwordController.text,
                        );
                      }
                    },
                    child: const Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text("Don't have an account? Sign up", style: TextStyle(color: Colors.blue)),
                  ),
                  if (state is LoginLoad) const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
