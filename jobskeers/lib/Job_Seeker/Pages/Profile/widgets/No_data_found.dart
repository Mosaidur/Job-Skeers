import 'package:flutter/cupertino.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(

          children: [

            SizedBox(height: 30,),

            Image.asset("assets/images/No_data_found.png",height: 250,),

            SizedBox(height: 15,),

            Text(
              "There is currently no Data",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 10,),

            Text(
              "Add your information & kindly click the following Button.",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],

        ),
      ),

    );
  }
}
