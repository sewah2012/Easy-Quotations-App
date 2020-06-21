import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';



class QuoteItemDetails extends StatelessWidget {
   final int index;
    QuoteItemDetails(this.index);
 
//  void share(BuildContext context, String text){
//     final RenderBox renderBox = context.findRenderObject();
//     Share.share(text, sharePositionOrigin: renderBox.localToGlobal(Offset.zero) & renderBox.size);
//  }

  // shareData(BuildContext context){
  //   Share.share('Some text here', 
  //     subject: 'Update the coordinate!',
  //     sharePositionOrigin: Rect.fromLTWH(left, top, width, height)
  //   );
  // }

  void copy(BuildContext context, String text){
    FlutterClipboardManager.copyToClipBoard(text).then((result) {
      final snackBar = SnackBar(
        content: Text('Copied to Clipboard'),
        action: SnackBarAction(
          label: 'Done',
          onPressed: () {},
        ),
      );
      
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
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
            
      child: PageView.builder(
        itemCount: quotes.quoteList.length,
        controller: PageController(initialPage: index),
        itemBuilder: (context, ind)=> Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(quotes.quoteList[ind].qText,
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,),
            Text('${quotes.quoteList[ind].qAuthor}',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                letterSpacing: 2.0,
                ),
              ),
                       SizedBox(height: 10,),
                        Text('${ind+1} / ${quotes.quoteList.length}',style: TextStyle(color:Colors.white),),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                         IconButton(icon: quotes.isfavorite(quotes.quoteList[ind].qID) ?  Icon(Icons.favorite, size: 35,color: Colors.white,) : Icon(Icons.favorite_border, size: 35,color: Colors.white,), 
                          onPressed: (){
                            // print(quotes.quoteList[ind].qAuthor);
                            quotes.markFavorite(quotes.quoteList[ind].qID);
                           }
                          ),
                        //  IconButton(icon: Icon(Icons.content_copy,size: 35,color: Colors.white), onPressed: (){}),
                         IconButton(
                           icon: Icon(Icons.content_copy,size: 35,color: Colors.white), 
                          onPressed: (){
                            String text = '${quotes.quoteList[ind].qText} ~ ${quotes.quoteList[ind].qAuthor}';
                            copy(context, text);
                            // print('${quotes.quoteList[ind].qText} ~ ${quotes.quoteList[ind].qAuthor}');
                            // quotes.share(context, '${quotes.quoteList[ind].qText} ~ ${quotes.quoteList[ind].qAuthor}');
                            // final RenderBox renderBox = context.findRenderObject();
                            // Share.share('${quotes.quoteList[ind].qText} ~ ${quotes.quoteList[ind].qAuthor}', sharePositionOrigin: renderBox.localToGlobal(Offset.zero) & renderBox.size);
                          }
                         ),
                       ],)
                    ],
                  ),
      ),
 
        );
  }
}
