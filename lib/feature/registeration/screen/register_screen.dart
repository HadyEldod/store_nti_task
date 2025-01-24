import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/validator.dart';
import '../../category/view/screen/home_screen.dart';
import '../cubit/cubit/register_cubit.dart';
import '../cubit/cubit/register_state.dart';
import '../model/register_model.dart';
import '../widget/custom_text_field.dart';
import '../widget/gender.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthData data = AuthData();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> registered = GlobalKey<FormState>();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: state.userData["status"] == "success"
                      ? Colors.indigoAccent
                      : Colors.red,
                  content: Text(state.userData["message"]),
                ),
              );
              if (state.userData["status"] == "success") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: registered,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: nameController,
                            label: const Text("Name"),
                            hintText: 'Enter your name',
                            prefixIcon: const Icon(Icons.person),
                            validator: MyValidators.displayNameValidator,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: emailController,
                            label: const Text("Email"),
                            hintText: 'Enter your email',
                            prefixIcon: const Icon(Icons.mail),
                            validator: MyValidators.emailValidator,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: phoneController,
                            label: const Text("Phone"),
                            hintText: 'Enter your phone number',
                            prefixIcon: const Icon(Icons.phone),
                            validator: MyValidators.phoneValidator,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: nationalIdController,
                            label: const Text("National ID"),
                            hintText: 'Enter your ID',
                            prefixIcon: const Icon(Icons.card_membership),
                            validator: MyValidators.nationalIdValidator,
                          ),
                          const SizedBox(height: 10),
                          GenderSelection(genderController: genderController),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: passwordController,
                            obscureText: visible,
                            label: const Text("Password"),
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock),
                            validator: MyValidators.passwordValidator,
                            suffix: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (registered.currentState!.validate()) {
                                context.read<RegisterCubit>().postDataCubit(
                                  nameData: nameController.text,
                                  emailData: emailController.text,
                                  phoneData: phoneController.text,
                                  nationalIdData: nationalIdController.text,
                                  genderData: genderController.text,
                                  passwordData: passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Already have an account? Login",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state is LoginLoad)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
