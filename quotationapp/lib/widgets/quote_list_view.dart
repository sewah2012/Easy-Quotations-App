
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';
import 'package:quotationapp/screens/detailsScreen.dart';
import 'package:quotationapp/widgets/quote_item.dart';

class QuoteListview extends StatelessWidget {
  final bool isAllQuotes;
  QuoteListview(this.isAllQuotes);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuotesProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/imgs/eman.jpg'),
            fit: BoxFit.cover,
            ),
          ),
      child: ListView.builder(
        itemCount: isAllQuotes ? data.quoteList.length : data.favoriteQuotes.length,
        itemBuilder: (context, index) => GestureDetector(
           onTap: (){
                  Navigator.of(context).pushNamed(DetailsScreen.route,arguments:index);
                  //  data.quoteList[index].qID
                },
          child: QuoteItem(index,isAllQuotes),
        )
      ),
    );
  }
}