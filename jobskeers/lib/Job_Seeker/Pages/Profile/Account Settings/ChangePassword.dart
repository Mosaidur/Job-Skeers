import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../CustomSnackbar.dart';

import '../../../Models/PasswordChangeResponse.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {


  final UserOldPasswordTextEditingController = TextEditingController();
  final UserNewPasswordTextEditingController = TextEditingController();
  final UserNewConfirmPasswordTextEditingController = TextEditingController();

  bool _oldpasswordVisible = false;
  bool _newpasswordVisible = false;
  bool _ConfirmnewpasswordVisible = false;


  late SharedPreferences sprefs;
  String? userID;
  String? userName;
  String? userEmail;
  String? userPhone;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      userID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      userEmail = sprefs.getString("USEREMAIL");
      userPhone = sprefs.getString("USERPHONENO");
    });
  }

  Future<void> changePassword() async {
    final String url = "http://10.0.2.2/JobSeeker_EmpAPI/change_pass.php";

    final response = await http.post(
      Uri.parse(url),
      body:{
        'jsId': userID,
        'old_password': UserOldPasswordTextEditingController.text,
        'new_password': UserNewPasswordTextEditingController.text,
      },
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );

    if (response.statusCode == 200) {
      PasswordChangeResponse result =
      PasswordChangeResponse.fromJson(json.decode(response.body));
      if (result.success==true) {
        print("Password changed successfully");

        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: '${result.message}',
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

        Navigator.of(context).pop();

      } else {
        print("Failed to update password. ${result.message}");

        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: '${result.message}',
            backgroundColor: Colors.red.shade400,
            // Set your desired background color
            actionLabel: 'Error!',
            iconData: Icons.error,
            onActionPressed: () {
              // Handle action press
              Navigator
                  .of(context)
                  .pop; // or any other action
            },
          );
        });

      }
    } else {
      print("Failed to communicate with the server. Status code: ${response.statusCode}");

      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'Failed to communicate with the server. Status code: ${response.statusCode}',
          backgroundColor: Colors.red.shade400,
          // Set your desired background color
          actionLabel: 'Error!',
          iconData: Icons.error,
          onActionPressed: () {
            // Handle action press
            Navigator
                .of(context)
                .pop; // or any other action
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
          appBar: AppBar(
            title: Text("Change Password"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                SizedBox(height: 10,),

                //Old Password
                TextFormField(
                    obscureText: !_oldpasswordVisible,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    decoration: InputDecoration(
                        hintText: "Old Password",
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
                            _oldpasswordVisible? Icons.visibility : Icons.visibility_off,
                            color: Color(0xff03438C),
                          ), onPressed: () {

                          // update the state i.e. toggle the state of passwordVisible variable
                          setState(() {
                            _oldpasswordVisible = !_oldpasswordVisible;
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
                      UserOldPasswordTextEditingController.text = text;
                    }
                    )
                ),

                SizedBox(height: 10,),

                //New Password form field
                TextFormField(
                    obscureText: !_newpasswordVisible,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    decoration: InputDecoration(
                        hintText: "New Password",
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
                            _newpasswordVisible? Icons.visibility : Icons.visibility_off,
                            color: Color(0xff03438C),
                          ), onPressed: () {

                          // update the state i.e. toggle the state of passwordVisible variable
                          setState(() {
                            _newpasswordVisible = !_newpasswordVisible;
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
                      UserNewPasswordTextEditingController.text = text;
                    }
                    )
                ),

                SizedBox(height: 10,),

                //Confirm new Password form field
                TextFormField(
                    obscureText: !_ConfirmnewpasswordVisible,
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
                            _ConfirmnewpasswordVisible? Icons.visibility : Icons.visibility_off,
                            color: Color(0xff03438C),
                          ), onPressed: () {

                          // update the state i.e. toggle the state of passwordVisible variable
                          setState(() {
                            _ConfirmnewpasswordVisible = !_ConfirmnewpasswordVisible;
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
                      if (text != UserNewPasswordTextEditingController.text){
                        return "Confirm Password do not match";
                      }
                      if (text.length >49){
                        return "Confirm Password can't be more than 50";
                      }
                      return null;
                    },
                    onChanged: (text) => setState(() {
                      UserNewConfirmPasswordTextEditingController.text = text;
                    }
                    )
                ),

                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: () {
                    changePassword();

                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff03438C), // Change this color to your desired color
                  ),
                ),



              ],
            ),
          ),
        )
    );
  }
}
