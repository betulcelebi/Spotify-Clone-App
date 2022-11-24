import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(69),
                          bottomRight: Radius.circular(69))),
                  child: Image.asset(
                    "assets/billie_eilish.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 25,
                  child: Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/left_chevron.png",
                            color: Colors.white),
                        Image.asset(
                          "assets/more_vertical.png",
                          color: Colors.white,
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                height: 100,
                margin: EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Billie Eilish",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                    Text(" 2 album , 67 track",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xff393939))),
                    SizedBox(
                      width: 265,
                      height: 48,
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Turpis Adipiscing Vestibulum Orci Enim, Nascetur Vitae ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Color(0xff838383),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 29),
              width: 56,
              height: 17,
              child: Text("Albums",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff222222))),
            ),
            Container(
              height: 190,
              margin: EdgeInsets.only(left: 29),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16, top: 17),
                        width: 130,
                        height: 135,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(
                          "assets/libu.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 18),
                          child: Text("Lilbubblegum",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Color(0xff3A3A3A))))
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 26, left: 3.6.h),
              width: 345,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                     
                      child: Text("Songs",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff222222)))),
                  Container(
                   
      
                   
                    child: Text("See more",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Color(0xff131313))),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 190,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    //color: Colors.red,
                    margin: EdgeInsets.only(bottom: 2.5.h, left: 3.6.h),
                    height: 6.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 21.h,
                          height: 6.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 5.h,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffE6E6E6)),
                                child: Image.asset("assets/play.png"),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Don't Smile At Me",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 1.8.h,
                                          color: Color(0xff000000))),
                                  Text("Billie Eilish",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 1.3.h,
                                          color: Color(0xff000000)))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 12.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("5:33",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 1.9.h,
                                      color: Color(0xff000000))),
                              Image.asset("assets/heart.png"),
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
      ),
  
    );
  }
}
