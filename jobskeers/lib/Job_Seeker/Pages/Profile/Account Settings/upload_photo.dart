import 'package:flutter/material.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {

    final String image= "";

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Upload Photo"),

            InkWell(
              onTap: (){},
              child: Icon(Icons.delete),
            )
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [

                    SizedBox(height: 40,),

                    (image.isEmpty) ?
                    InkWell(
                      onTap: (){},
                        child: Container(
                          height: 180,
                            width: 180,
                            child: Image.asset("assets/icons/man_logo.png")))
                        :
                    InkWell(
                          onTap: (){},
                          child: Container(
                            child: Image.asset(image))),

                    SizedBox(height: 20,),



                    (image.isEmpty) ?
                    Text(
                      "You haven't upload photo yet.",
                      style: TextStyle(
                        // color: Color(0xff1891D9),
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    :
                    Text(
                      "You can change or delete your photo.",
                      style: TextStyle(
                        // color: Color(0xff1891D9),
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    SizedBox(height: 20,),




                    (image.isEmpty) ?
                    //upload photo button
                    InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (c) => BrowseJobslistPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        // height: 40,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:Color(0xff1891D9),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10,),
                            Icon(Icons.cloud_upload,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text(
                              "Upoald Photo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    )
                        :
                    //Edit photo button
                    InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (c) => BrowseJobslistPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        // height: 40,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:Color(0xff1891D9),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10,),
                            Icon(Icons.edit,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text(
                              "Edit Photo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
