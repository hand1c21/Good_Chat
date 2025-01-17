// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget{
//   const RegisterPage();

//   State<RegisterPage> createState()=>_RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage>{
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
// title: Text("data"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../component/my_button.dart';
import '../component/my_textfield.dart';
import '../service/auto_service.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage();

//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   final authService = AuthService();

//   void register() async {
//     if (passwordController.text == confirmPasswordController.text) {
//       try {
//         await authService.signUpWithEmailPassword(
//           emailController.text,
//           passwordController.text,
//         );

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
//         );
//       } catch (e) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             backgroundColor: Theme.of(context).colorScheme.surface,
//             title: Text(e.toString()),
//           ),
//         );
//       }
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: Theme.of(context).colorScheme.surface,
//           title: Text('Password dont match'),
//         ),
//       );
//     }
//   }

//   void navigatorToLogIn() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Image.asset(
//                   'lib/images/message.png',
//                   height: 100,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//                 SizedBox(height: 50),
//                 MyTextField(
//                   controller: emailController,
//                   hintText: "Email",
//                   obscureText: false,
//                 ),
//                 SizedBox(height: 10),
//                 MyTextField(
//                   controller: passwordController,
//                   hintText: "Password",
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 MyTextField(
//                   controller: confirmPasswordController,
//                   hintText: "confirmPassword",
//                   obscureText: true,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {},
//                         child: Text(
//                           'Forgot Password',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).colorScheme.primary),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 MyButton(
//                   onTap: register,
//                   text: "Register",
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a menber?',
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final authService = AuthService();

  void register() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage()
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text('Password dont match'),
          ),
        );
    }
  }
  

  void navigatorToLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage())
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'lib/images/message.png',
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: 50),
                Text(
                  'Craete account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 50),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                 MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                 MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                SizedBox(height: 25),
                MyButton(
                  onTap: register,
                  text: "Register",
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: navigatorToLogIn,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}