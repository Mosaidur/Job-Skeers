
//import 'package:email_validator/email_validator.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Employer/Emp_Login_page.dart';
import 'package:jobskeers/Job_Seeker/CustomSlideButton.dart';
import 'package:jobskeers/Job_Seeker/loading_page.dart';

import '../CustomSnackbar.dart';
import '../JobSeekerMainPage.dart';
import '../Models/loginModel.dart';
import '../customDialogBox.dart';
import 'JobSeekerForgetPass.dart';
import 'JobSeekerRegister.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';





class JobSeekerSigninScreen extends StatefulWidget {
  const JobSeekerSigninScreen({super.key});

  @override
  State<JobSeekerSigninScreen> createState() => _JobSeekerSigninScreenState();
}

class _JobSeekerSigninScreenState extends State<JobSeekerSigninScreen> {

  // static const String UserIDGlobally = "USERID";

  final UserEmailTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool _passwordVisible =false;

  Future<void> _submit() async {
    LoadingPage();

    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Employ_login.php';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'email': UserEmailTextEditingController.text,
        'password': UserPasswordTextEditingController.text,
      },
    );

    if (response.statusCode == 200)  {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final loginResponse = LoginResponse.fromJson(responseData);

      if (loginResponse.success == true ) {
        // Login successful, handle the response
        if (loginResponse.userId != null) {

          // print('Login successful. User ID: ${loginResponse.userId}');

          //here used sharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          // int userId = int.parse('${loginResponse.userId}');
          await prefs.setString("USERID", loginResponse.userId!);
          await prefs.setString("USERNAME", loginResponse.userName!);
          await prefs.setString("USEREMAIL", loginResponse.userEmail!);
          await prefs.setString("USERPHONENO", loginResponse.userPhoneNo!);
          await prefs.setString("USERTYPE", loginResponse.userPhoneNo!);

          // Delay the execution of the showDialog
          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: '${loginResponse.message}',
              backgroundColor: Colors.green.shade400,
              // Set your desired background color
              actionLabel: 'Successful',
              iconData: Icons.done,
              onActionPressed: () {
                // Handle action press
                Navigator
                    .of(context)
                    .pop; // or any other action
              },
            );
          });

          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => JobSeekerMainpage()));

        }
        else{
          // if userid == null
          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: 'Some unexpected issue happends',
              backgroundColor: Colors.green.shade400,
              // Set your desired background color
              actionLabel: 'Login failed.',
              iconData: Icons.error,
              onActionPressed: () {
                // Handle action press
                Navigator.of(context).pop; // or any other action
              },
            );
          });
        }
      } else {
        // Login failed, handle the error message
        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: '${loginResponse.message}',
            backgroundColor: Colors.red.shade400, // Set your desired background color
            actionLabel: 'Login failed.',
            iconData: Icons.error,
            onActionPressed: () {
              // Handle action press
              Navigator.of(context).pop; // or any other action
            },
          );

        });
      }
    } else {
      // Handle other HTTP status codes
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'Error: ${response.statusCode}. Try again.',
          backgroundColor: Colors.red.shade400, // Set your desired background color
          actionLabel: 'Login failed.',
          iconData: Icons.error,
          onActionPressed: () {
            // Handle action press
            Navigator.of(context).pop; // or any other action
          },
        );

      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.fromLTRB(0,0, 0,0 ),
          children: [
            Column(
            children: [

              // SizedBox(height: 20,),

              Image.asset( "assets/images/Login as A Job Seeker.jpg"),

              SizedBox(height: 20,),

              Text(
                "Login as A Job Seeker",
                style:  TextStyle(
                  color:  Color(0xff03438C),
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
                                  prefixIcon: Icon(Icons.email, color:  Color(0xff03438C))
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
                                  prefixIcon: Icon(Icons.password, color:   Color(0xff03438C)),
                                  suffixIcon:IconButton (
                                    icon: Icon(
                                      _passwordVisible? Icons.visibility : Icons.visibility_off,
                                      color:   Color(0xff03438C),
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
                                primary:  Color(0xff03438C),
                                onPrimary: Colors.grey.shade200,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)
                                ),
                                minimumSize: Size(double.infinity, 50)
                            ),

                            onPressed: _submit,

                            // onPressed: ()=> Navigator.push(
                            //     context, MaterialPageRoute(
                            //     builder: (context) => JobSeekerMainpage())) ,

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
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  JobSeekerForgetPassScreen()));

                            },
                            child: Text (
                              "Forgot Password?",
                              style: TextStyle(
                                color:   Color(0xff03438C),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),

                          SizedBox(height: 15,),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerRegisterScreen()));
                            },
                            child: Text (
                              "Don't an account? Register ",
                              style: TextStyle(
                                color:  Color(0xff03438C),
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

  // Future<String?> getUSERID() async {
  //   var prefs = await SharedPreferences.getInstance();
  //
  //   return prefs.getString(UserIDGlobally); // Replace with the actual value
  // }

  // void someFunction() async {
  //   String? userID = await getUSERID() as String;
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => JobSeekerMainpage(UserIDGlobally: userID),
  //     ),
  //   );
  // }


}
