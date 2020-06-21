import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';
import 'package:quotationapp/widgets/quote_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  static final String route = '/favorite_screen';

  @override
  Widget build(BuildContext context) {
    final quoteData = Provider.of<QuotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Quotes you Mark favorite',textAlign: TextAlign.center,)
      ),
      body: quoteData.favoriteQuotes.isEmpty ? Center(child: Text('Sorry you have no favorites at the moment. \n please add some!')) :
      QuoteListview(false),
    );
  }
}