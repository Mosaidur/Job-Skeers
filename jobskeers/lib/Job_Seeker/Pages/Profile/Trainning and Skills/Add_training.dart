import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_training extends StatefulWidget {
  const Add_training({super.key});

  @override
  State<Add_training> createState() => _Add_trainingState();
}

class _Add_trainingState extends State<Add_training> {


  final TextEditingController trainingTitleController = TextEditingController();
  final TextEditingController topicCoveredController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController trainingYearController = TextEditingController();
  final TextEditingController durationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Training"),
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

                // Training Title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Training Title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Training Title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    trainingTitleController.text = text;
                  }
                  ),
                  controller: trainingTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Training Title*",
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

                //Topic Covered
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Learning source can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid learning source";
                    }
                  },
                  onChanged: (text) => setState(() {
                    topicCoveredController.text = text;
                  }
                  ),
                  controller: topicCoveredController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Topic Covered*",
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

                //Institute
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Institute can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Institute";
                    }
                  },
                  onChanged: (text) => setState(() {
                    instituteController.text = text;
                  }
                  ),
                  controller: instituteController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Institute*",
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

                // Country / Region
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Country / Region can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Country / Region";
                    }
                  },
                  onChanged: (text) => setState(() {
                    countryController.text = text;
                  }
                  ),
                  controller: countryController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Country / Region*",
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

                //Location
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Location can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Location";
                    }
                  },
                  onChanged: (text) => setState(() {
                    locationController.text = text;
                  }
                  ),
                  controller: locationController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Location*",
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


                // Training Year
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Training Year can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Training Year";
                    }
                  },
                  onChanged: (text) => setState(() {
                    trainingTitleController.text = text;
                  }
                  ),
                  controller: trainingTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Training Year*",
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

                // Duration
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Duration can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Duration";
                    }
                  },
                  onChanged: (text) => setState(() {
                    durationController.text = text;
                  }
                  ),
                  controller: durationController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Duration*",
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
                  child: Text("Submit"),
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
