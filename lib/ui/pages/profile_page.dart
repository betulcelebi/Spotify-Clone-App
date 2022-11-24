import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(69),
                        bottomRight: Radius.circular(69))),
              ),
              Positioned(
                top: 40,
                left: 25,
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 212, 209, 209)),
                        child: Image.asset("assets/left_chevron.png",
                            color: Color(0xff545454)),
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.roboto(
                            color: Color(0xff383838),
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Image.asset(
                        "assets/more_vertical.png",
                        color: Color(0xff545454),
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 2,
                  child: Image.asset("assets/union-left.png")),
              Positioned(
                top: 80,
                left: 90,
                child: Column(
                  children: [
                    Container(
                      width: 93,
                      height: 93,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Image.asset(
                        "assets/profile-img.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 11),
                    Text(
                      "soroushnorozyui@gmail.com",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff222222)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Soroushnrz",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xff222222)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "778",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xff222222)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Followes",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff585858)),
                            )
                          ],
                        ),
                        SizedBox(width: 123),
                        Column(
                          children: [
                            Text(
                              "243",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xff222222)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Followes",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff585858)),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              "PUBLIC PLAYLIST",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ),
          Container(
            width: 370,
            height: 400,
            child: ListView.builder(
              itemCount: 6,
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
                        width: 22.h,
                        height: 6.h,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(0xffE6E6E6)),
                              child: Image.asset(
                                "assets/music.png",
                                fit: BoxFit.cover,
                              ),
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
                            Icon(
                              Icons.more_horiz,
                              color: Color(0xffA68C8C),
                            )
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
