import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../customDialogBox.dart';
import 'links.dart';

class Edit_links extends StatefulWidget {
  const Edit_links({super.key});

  @override
  State<Edit_links> createState() => _Edit_linksState();
}

class _Edit_linksState extends State<Edit_links> {

  final TextEditingController websiteController = TextEditingController(text: "");
  final TextEditingController facebookController = TextEditingController(text: "");
  final TextEditingController linkedinController = TextEditingController(text: "");
  final TextEditingController githubController = TextEditingController(text: "");
  final TextEditingController otherLinkController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Edit Links"),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_language_prof ()));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomDialogBox(
                            message: 'Are you sure you want to delete?',
                            bgcolors: Colors.white,
                            title: 'Delete',
                            pageLink: OtherProfileLinks(),
                          )
                  );
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                SizedBox(height: 20,),

                // Website Link
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1000),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Website Link Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Website Link";
                    }
                  },
                  onChanged: (text) => setState(() {
                    websiteController.text = text;
                  }
                  ),
                  controller: websiteController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Website Link*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                //Facebook Link
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1000),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Facebook Link can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Facebook Link";
                    }
                  },
                  onChanged: (text) => setState(() {
                    facebookController.text = text;
                  }
                  ),
                  controller: facebookController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Facebook Link*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                //LinkedIn Link
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(500),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "LinkedIn Link can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid LinkedIn Link";
                    }
                  },
                  onChanged: (text) => setState(() {
                    linkedinController.text = text;
                  }
                  ),
                  controller: linkedinController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "LinkedIn Link*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // GitHub Link
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(500),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "GitHub Link can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid GitHub Link";
                    }
                  },
                  onChanged: (text) => setState(() {
                    githubController.text = text;
                  }
                  ),
                  controller: githubController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "GitHub Link*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                //Other Link
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Others Link can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Others Link";
                    }
                  },
                  onChanged: (text) => setState(() {
                    otherLinkController.text = text;
                  }
                  ),
                  controller: otherLinkController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Others Link*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Update"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff03438C), // Change this color to your desired color
                  ),
                ),

                SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
