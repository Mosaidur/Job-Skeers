import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobskeers/Job_Seeker/loading_page.dart';

import '../CustomSnackbar.dart';
import '../Models/Reg_Email_verification.dart';
import 'JobSeekerForgetPass.dart';
import 'JobSeekerSign_In.dart';
import 'PhnandEmailVerifation.dart';
import 'Verification_Redio_button.dart';
import 'package:http/http.dart' as http;



class JobSeekerRegisterScreen extends StatefulWidget {
   JobSeekerRegisterScreen({super.key});

   //String select;

  @override
  State<JobSeekerRegisterScreen> createState() => _JobSeekerRegisterScreenState();
}

class _JobSeekerRegisterScreenState extends State<JobSeekerRegisterScreen> {

  final UserNameTextEditingController = TextEditingController();
  final UserEmailTextEditingController = TextEditingController();
  final UserPhoneNumberTextEditingController = TextEditingController();
  final UserStudentshipTitleTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();
  final UserConfirmPasswordTextEditingController = TextEditingController();

  bool _passwordVisible = false;
  bool _ConfirmpasswordVisible = false;
  String? _selectedUserStudentshipTitle;


  late String select= "Phone Number" ;
  // late String select = "Phone Number";


  // declare a GlobalKey
  final _formkey = GlobalKey<FormState>();

  void updateSelection(String value) {
    setState(() {
      select = value;
    });
  }

  Future<void> _submit (String email)async {


      final url = 'http://10.0.2.2/JobSeeker_EmpAPI/reg_email_send.php'; // Replace with your actual API endpoint
      final response =  await http.get(Uri.parse('$url?email=$email'));

      LoadingPage();

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final verificationDTO = EmailVerificationDTO.fromJson(jsonResponse);

        if (verificationDTO.success == true) {


          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: '${verificationDTO.message}.',
              backgroundColor: Colors.green.shade400, // Set your desired background color
              actionLabel: 'Successful.',
              iconData: Icons.done,
              onActionPressed: () {
                // Handle action press
                Navigator.of(context).pop; // or any other action
              },
            );
          });


        } else {

          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: '${verificationDTO.message}.',
              backgroundColor: Colors.red.shade400, // Set your desired background color
              actionLabel: 'Error!',
              iconData: Icons.error,
              onActionPressed: () {
                // Handle action press
                Navigator.of(context).pop; // or any other action
              },
            );
          });
        }
      } else {

        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: 'Failed to load data from the server.',
            backgroundColor: Colors.red.shade400, // Set your desired background color
            actionLabel: 'Error.',
            iconData: Icons.done,
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
                Image.asset("assets/images/Register as Job Seeker.jpg"),

                SizedBox(height: 20,),

                Text(
                  "Register as Job Seeker",
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
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
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
                                    prefixIcon: Icon(Icons.person, color: Color(0xff03438C))
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

                            SizedBox(height: 10,),

                            //Phone Number form field
                            IntlPhoneField(
                              showCountryFlag: true,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff03438C),
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

                            //Studentship Title form field
                            DropdownButtonFormField<String>(
                              value: _selectedUserStudentshipTitle,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Studentship Title",
                                prefixIcon: Icon(Icons.school),
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
                              ),
                              items: <String>[
                                'Running Student (1st & 2nd Year)',
                                'Running Student (3rd & 4th Year)',
                                'Fresh Graduate',
                                'Postgraduate (Masters Program)',
                                'Alumni',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedUserStudentshipTitle = newValue!;
                                  UserStudentshipTitleTextEditingController.text = newValue;
                                });
                              },
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
                                    prefixIcon: Icon(Icons.password, color: Color(0xff03438C)),
                                    suffixIcon:IconButton (
                                      icon: Icon(
                                        _passwordVisible? Icons.visibility : Icons.visibility_off,
                                        color: Color(0xff03438C),
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
                                    prefixIcon: Icon(Icons.password_sharp, color: Color(0xff03438C)),
                                    suffixIcon:IconButton (
                                      icon: Icon(
                                        _ConfirmpasswordVisible? Icons.visibility : Icons.visibility_off,
                                        color: Color(0xff03438C),
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


                            // Verification method select

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Select Verification Method.",
                                  style: TextStyle(
                                    color: Color(0xff03438C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17
                                  ),
                                  ),
                                ),

                                Radio_Button(select: select, onSelectionChanged: updateSelection,),
                              ],
                            ),

                            SizedBox(height: 10,),


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


                                // Check if all required fields are filled
                                // Check if all required fields are filled and passwords match
                                if (UserNameTextEditingController.text.isEmpty ||
                                    UserEmailTextEditingController.text.isEmpty ||
                                    UserPhoneNumberTextEditingController.text.isEmpty ||
                                    UserStudentshipTitleTextEditingController.text.isEmpty ||
                                    UserPasswordTextEditingController.text.isEmpty ||
                                    UserConfirmPasswordTextEditingController.text.isEmpty) {

                                  Future.delayed(Duration.zero, () {
                                    CustomSnackBar.show(
                                      context,
                                      message: 'Please Enter all the value',
                                      backgroundColor: Colors.red.shade400, // Set your desired background color
                                      actionLabel: 'Error',
                                      iconData: Icons.error,
                                      onActionPressed: () {
                                        // Handle action press
                                        Navigator.of(context).pop; // or any other action
                                      },
                                    );

                                  });

                                } else {
                                  if (UserPasswordTextEditingController.text != UserConfirmPasswordTextEditingController.text)
                                  {
                                    Future.delayed(Duration.zero, () {
                                      CustomSnackBar.show(
                                        context,
                                        message: 'Password not match',
                                        backgroundColor: Colors.red.shade400, // Set your desired background color
                                        actionLabel: 'Error',
                                        iconData: Icons.error,
                                        onActionPressed: () {
                                          // Handle action press
                                          Navigator.of(context).pop; // or any other action
                                        },
                                      );

                                    });
                                  }else {

                                    String phoneOrEmail;

                                    if (select == 'Email') {
                                      phoneOrEmail = UserEmailTextEditingController.text;


                                      _submit(phoneOrEmail.toString());


                                    } else if ( select == 'Phone Number') {
                                      phoneOrEmail = UserPhoneNumberTextEditingController.text;
                                    } else {
                                      // Handle the case when 'Phone & Email' is selected
                                      // You might want to combine both phone and email or handle it differently based on your requirements.
                                      phoneOrEmail = ' ${UserPhoneNumberTextEditingController.text} and ${UserEmailTextEditingController.text}';
                                    }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Registration_OTPVerfication(
                                          value: select,
                                          phone_number: phoneOrEmail,
                                          NametextController: UserNameTextEditingController,
                                          emailtextController: UserEmailTextEditingController,
                                          phoneNumbertextController: UserPhoneNumberTextEditingController,
                                          Studentship_TitletextController: UserStudentshipTitleTextEditingController,
                                          passwordtextController: UserPasswordTextEditingController,
                                        ),
                                      ),
                                    );

                                  }
                                }



                                // print( select );


                              },

                              child: Text(
                                "Register with $select ",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  //color: darktheme? Colors.white: Colors.grey.shade200,
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),

                            //Forgot password
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerForgetPassScreen()));
                              },
                              child: Text (
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xff03438C),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),

                            SizedBox(height: 15,),

                            //have an account
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerSigninScreen()));

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

