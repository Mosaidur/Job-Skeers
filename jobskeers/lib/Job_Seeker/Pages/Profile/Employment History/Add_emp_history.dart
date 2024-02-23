import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_emp_history extends StatefulWidget {
  const Add_emp_history({super.key});

  @override
  State<Add_emp_history> createState() => _Add_emp_historyState();
}

class _Add_emp_historyState extends State<Add_emp_history> {

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyBusinessController = TextEditingController();
  final TextEditingController companyLocationController = TextEditingController();
  final TextEditingController companyDesignationController = TextEditingController();
  final TextEditingController companyDepartmentController = TextEditingController();
  final TextEditingController companyResponsibilitiesController = TextEditingController();
  final TextEditingController companyHistoryStartDateController = TextEditingController();
  final TextEditingController companyHistoryEndDateController = TextEditingController();
  final TextEditingController areaOfExpertiseController = TextEditingController();

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
        companyHistoryStartDateController.text = "${picked.toLocal()}".split(' ')[0];
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
        companyHistoryEndDateController.text = "${picked.toLocal()}".split(' ')[0];
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
          title: Text("Add Employe History"),
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

                // Company Name
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Company Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Company Name";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyNameController.text = text;
                  }
                  ),
                  controller: companyNameController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Company Name*",
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

                //Company Business
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Company Business can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Company Business";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyBusinessController.text = text;
                  }
                  ),
                  controller: companyBusinessController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Company Business*",
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

                // Company Location
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Company Location can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Company Location";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyLocationController.text = text;
                  }
                  ),
                  controller: companyLocationController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Company Location*",
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

                // Your Designation in Company
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Company Location can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Company Location";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyLocationController.text = text;
                  }
                  ),
                  controller: companyLocationController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Company Location*",
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

                //Department you worked in company
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Department can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Department";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyDepartmentController.text = text;
                  }
                  ),
                  controller: companyDepartmentController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Department you worked in company*",
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

                // Responsibilities
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1500),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Responsibilities can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Responsibilities";
                    }
                  },
                  onChanged: (text) => setState(() {
                    companyDepartmentController.text = text;
                  }
                  ),
                  controller: companyDepartmentController,
                  maxLines: 5,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Responsibilities*",
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
                    companyHistoryStartDateController.text = text;
                  }
                  ),
                  controller: companyHistoryStartDateController,
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
                    companyHistoryEndDateController.text = text;
                  }
                  ),
                  controller: companyHistoryEndDateController,
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

                //Currently working

                // Please enter your Area of Expertise
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Area of Expertise can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Area of Expertise";
                    }
                  },
                  onChanged: (text) => setState(() {
                    areaOfExpertiseController.text = text;
                  }
                  ),
                  controller: areaOfExpertiseController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Please enter your Area of Expertise*",
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
