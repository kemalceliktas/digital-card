
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_data.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int deger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 158, 208, 213),
        isExtended: true,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePage(
                    objectId: "1",
                  )));
        },
        child: const Icon(Icons.add),
      ),
     
      appBar: AppBar(
       
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text("Digital Card"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Save Trees",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
           
                color:const Color.fromARGB(255, 6, 129, 11),
                child: Text(
                  "Save The World",
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                    "Click the button below, upload your photo, enter your information and your digital card is ready to use, protect your money and trees.",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 18,
                        
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.amber,
                child: Text(
                  "FREE",
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1),
                ),
              ),
            ),
            SembolCard(
              title: "title",
              fun: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreatePage(
                          objectId: "1",
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
