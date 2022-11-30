import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_clone_app/provider/spotify_provider.dart';
import 'package:spotify_clone_app/ui/pages/album_page.dart';
import 'package:spotify_clone_app/ui/pages/search_page.dart';
import 'package:spotify_clone_app/ui/pages/profile_page.dart';
import 'package:spotify_clone_app/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<SpotifyProvider>(
              create: (_) => SpotifyProvider(),
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(
              title: "",
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  onTap(index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  final List<Widget> screens = [
    //Sayfaların liste içerisinde tanımlanması
    const HomeScreen(),
    const SearchScreen(),
    const AlbumScreen(
      id: "3cEYpjA9oz9GiPac4AsH4n",
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home.png",
                color:
                    selectedIndex == 0 ? Color(0xff1ED760) : Color(0xff808080),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/discovery.png",
                color:
                    selectedIndex == 1 ? Color(0xff1ED760) : Color(0xff808080),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/heart.png",
                color:
                    selectedIndex == 2 ? Color(0xff1ED760) : Color(0xff808080),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/profile.png",
                color:
                    selectedIndex == 3 ? Color(0xff1ED760) : Color(0xff808080),
              ),
              label: ""),
        ],
      ),
    );
  }
}
