import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/register_page.dart';
import '../service/auto_service.dart';
import '../component/my_button.dart';
import '../component/my_textfield.dart';
import 'home_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage();

//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void login ()async{
//     final authService =AuthService();
//     try{
//     await authService.signInWithemailPassword(
//       emailController.text,
//       passwordController.text,
//     );
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context)=>HomePage()) 
//       );
//     }catch(e){
//       String errorMesage=authService.getErrorMesage(e.toString());
//       showDialog(
//         context: context,
//        builder:(context)=>AlertDialog(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         title: Text(errorMesage),
//       ),
//       );
//     }
//   }


//  void navigatorToRegister(){
//    Navigator.push(
//     context,
//     MaterialPageRoute(builder:(context)=>RegisterPage()),
//    );
//  }
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
//                 SizedBox(height: 25,),
//                 MyButton(
//                   onTap:login,
//                   text:"Login",
//                 ),
//                 SizedBox(height: 50,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a menber?',
//                       style: TextStyle(
//                       color:Theme.of(context).colorScheme.secondary,


//                       ),
//                     ),
//                     SizedBox(width: 4,),
//                     GestureDetector(
//                       onTap: navigatorToRegister,
//                       child: Text(
//                         'register now',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
                          
//                         ),
//                       ),
//                     )
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

class LoginPage extends StatefulWidget {
  const LoginPage();

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      String errorMessage = authService.getErrorMessage(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(errorMessage)
        ),
      );
    }
  }

  void navigatorToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage())
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
                  'Welcome back!',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                MyButton(
                  onTap: login,
                  text: "Login",
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: navigatorToRegister,
                      child: Text(
                        'Register now',
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
