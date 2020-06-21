
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';
import 'package:quotationapp/widgets/quote_list_view.dart';
import 'favorites_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() { 
    super.initState();
    Future.delayed(Duration.zero,(){
      Provider.of<QuotesProvider>(context).retrive();
    });
  }
  @override
  Widget build(BuildContext context) {
    // final x = Provider.of<QuotesProvider>(context);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Powerful Quotations'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite), 
            onPressed: (){
              // x.retrive();
              Navigator.of(context).pushNamed(FavoriteScreen.route);
            },
            iconSize: 30,
          ),
        //   PopupMenuButton(
            
        //     icon: Icon(Icons.more_vert),
        //     itemBuilder: (_)=>[
        //       PopupMenuItem(child: Text('Favorite Quotes'),value:1),
        //       PopupMenuItem(child: Text('All Quotes'),value:2),

        //     ],
        //   )
        ],
      ),
    
      body: QuoteListview(true),
      
    );
  }
}