import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../loading_page.dart';
import 'Add_links.dart';
import 'Edit_links.dart';

class OtherProfileLinks extends StatefulWidget {
  const OtherProfileLinks({super.key});

  @override
  State<OtherProfileLinks> createState() => _OtherProfileLinksState();
}

class _OtherProfileLinksState extends State<OtherProfileLinks> {
  @override
  Widget build(BuildContext context) {

    final String website = " ";
    final String facebook = " ";
    final String linkedin = " ";
    final String github = " ";
    final String otherLink = " ";


    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Links"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_Links() ));
              },
              child: Icon(Icons.add_comment),
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
          children: [

            // Other Profile Links
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20,right: 20,bottom: 20),
              child: Container(
                width: double.maxFinite,
                // height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Profile Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Profile Links",
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit_links() ));
                            },
                            child: Icon(Icons.edit_note_sharp),
                          )

                        ],
                      ),
                      SizedBox(height: 15,),

                      // Website Link
                      Text(
                        "Website Link",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () async {

                          final url = Uri.parse(website);
                          LoadingPage();
                          if (await launchUrl(
                              url,
                              mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Text(
                          website,
                          softWrap: true,
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Facebook Link
                      Text(
                        "Facebook Link",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () async {

                          final url = Uri.parse(facebook);
                          LoadingPage();
                          if (await launchUrl(
                            url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Text(
                          website,
                          softWrap: true,
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Linked In Link
                      Text(
                        "LinkedIn Link",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () async {

                          final url = Uri.parse(linkedin);
                          LoadingPage();
                          if (await launchUrl(
                            url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Text(
                          website,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      // GitHub Link
                      Text(
                        "GitHub Link",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () async {

                          final url = Uri.parse(github);
                          LoadingPage();
                          if (await launchUrl(
                            url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Text(
                          website,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Other Link
                      Text(
                        "Other Link",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () async {

                          final url = Uri.parse(otherLink);
                          LoadingPage();
                          if (await launchUrl(
                            url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Text(
                          website,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),



                    ],

                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
