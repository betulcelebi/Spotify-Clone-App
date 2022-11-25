import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_clone_app/service/services.dart';

import '../../provider/spotify_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

SpotifyProvider? spotifyProvider;

class _ProfileScreenState extends State<ProfileScreen> {
  String imageLink =
      "https://mosaic.scdn.co/60/ab67616d0000b2736880235a103031a13ff8c902ab67616d0000b273aa7d2641af0fa4c1f76fafbfab67616d0000b273af8b6adeaa7151aa991fa220ab67616d0000b273ccdb9c22f07f24a773110a87";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    apisFunction();
  }

  apisFunction() async {
    await spotifyProvider!.getUserProfileData();
    await spotifyProvider!.getUserPlaylistData();
  }

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
                      ),
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
                left: 88,
                child: Column(
                  children: [
                    Container(
                      width: 93,
                      height: 93,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Consumer(
                        builder: (context, SpotifyProvider provider, child) {
                          return provider.isLoading == true
                              ? Center(child: CircularProgressIndicator())
                              : Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      "${provider.userProfileResponse?.images![0].url}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                    SizedBox(height: 11),
                    Consumer(
                      builder: (context, SpotifyProvider provider, child) {
                        return provider.isLoading == true
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "${provider.userProfileResponse?.id}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff222222)),
                              );
                      },
                    ),
                    SizedBox(height: 8),
                    Consumer(
                      builder: (context, SpotifyProvider provider, child) {
                        return provider.isLoading == true
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "${provider.userProfileResponse?.displayName}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xff222222)),
                              );
                      },
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    "PUBLIC PLAYLIST",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ),
                Consumer(
                  builder: (context, SpotifyProvider provider, child) {
                    return provider.isLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                provider.userPlaylistResponse?.items?.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 6.h,
                                width: 100.w,
                                child: ListTile(
                                  isThreeLine: true,
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: provider.userPlaylistResponse!
                                                .items![index].images ==
                                            null
                                        ? Container()
                                        : provider
                                                    .userPlaylistResponse
                                                    ?.items?[index]
                                                    .images
                                                    ?.length ==
                                                0
                                            ? Container(
                                                width: 10,
                                                height: 10,
                                              )
                                            : Image.network(
                                                "${provider.userPlaylistResponse?.items?[index].images?[0].url}"),
                                  ),
                                  title: Text(
                                      "${provider.userPlaylistResponse?.items?[index].name}",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 1.8.h,
                                          color: Color(0xff000000))),
                                  subtitle: Text(
                                      "${provider.userPlaylistResponse?.items?[index].owner?.displayName?.toUpperCase()}",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 1.3.h,
                                          color: const Color(0xff000000))),
                                  trailing: SizedBox(
                                    width: 80,
                                    child: Row(
                                      children: [
                                        Text("5:33",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 2.h,
                                                color: Color(0xff000000))),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Color(0xffA68C8C),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
