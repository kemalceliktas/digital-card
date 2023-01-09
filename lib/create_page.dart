import 'dart:io';
import 'dart:math';
import 'package:card_app_last/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'last_page.dart';
import 'model/data_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({
    super.key,
    required this.objectId,
  });
  final String objectId;

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController titleEditingContoller;
  late TextEditingController job;
  late TextEditingController company;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController linkedin;
  late TextEditingController github;

  late CardModel cardModel;

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  String text = "TEST";
  @override
  void initState() {
    // TODO: implement initState
    titleEditingContoller = TextEditingController();
    job = TextEditingController();
    company = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    linkedin = TextEditingController();
    github = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // create some values
   

    final provider = context.watch<MainProvider>();
    cardModel = CardModel(
        title: titleEditingContoller.text.isEmpty
            ? "Name"
            : titleEditingContoller.text,
        email: email.text.isEmpty ? "e-mail":email.text,
        job: job.text.isEmpty?"Job":job.text,
        company: company.text.isEmpty ? "Company":company.text,
        number: phone.text.isEmpty ?"Phone":phone.text,
        linkedin: linkedin.text.isEmpty ?"Linkedin":linkedin.text,
        github: github.text.isEmpty ? "Github":github.text,
        imagePath: image,
       
        );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text("Create Your Digital Card"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                   

                    setState(() {});
                  },
                  maxLength: 30,
                  controller: titleEditingContoller,
                  decoration: const InputDecoration(
                      counterText: "",
                    
                    label: Text("Name"),
                    hintText: "Your name is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    

                    setState(() {});
                  },
                  controller: job,
                  maxLength: 30,
                  decoration: const InputDecoration(
                      counterText: "",
                   
                    label: Text("Your Job"),
                    hintText: "Your job is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    text = value;

                    setState(() {});
                  },
                  controller: company,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      counterText: "",
                  
                    label: Text("Company"),
                    hintText: "Company name is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    text = value;

                    setState(() {});
                  },
                  controller: phone,
                  maxLength: 13,
                  decoration: const InputDecoration(
                      counterText: "",
                   
                    label: Text("Phone"),
                    hintText: "Phone number is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    text = value;

                    setState(() {});
                  },
                  controller: email,
                  maxLength: 25,
                  decoration: const InputDecoration(
                      counterText: "",
                 
                    label: Text("Email"),
                    hintText: "Your email is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    text = value;

                    setState(() {});
                  },
                  controller: linkedin,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      counterText: "",
                 
                    label: Text("Linkedin-optional"),
                    hintText: "Your linkedin is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    text = value;

                    setState(() {});
                  },
                  controller: github,
                  maxLength: 20,
                  
                  decoration: const InputDecoration(
                    counterText: "",
              
                    label: Text("Github-optional"),
                    hintText: "Your Github link is here...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  pickImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.amber,
                    child: const Center(
                        child: Text(
                      "Pick Image",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )),
                  ),
                ),
              ),
              
              provider.cardWidget("1", cardModel),
              InkWell(
                onTap: () {
                  setState(() {
                    cardModel = CardModel(
                      title: titleEditingContoller.text,
                      email: email.text,
                      job: job.text,
                      company: company.text,
                      number: phone.text,
                      linkedin: linkedin.text,
                      github: github.text,
                      imagePath: image,
                     
                    );
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LastPage(
                            cardModel: cardModel,
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 100,
                    color: Colors.amber,
                    child: const Center(
                        child: Text(
                      "NEXT",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )),
                  ),
                ),
              ),
             
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
