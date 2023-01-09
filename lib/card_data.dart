import 'dart:io';

import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:icon_forest/amazingneoicons.dart';

import 'model/data_model.dart';

class CardData {
 
}




//OBJECT ID:1
class MainCard extends StatelessWidget {
  const MainCard({super.key,required this.cardModel, required this.isShadow});

  final bool isShadow;
  
 
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      
      child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                      Color.fromARGB(255, 24, 28, 34),
                        Color.fromARGB(255, 158, 208, 213),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                   isShadow ? BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: const Offset(0, 7), // changes position of shadow
                    ):const BoxShadow(),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            
                            radius: 45,
                            backgroundColor: Color(0xFFF2DEBA),
                            child:cardModel.imagePath !=null ? CircleAvatar(
                              radius: 40,
                              backgroundImage:

                                  FileImage(cardModel.imagePath!),
                                  
                            ):CircleAvatar(
                              radius: 40,
                              backgroundImage:

                                  AssetImage("assets/images/profile.jpg"),
                                  
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardModel.title,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 29,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                color: Colors.amber,
                                child: Text(cardModel.job,
                                    style: TextStyle(
                                      color: Color(0xFF393E46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(cardModel.company,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 1, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          Divider(
                            color: Color.fromARGB(255, 255, 255, 255),
                            thickness: 0.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      cardModel.number,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            
                               Expanded(
                                 child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      cardModel.email,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                                           ),
                               ),
                            ],
                          ),
    
                          SizedBox(height: 5,),
                            Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      AkarIcons.linkedin_box_fill,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      cardModel.linkedin,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                           
                               Expanded(
                                 child: Row(
                                  children: [
                                    Icon(
                                      BootstrapIcons.github,
                                      color: Color.fromARGB(255, 251, 251, 251),
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      cardModel.github,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12,
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
                  ],
                ),
              ),
    );
  }
}




class SembolCard extends StatelessWidget {
  const SembolCard({super.key, required this.title, required this.fun, this.path, });
   final String title;
  
  final Function fun;
  final File? path;
 

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => fun(),
      child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 24, 28, 34),
                        Color.fromARGB(255, 158, 208, 213),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            
                            radius: 45,
                            backgroundColor: Color(0xFFF2DEBA),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("assets/images/profile.jpg"),
                                  
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 29,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                color: Colors.amber,
                                child: Text("Web Developer",
                                    style: TextStyle(
                                      color: Color(0xFF393E46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ))),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Apple",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 250, 250),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 1, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          Divider(
                            color: Color.fromARGB(255, 255, 255, 255),
                            thickness: 0.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 18,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "+90 555 555 55 55",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                               Expanded(
                                 child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 18,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "test@gmail.com",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                                           ),
                               ),
                            ],
                          ),
    
                          SizedBox(height: 5,),
                            Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Color.fromARGB(255, 241, 241, 241),
                                      size: 18,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "@johndoe",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                               Expanded(
                                 child: Row(
                                  children: [
                                    Icon(
                                      Icons.video_call,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 18,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "johndoeskybe",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
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
                  ],
                ),
              ),
    );
  }
}