import 'package:flutter/material.dart';
import 'favourites.dart';
import 'home.dart';
import 'settings.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const RootPage(),
    );
  }
  
}


class RootPage extends StatefulWidget {
  

  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _icondark = Icons.nightlight;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
 primarySwatch: Colors.deepOrange,
 brightness: Brightness.dark,
);

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
   String searchValue = '';
  final List<String> _suggestions = ['pahaa ruokaa helposti', 'kova nälkä on','helppo ruoka alle 1 euro'];
  List<Widget> pages =   [
    
    home(),
    const Favourites(),
    const settings()
    
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: _iconbool ? _darkTheme : _lightTheme,
       home: Scaffold(

         appBar: EasySearchBar(
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions,
        title: const Text('ezfood'),
        actions: [
          IconButton(onPressed:(){
              setState(() {
                _iconbool = !_iconbool;
              });
            } , icon: Icon(_iconbool ? _icondark : _iconLight))
          ],
      ),
      body: pages[currentPage],

        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Favourites'),
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),  
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
    ));
  }
}