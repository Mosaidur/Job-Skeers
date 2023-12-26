
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'JobSeekerRegister.dart';
import 'JobSeekerSign_In.dart';
//import 'package:fluttertoast/fluttertoast.dart';


class JobSeekerForgetPassScreen extends StatefulWidget {
  JobSeekerForgetPassScreen({super.key});
  late String select = "Phone Number";


  @override
  State<JobSeekerForgetPassScreen> createState() => _JobSeekerForgetPassScreenState();
}

class _JobSeekerForgetPassScreenState extends State<JobSeekerForgetPassScreen> {

  final UserEmailTextEditingController = TextEditingController();
  final UserPasswordTextEditingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  List<String> method = ["Phone Number", "Email"];

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

                              // Select Account Finding mathod

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        "Select the Account Finding Methods",
                                      style: TextStyle(
                                        color: Color(0xff03438C),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      addRadioButton(0, 'Phone Number'),
                                      addRadioButton(1, 'Email'),
                                    ],
                                  ),
                                ],
                              ),

                              //Email form field
                              TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(100),
                                  ],
                                  decoration: InputDecoration(
                                      hintText: widget.select == "Phone Number" ? "Phone Number" : "Email",
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
                                  "Find Your Account",
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  JobSeekerSigninScreen()));
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

                              SizedBox(height: 5,),

                              Text("Or,",style: TextStyle(
                                color: Color(0xff03438C),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),


                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerRegisterScreen()));
                                },
                                child: Text (
                                  "Don't an account? Sing up ",
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
      ),
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Color(0xff03438C),
          value: method[btnValue],
          groupValue: widget.select,
          onChanged: (value) {
            setState(() {
              print(value);
              widget.select = value.toString();
            });
          },
        ),
        Text(title),
      ],
    );
  }




}
