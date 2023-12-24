import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:user_mode/globel/global.dart';
import 'package:user_mode/screens/main_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final UserNameTextEditingController = TextEditingController();
  final UserEmailTextEditingController = TextEditingController();
  final UserPhoneNumberTextEditingController = TextEditingController();
  final UserAddressTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();
  final UserConfirmPasswordTextEditingController = TextEditingController();

  bool _passwordVisible = false;
  bool _ConfirmpasswordVisible = false;


  // declare a GlobalKey
  final _formkey = GlobalKey<FormState>();

  // void _submit ()async {
  //
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context)
  //       {
  //         return LoadingScreen(message: "Processing, Please wait....",);
  //       }
  //   );
  //
  // }



  @override
  Widget build(BuildContext context) {


    return GestureDetector (
      onTap: ()
      {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset("image/multitasking.png"),

                SizedBox(height: 20,),

                Text(
                  "Register",
                  style:  TextStyle(
                    color: Colors.teal.shade400,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            //Name form field
                            TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.person, color: Colors.teal.shade400)
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text){
                                  if (text == null || text.isEmpty){
                                    return "Name can't be empty";
                                  }
                                  if (text.length<2){
                                    return "Please enter a valid name";
                                  }
                                  if (text.length >99){
                                    return"Name can't be more than 100";
                                  }
                                },
                                onChanged: (text) => setState(() {
                                  UserNameTextEditingController.text = text;
                                }
                                )),

                            SizedBox(height: 10,),


                            //Email form field
                            TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.email, color: Colors.teal.shade400)
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text){
                                  if (text == null || text.isEmpty){
                                    return "Email can't be empty";
                                  }
                                  // if(EmailValidator.validate(text)==true){
                                  //   return null;
                                  // }
                                  if (text.length<2){
                                    return "Please enter a valid email";
                                  }
                                  if (text.length >99){
                                    return"Email can't be more than 100";
                                  }
                                },
                                onChanged: (text) => setState(() {
                                  UserEmailTextEditingController.text = text;
                                }
                                )
                            ),

                            SizedBox(height: 10,),

                            //Phone Number form field
                            IntlPhoneField(
                              showCountryFlag: true,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.teal.shade400,
                              ),
                              decoration: InputDecoration (
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder (
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width:  0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              initialCountryCode: 'BD',
                              onChanged: (text) => setState(() {
                                UserPhoneNumberTextEditingController.text = text.completeNumber;
                              }),
                            ),

                            SizedBox(height: 10,),

                            //Address form field
                            TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Address",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.house, color: Colors.teal.shade400)
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text){
                                  if (text == null || text.isEmpty){
                                    return "Address can't be empty";
                                  }
                                  if (text.length<2){
                                    return "Please enter a valid address";
                                  }
                                  if (text.length >99){
                                    return"Address can't be more than 100";
                                  }
                                },
                                onChanged: (text) => setState(() {
                                  UserAddressTextEditingController.text = text;
                                }
                                )
                            ),

                            SizedBox(height: 20,),

                            //Password form field
                            TextFormField(
                                obscureText: !_passwordVisible,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password, color: Colors.teal.shade400),
                                    suffixIcon:IconButton (
                                      icon: Icon(
                                        _passwordVisible? Icons.visibility : Icons.visibility_off,
                                        color: Colors.teal.shade400,
                                      ), onPressed: () {

                                      // update the state i.e. toggle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    )
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text){
                                  if (text == null || text.isEmpty){
                                    return "Password can't be empty";
                                  }
                                  if (text.length<6){
                                    return "Password can't be less than 6";
                                  }
                                  if (text.length >49){
                                    return"Password can't be more than 50";
                                  }
                                  return null;
                                },
                                onChanged: (text) => setState(() {
                                  UserPasswordTextEditingController.text = text;
                                }
                                )
                            ),

                            SizedBox(height: 10,),

                            //Confirm Password form field
                            TextFormField(
                                obscureText: !_ConfirmpasswordVisible,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password_sharp, color: Colors.teal.shade400),
                                    suffixIcon:IconButton (
                                      icon: Icon(
                                        _ConfirmpasswordVisible? Icons.visibility : Icons.visibility_off,
                                        color: Colors.teal.shade400,
                                      ), onPressed: () {

                                      // update the state i.e. toggle the state of passwordVisible variable
                                      setState(() {
                                        _ConfirmpasswordVisible = !_ConfirmpasswordVisible;
                                      });
                                    },
                                    )
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text){
                                  if (text == null || text.isEmpty){
                                    return "Confirm Password can't be empty";
                                  }
                                  if (text.length<6){
                                    return "Confirm Password can't be less than 6";
                                  }
                                  if (text != UserPasswordTextEditingController.text){
                                    return "Confirm Password do not match";
                                  }
                                  if (text.length >49){
                                    return "Confirm Password can't be more than 50";
                                  }
                                  return null;
                                },
                                onChanged: (text) => setState(() {
                                  UserConfirmPasswordTextEditingController.text = text;
                                }
                                )
                            ),

                            SizedBox(height: 10,),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal.shade400,
                                  onPrimary: Colors.grey.shade200,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)
                                  ),
                                  minimumSize: Size(double.infinity, 50)
                              ),

                              onPressed: (){
                                //_submit();
                              },

                              child: Text(
                                "Register",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  //color: darktheme? Colors.white: Colors.grey.shade200,
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),

                            GestureDetector(
                              onTap: (){},
                              child: Text (
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.teal.shade400,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),

                            SizedBox(height: 15,),

                            GestureDetector(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                              },
                              child: Text (
                                "Have an account? Sing in ",
                                style: TextStyle(
                                  color: Colors.teal.shade400,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

