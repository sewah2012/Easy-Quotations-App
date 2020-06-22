import 'package:flutter/material.dart';
import 'package:quotationapp/widgets/quote_item_detail.dart';

class DetailsScreen extends StatelessWidget {
  static final route = '/details_screen';
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
     appBar: AppBar(
       title: Text('Swipe left/right'),
       centerTitle: true,
     ),
     body: Container(
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/imgs/eman.jpg'),fit: BoxFit.cover) ),
       child:QuoteItemDetails(id),
      ),
    );
  }
}