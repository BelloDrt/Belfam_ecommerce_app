import 'package:belfam_ecommerce_app/components/my_button.dart';
import 'package:belfam_ecommerce_app/components/my_textfield.dart';
import 'package:belfam_ecommerce_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  final void Function()? onTap;

   const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
    void login() async{
      // get instance of auth service
      final  authService = AuthService();

      // try sign in
      try {
        await authService.SignInWithEmailPassword(
            emailController.text,
            passwordController.text,
        );
      }

      // catch any errors
      catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }






  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            Text("Your Hub for Phone Accessories",
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

            const SizedBox(height: 25),


            // sign up button
            MyButton(text: "Sign In",
                onTap: login,
            ),

            const SizedBox(height: 15),

            // not a member? Register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Not a Memeber?", style:
                TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("  Register Now", style:
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
