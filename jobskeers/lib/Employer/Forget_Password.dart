//
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:user_mode/globel/global.dart';
// import 'package:user_mode/screens/login_screen.dart';
// import 'package:user_mode/screens/register_screen.dart';
//
// import '../widgets/loading_screen.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//
//   final UserEmailTextEditingController = TextEditingController();
//   final UserPasswordTextEditingController = TextEditingController();
//
//   final _formkey = GlobalKey<FormState>();
//
//   void _submit (){
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context)
//         {
//           return LoadingScreen(message: "Please wait....\nSending a email for recover password in your email",);
//         }
//     );
//
//     firebaseAuth.sendPasswordResetEmail(
//       email: UserEmailTextEditingController.text.trim(),
//     ).then((value){
//       Fluttertoast.showToast(msg: "Sending a email for recover password in your email, please check email");
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
//     }).onError((error, stackTrace) {
//       Fluttertoast.showToast(msg: "Error Occured: \n $error");
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     bool darktheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
//
//     return GestureDetector(
//       onTap: (){
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: ListView(
//           padding: EdgeInsets.fromLTRB(0,50, 0,0 ),
//           children: [
//             Column(
//               children: [
//
//                 Padding(
//                   padding: const EdgeInsets.all(80),
//                   child: Image.asset(darktheme? "image/reset-password.png": "image/reset-password.png"),
//                 ),
//
//                 // SizedBox(height: 20,),
//
//                 Text(
//                   "Forgot Password",
//                   style:  TextStyle(
//                     color: darktheme? Colors.white: Colors.teal.shade400,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 20, 15, 50),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Form(
//                         key: _formkey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//
//                             //Email form field
//                             TextFormField(
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(100),
//                                 ],
//                                 decoration: InputDecoration(
//                                     hintText: "Email",
//                                     hintStyle: TextStyle(
//                                       color: darktheme? Colors.white : Colors.grey,
//                                     ),
//                                     filled: true,
//                                     fillColor: darktheme? Colors.black45: Colors.grey.shade200,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(40),
//                                       borderSide: BorderSide(
//                                         width: 0,
//                                         style: BorderStyle.none,
//                                       ),
//                                     ),
//                                     prefixIcon: Icon(Icons.email, color: darktheme? Colors.white : Colors.teal.shade400)
//                                 ),
//                                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                                 validator: (text){
//                                   if (text == null || text.isEmpty){
//                                     return "Email can't be empty";
//                                   }
//                                   if(EmailValidator.validate(text)==true){
//                                     return null;
//                                   }
//                                   if (text.length<2){
//                                     return "Please enter a valid email";
//                                   }
//                                   if (text.length >99){
//                                     return"Email can't be more than 100";
//                                   }
//                                 },
//                                 onChanged: (text) => setState(() {
//                                   UserEmailTextEditingController.text = text;
//                                 }
//                                 )
//                             ),
//
//
//                             SizedBox(height: 20,),
//
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   primary: darktheme? Colors.black45: Colors.teal.shade400,
//                                   onPrimary: darktheme? Colors.white: Colors.grey.shade200,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(32)
//                                   ),
//                                   minimumSize: Size(double.infinity, 50)
//                               ),
//
//                               onPressed: (){
//                                 _submit();
//                               },
//
//                               child: Text(
//                                 "Send Reset Password Link",
//                                 style:TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   //color: darktheme? Colors.white: Colors.grey.shade200,
//                                 ),
//                               ),
//                             ),
//
//                             SizedBox(height: 15,),
//
//                             GestureDetector(
//                               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
//                               },
//                               child: Text (
//                                 "Have an account? Sing in ",
//                                 style: TextStyle(
//                                   color: darktheme? Colors.white: Colors.teal.shade400,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//
//                                 ),
//                               ),
//                             ),
//
//                             // SizedBox(height: 15,),
//                             //
//                             // GestureDetector(
//                             //   onTap: (){
//                             //     Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
//                             //   },
//                             //   child: Text (
//                             //     "Don't an account? Sing up ",
//                             //     style: TextStyle(
//                             //       color: darktheme? Colors.white: Colors.teal.shade400,
//                             //       fontSize: 17,
//                             //       fontWeight: FontWeight.bold,
//                             //
//                             //     ),
//                             //   ),
//                             // ),
//
//
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
