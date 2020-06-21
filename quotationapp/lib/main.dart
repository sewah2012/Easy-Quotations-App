import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotationapp/providers/quotes_provider.dart';
import 'package:quotationapp/screens/HomeScreen.dart';
import 'package:quotationapp/screens/detailsScreen.dart';
import 'package:quotationapp/screens/favorites_screen.dart';

void main() => runApp(Manager());

class Manager extends StatefulWidget {
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          builder: (context)=>QuotesProvider(),
          child: MaterialApp(
              title: 'Daily Quote App',
              home: HomeScreen(),
              theme: ThemeData(
              accentColor: Colors.amber,
              primaryColor: Colors.purple,
            ),
            routes: {
              FavoriteScreen.route: (context)=>FavoriteScreen(),
              DetailsScreen.route:(context)=>DetailsScreen(),
            },
          ),
    );
  }
}
