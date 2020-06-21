import 'package:flutter/cupertino.dart';

class Quote {
  final int qID;
  final String qText, qAuthor;
  bool isFavorite = false;
  Quote({
    @required this.qAuthor,
    @required this.qID,
    @required this.qText,
  });

  
}