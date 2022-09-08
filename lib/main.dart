import 'package:bulldozer_test_technique_flutter/helpers/constants.dart';
import 'package:bulldozer_test_technique_flutter/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'screens/shift_offerts_screen.dart';
import 'viewmodels/shifts_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator!<ShiftsViewModel>()),
      ],
      child: MaterialApp(
        title: 'Bulldozer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ShiftOffertsScreen(),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF2F2F2),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          bottom: 15.0,
          left: 10.0,
          right: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabs: [
                GButton(
                  backgroundColor: seaSerpent,
                  icon: LineIcons.search,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.white,
                  text: 'Shift Offerts',
                  textColor: Colors.white,
                  textStyle: GoogleFonts.ptSerif(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GButton(
                  backgroundColor: seaSerpent,
                  icon: LineIcons.heart,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.white,
                  text: 'Likes',
                  textColor: Colors.white,
                  textStyle: GoogleFonts.ptSerif(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GButton(
                  backgroundColor: seaSerpent,
                  icon: LineIcons.male,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.white,
                  text: 'Profile',
                  textColor: Colors.white,
                  textStyle: GoogleFonts.ptSerif(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
