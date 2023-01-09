import 'dart:io';

class CardModel {
  final String title;
  final String job;
  final File? imagePath;
  final String company;
  final String email;
  final String number;
  final String linkedin;
  final String github;

  CardModel({
    required this.title,
    required this.email,
    required this.job,
    this.imagePath,
    required this.company,
    required this.number,
    required this.linkedin,
    required this.github,
  });
}
