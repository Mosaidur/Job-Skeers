import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../Select_LogInScreen.dart';
import '../CustomSnackbar.dart';
import '../Models/Reg_verify_code.dart';
import '../Models/register_data_To.dart';

class Registration_OTPVerfication extends StatefulWidget {
  Registration_OTPVerfication({Key? key,
    required this.value, required this.phone_number,
    required this.NametextController,
    required this.emailtextController,
    required this.phoneNumbertextController,
    required this.Studentship_TitletextController,
    required this.passwordtextController});


  late final String value;
  final String phone_number;
  final TextEditingController NametextController;
  final TextEditingController emailtextController;
  final TextEditingController phoneNumbertextController;
  final TextEditingController Studentship_TitletextController;
  final TextEditingController passwordtextController;

  @override
  State<Registration_OTPVerfication> createState() =>
      _Registration_OTPVerficationState();
}

class _Registration_OTPVerficationState
    extends State<Registration_OTPVerfication> {
  late final TextEditingController _textController1;
  late final TextEditingController _textController2;
  late final TextEditingController _textController3;
  late final TextEditingController _textController4;
  late final TextEditingController _textController5;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
    _textController5 = TextEditingController();
  }




  //Register Data
  void signUp(JobSeeker data) async {
    final apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Emp_register.php';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: data.toJson(),
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    final ResponseDataModel responseModel = ResponseDataModel.fromJson(responseData);

    if (response.statusCode == 200) {
      // Successfully sent data to the server
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: '${responseModel.message}.',
          backgroundColor: Colors.green.shade400, // Set your desired background color
          actionLabel: 'Successful.',
          iconData: Icons.done,
          onActionPressed: () {
            // Handle action press
            Navigator.of(context).pop; // or any other action
          },
        );
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectLoginScreen() ));
    } else {

      // Handle errors here
      print('Failed to send data. Error: ${response.statusCode}');
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: '${responseModel.message}.',
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
  }

  void registerDataSubmit() {
    final dto = JobSeeker(
      name: widget.NametextController.text.toString(),
      phoneNo: widget.phoneNumbertextController.text.toString(),
      Studentship_Title: widget.Studentship_TitletextController.text.toString(),
      email: widget.emailtextController.text.toString(),
      password: widget.passwordtextController.text.toString(),
    );

    signUp(dto);
  }



  // Verification code match
  Future<void> _verifySubmit(String verificationCode) async {
    final apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/reg_email_verify.php';
    final response = await http.get(Uri.parse('$apiUrl?code=$verificationCode'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final verificationResponse = VerificationCodeResponse.fromJson(responseData);

      if (verificationResponse.success== true) {
        // Email verification successful
        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: '${verificationResponse.message}.',
            backgroundColor: Colors.green.shade400, // Set your desired background color
            actionLabel: 'Successful.',
            iconData: Icons.done,
            onActionPressed: () {
              // Handle action press
              Navigator.of(context).pop; // or any other action
            },
          );
        });

        registerDataSubmit();

      } else {
        // Email verification failed
        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: '${verificationResponse.message}.',
            backgroundColor: Colors.red.shade400, // Set your desired background color
            actionLabel: 'Error.',
            iconData: Icons.error,
            onActionPressed: () {
              // Handle action press
              Navigator.of(context).pop; // or any other action
            },
          );
        });
      }
    } else {
      // Handle HTTP error
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'HTTP Error: ${response.statusCode}.',
          backgroundColor: Colors.red.shade400, // Set your desired background color
          actionLabel: 'Error.',
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
    return Scaffold(
      backgroundColor: Color(0xffcae6f1),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
                "Verification code",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              "We have send the verification code to \n ${widget.phone_number!= null ? widget.phone_number : 'a missing number' }",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Text(
              "Change ${widget.value != null ? widget.value : 'Phone Number or Email' }?",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            ),

            SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 54,
                        width: 50,
                        child: TextFormField(
                          controller: _textController1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          //style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xff03438C)),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 54,
                        width: 50,
                        child: TextFormField(
                          controller: _textController2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xff03438C)),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 54,
                        width: 50,
                        child: TextFormField(
                          controller: _textController3,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xff03438C)),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 54,
                        width: 50,
                        child: TextFormField(
                          controller: _textController4,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xff03438C)),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 54,
                        width: 50,
                        child: TextFormField(
                          controller: _textController5,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xff03438C)),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey.shade200, backgroundColor: Color(0xff03438C),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(100, 50),
              ),
              onPressed: () {
                // Call a method to handle the verification logic
                String mergedText = _textController1.text +
                    _textController2.text +
                    _textController3.text +
                    _textController4.text +
                    _textController5.text;

                _verifySubmit(mergedText);
              },
              child: Text(
                "Verify",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();

    super.dispose();
  }

}
