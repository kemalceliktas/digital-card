
import 'package:flutter/material.dart';

import '../card_data.dart';
import '../model/data_model.dart';

class MainProvider extends ChangeNotifier {
  final List<CardModel> cardList = [
    CardModel(
      title: "title",
      email: "email",
      job: "job",
      company: "company",
      number: "number",
      linkedin: "kalsd",
      github: "facebook",
    ),
  ];

  

  void createCard(CardModel cardModel) {
    cardList.add(cardModel);
    notifyListeners();
  }


  Widget cardWidget(String objectId,CardModel cardModel) {
    if (objectId=="1") {
      
      return MainCard(cardModel: cardModel,isShadow: true,);
    }
    return SizedBox();

    
  }
  
}
