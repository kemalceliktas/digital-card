import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'card_data.dart';
import 'model/data_model.dart';


class LastPage extends StatefulWidget {
  const LastPage({super.key,required this.cardModel});

 
  final CardModel cardModel;

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  Uint8List? bytes;


  final _screenshotContoller =ScreenshotController();
@override
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text("Your Card is Ready"),
        ),
      floatingActionButton: FloatingActionButton.extended(onPressed:()async{
        
        final image = await _screenshotContoller.capture();
      
        saveImage(image!);
      }, 
      backgroundColor: Colors.amber,
    
      
       label:const Text("SAVE"),icon:const Icon(Icons.camera_alt_outlined),),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 10,),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Thank you",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                    "You saved trees, you can download and share your new digital card now. Have a nice day.",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 18,
                        
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
            ),
            Screenshot(
              controller: _screenshotContoller,
              child: MainCard(cardModel: widget.cardModel,isShadow: false)),
           
          ],
        ),
      ),
    );
  }

  


 /*    void _takeScreenShot() async{
      
      final imageFile = await _screenshotContoller.capture();
      if(imageFile ==null)return;
      await saveImage(imageFile);
      
    }
   */

  /* Future saveAndShare(Uint8List bytes)async {

    final directory =await getApplicationDocumentsDirectory();
    final image =File("${directory.path}/flutter.jpeg");
    image.writeAsBytes(bytes);
    await Share.shareFiles([image.path]);
  } */
  Future<String> saveImage(Uint8List bytes)async{
    await [Permission.storage].request();
    final time  =DateTime.now().toIso8601String().replaceAll(".", "-").replaceAll(":", "-");
    final name ="screenshot$time";
    final result = await ImageGallerySaver.saveImage(bytes,name:name );
    return "TEST";
  }
}