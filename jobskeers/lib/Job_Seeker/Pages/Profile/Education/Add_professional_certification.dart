import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_professional_certification extends StatefulWidget {
  const Add_professional_certification({super.key});

  @override
  State<Add_professional_certification> createState() => _Add_professional_certificationState();
}

class _Add_professional_certificationState extends State<Add_professional_certification> {

  TextEditingController certificationTitleController = TextEditingController();
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        endDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Language Proficiency"),
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

                // Certification Title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Certification Title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Certification Title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    certificationTitleController.text = text;
                  }
                  ),
                  controller: certificationTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Certification Title*",
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

                // Institute Name
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Institute Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Institute Name";
                    }
                  },
                  onChanged: (text) => setState(() {
                    instituteNameController.text = text;
                  }
                  ),
                  controller: instituteNameController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Institute Name*",
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

                // Location
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Location Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid location";
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

                // Start Date
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Start Date can't be empty";
                    }
                    if (text.length==9){
                      return "Please enter a valid Start date";
                    }
                  },
                  onChanged: (text) => setState(() {
                    startDateController.text = text;
                  }
                  ),
                  controller: startDateController,
                  readOnly: true,
                  enabled: true,
                  onTap: ()=> _selectStartDate(context),
                  decoration: InputDecoration(
                    hintText: "Start Date*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectStartDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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

                // End Date
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "End Date can't be empty";
                    }
                    if (text.length==9){
                      return "Please enter a valid End date";
                    }
                  },
                  onChanged: (text) => setState(() {
                    endDateController.text = text;
                  }
                  ),
                  controller: endDateController,
                  readOnly: true,
                  enabled: true,
                  onTap: ()=> _selectEndDate(context),
                  decoration: InputDecoration(
                    hintText: "End Date*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectEndDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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
