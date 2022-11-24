import 'package:google_fonts/google_fonts.dart';
import "package:spotify_clone_app/ui/pages/home_page.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
      print(index);
    });
  }

  List<String> songList = ["News", "Video", "Artists", "Podcast"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/search.png"),
                    Image.asset("assets/spotify.png"),
                    Image.asset(
                      "assets/more_vertical.png",
                      color: Color(0xff7D7D7D),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 20, top: 105),
                child: Stack(
                  children: [
                    Container(
                      width: 340,
                      height: 118,
                      decoration: BoxDecoration(
                          color: Color(0xff42C83C),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 14, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("New album",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xffFBFBFB),
                                    fontWeight: FontWeight.w500)),
                            Container(
                                width: 147,
                                height: 52,
                                child: Text("Happier Than Ever",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffFBFBFB),
                                        fontWeight: FontWeight.w700))),
                            Text("Billie Eilish",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xffFBFBFB),
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 200,
                        bottom: 0,
                        child: Image.asset("assets/union.png"))
                  ],
                ),
              ),
              Positioned(
                  bottom: 0, left: 25, child: Image.asset("assets/woman.png")),
            ],
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 35),
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8, top: 42),
                  width: 80,
                  height: 30,
                  child: Stack(
                    children: [
                      Text(
                        songList[index],
                        style: GoogleFonts.roboto(
                            color: currentIndex == index
                                ? Colors.black
                                : Color(0xffBEBEBE),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 2),
                      Positioned(
                          bottom: 0,
                          left: 10,
                          child: Image.asset("assets/green-rec.png", color: currentIndex== index? Color(0xff42C83C): Colors.transparent,))
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 31),
          SizedBox(
            height: 240,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 28),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 14,
                      ),
                      width: 148,
                      height: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent),
                      child: Image.asset("assets/badguy.png"),
                    ),
                    Positioned(
                      top: 170,
                      left: 110,
                      child: Container(
                        alignment: Alignment.center,
                        width: 29,
                        height: 29,
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6), shape: BoxShape.circle),
                        child: Image.asset("assets/play.png"),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bad Guy",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Billie Eilish",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 13))
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 37),
          Container(
            margin: EdgeInsets.only(left: 28, right: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Playlist",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 20)),
                Text("See More",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 12))
              ],
            ),
          ),
          SizedBox(height: 23),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 28),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 30, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  color: Color(0xffE6E6E6),
                                  shape: BoxShape.circle),
                              child: Image.asset("assets/play.png"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("As It Was",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                SizedBox(height: 5),
                                Text("Harry Styles",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("5:33",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                            Image.asset("assets/solid-like.png")
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
