
import 'package:belfam_ecommerce_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // register method
  void register() async {
    // get auth service
    final authService = AuthService();

    // check if passwords match -> create user
    if (passwordController.text == confirmpasswordController.text) {
      // try create user
      try {
        await authService.SignUpWithEmailPassword(emailController.text, passwordController.text);
      }

      // catch any erros
      catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }

    // if password don't match =>  show error
    else {
    showDialog(
    context: context,
    builder: (context) => const AlertDialog(
    title: Text("Password don't match!"),
    ),
    );
    }

    // if passwords don't match -> show error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo in picture
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(child: Image(image: AssetImage("lib/images/bello.png"),
                height: 180, width: 160,
              )),
            ),

            // message app slogan
            Text("Let's Create an Account for you",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 25),


            // email textField
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
                controller: confirmpasswordController,
                hintText: "Comfirm Password",
                obscureText: true),

            const SizedBox(height: 25),


            // sign up button
            MyButton(
              onTap: register,
              text: "Sign Up",
            ),

            const SizedBox(height: 15),

            // not a member? Register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Already have an account?", style:
                TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login Now", style:
                  TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold)
                  ),
                ),],)
          ],
        ),
      ),
    );
  }
}
