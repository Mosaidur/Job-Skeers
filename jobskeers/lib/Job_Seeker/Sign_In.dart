
//import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class JobSeekerSigninScreen extends StatefulWidget {
  const JobSeekerSigninScreen({super.key});

  @override
  State<JobSeekerSigninScreen> createState() => _JobSeekerSigninScreenState();
}

class _JobSeekerSigninScreenState extends State<JobSeekerSigninScreen> {

  final UserEmailTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool _passwordVisible =false;

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
  // }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(0,50, 0,0 ),
          children: [
            Column(
              children: [
                Image.asset( "image/log-in.png"),

                SizedBox(height: 20,),

                Text(
                  "Login",
                  style:  TextStyle(
                    color:  Colors.teal.shade400,
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

                            //Email form field
                            TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color:  Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor:  Colors.grey.shade200,
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

                            //Password form field
                            TextFormField(
                                obscureText: !_passwordVisible,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color:  Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor:  Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password, color:  Colors.teal.shade400),
                                    suffixIcon:IconButton (
                                      icon: Icon(
                                        _passwordVisible? Icons.visibility : Icons.visibility_off,
                                        color:  Colors.teal.shade400,
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

                            SizedBox(height: 20,),

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
                                "Login",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  //color: darktheme? Colors.white: Colors.grey.shade200,
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),

                            GestureDetector(
                              onTap: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()));

                              },
                              child: Text (
                                "Forgot Password?",
                                style: TextStyle(
                                  color:  Colors.teal.shade400,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),

                            SizedBox(height: 15,),

                            GestureDetector(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                              },
                              child: Text (
                                "Don't an account? Sing up ",
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
