import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';


class QuoteItem extends StatelessWidget {
   final int index;
   final bool isHome;
    QuoteItem(this.index, this.isHome);
 
 
  @override
  Widget build(BuildContext context) {
    final quotes = Provider.of<QuotesProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black54, 
      ),
           
      width: double.infinity,
      margin: EdgeInsets.all(10),
            
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              isHome ? quotes.quoteList[index].qText : quotes.favoriteQuotes[index].qText,
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            isHome ? quotes.quoteList[index].qAuthor : quotes.favoriteQuotes[index].qAuthor,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
              letterSpacing: 2.0,
              ),
            ),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                       IconButton(
                         icon: isHome ? quotes.isfavorite(quotes.quoteList[index].qID) ?  Icon(Icons.favorite, size: 35,color: Colors.white,) : Icon(Icons.favorite_border, size: 35,color: Colors.white,): 
                         Icon(Icons.favorite, size: 35,color: Colors.white),
                        onPressed: (){
                          isHome ? quotes.markFavorite(quotes.quoteList[index].qID) : quotes.markFavorite(quotes.favoriteQuotes[index].qID);
                         }
                        ),
                      //  IconButton(icon: Icon(Icons.content_copy,size: 35,color: Colors.white), onPressed: (){}),
                       IconButton(
                          icon: Icon(Icons.share,size: 35,color: Colors.white), 
                          onPressed: ()=>quotes.share(context, '${quotes.quoteList[index].qText} ~ ${quotes.quoteList[index].qAuthor}'),

                        ),
                    
                     ],)
                  ],
                ),
 
        );
  }
}
