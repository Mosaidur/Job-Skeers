import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registration_OTPVerfication extends StatefulWidget {
  const Registration_OTPVerfication({Key? key});

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
              "We have send the verification code to \n +88017*****519",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            InkWell(
              onTap: (){

              },
              child: Text(
              "Change Phone number or Email?",
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
                primary: Color(0xff03438C),
                onPrimary: Colors.grey.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(100, 50),
              ),
              onPressed: () {
                // Call a method to handle the verification logic
                _verifyOtp();
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
  void _verifyOtp() {
    // Implement your OTP verification logic here
    // For example, you can compare the entered OTP with the expected OTP
    // If the OTP is correct, you can navigate to the next screen
    // Otherwise, you can show an error message
  }
}
