
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';


class JobSeekerForgetPassScreen extends StatefulWidget {
  const JobSeekerForgetPassScreen({super.key});

  @override
  State<JobSeekerForgetPassScreen> createState() => _JobSeekerForgetPassScreenState();
}

class _JobSeekerForgetPassScreenState extends State<JobSeekerForgetPassScreen> {

  final UserEmailTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  // void _submit (){
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context)
  //       {
  //         return LoadingScreen(message: "Please wait....\nSending a email for recover password in your email",);
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
        body: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(0,200, 0,0 ),
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Padding(
                  //   padding: const EdgeInsets.all(80),
                  //   child: Image.asset("image/reset-password.png"),
                  // ),

                  // SizedBox(height: 20,),

                  Text(
                    "Forgot Password",
                    style:  TextStyle(
                      color: Color(0xff03438C),
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
                                      hintText: "Email or Phone Number",
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
                                      prefixIcon: Icon(Icons.email, color: Color(0xff03438C))
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (text){
                                    if (text == null || text.isEmpty){
                                      return "Email can't be empty";
                                    }
                                    if(EmailValidator.validate(text)==true){
                                      return null;
                                    }
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


                              SizedBox(height: 20,),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff03438C),
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
                                  "Send Reset Password Link",
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    //color: darktheme? Colors.white: Colors.grey.shade200,
                                  ),
                                ),
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                onTap: (){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                                },
                                child: Text (
                                  "Have an account? Sing in ",
                                  style: TextStyle(
                                    color: Color(0xff03438C),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),

                              // SizedBox(height: 15,),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                              //   },
                              //   child: Text (
                              //     "Don't an account? Sing up ",
                              //     style: TextStyle(
                              //       color: darktheme? Colors.white: Colors.teal.shade400,
                              //       fontSize: 17,
                              //       fontWeight: FontWeight.bold,
                              //
                              //     ),
                              //   ),
                              // ),



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
      ),
    );
  }
}
