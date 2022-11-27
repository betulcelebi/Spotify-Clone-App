import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_clone_app/utils/time_convert.dart';
import '../../provider/spotify_provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key, required this.id});
  final String id;

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

SpotifyProvider? spotifyProvider;

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    apisFunction();
  }

  apisFunction() async {
    await spotifyProvider!.getArtistIdData();
    await spotifyProvider!.getArtistAlbumData();
    await spotifyProvider!.getArtistTopTracksData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Consumer(builder: (context, SpotifyProvider provider, child) {
            return provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          JelloIn(
                            delay: Duration(seconds: 1),
                            child: Container(
                              margin: EdgeInsets.only(top: 3.h),
                              width: double.infinity,
                              height: 240,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${provider.artistIdResponse?.images?[0].url}"),
                                      fit: BoxFit.cover),
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(69),
                                      bottomRight: Radius.circular(69))),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 25,
                            child: SizedBox(
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          margin: const EdgeInsets.only(top: 12),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${provider.artistAlbumResponse?.items?[0].artists?[0].name}",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20)),
                              Text(
                                  "${provider.artistAlbumResponse?.items?[0].name} Album ${provider.artistAlbumResponse?.items?[0].totalTracks} Track",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: const Color(0xff393939))),
                              SizedBox(
                                width: 265,
                                height: 48,
                                child: Text(
                                  "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Turpis Adipiscing Vestibulum Orci Enim, Nascetur Vitae ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xff838383),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 29),
                        width: 56,
                        height: 17,
                        child: Text("Albums",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color(0xff222222))),
                      ),
                      Container(
                        height: 190,
                        margin: const EdgeInsets.only(left: 29),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              provider.artistAlbumResponse?.items?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SlideInLeft(
                                  duration: Duration(seconds: 2),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 16, top: 17),
                                    width: 130,
                                    height: 135,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${provider.artistAlbumResponse?.items?[index].images?[0].url}"),
                                            fit: BoxFit.cover),
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                                Container(
                                    width: 110,
                                    //color: Colors.amber,
                                    margin: const EdgeInsets.only(
                                        top: 18, right: 10),
                                    child: Text(
                                      "${provider.artistAlbumResponse?.items?[index].name}",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: const Color(0xff3A3A3A)),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 3.6.h),
                        width: 340,
                        height: 25,
                        //color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Songs",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: const Color(0xff222222))),
                            Text("See more",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: const Color(0xff131313))),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 420,
                        height: 200,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount:
                              provider.artistTopTracksResponse?.tracks?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 60,
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 28, right: 30),
                                isThreeLine: true,
                                minVerticalPadding: 1,
                                minLeadingWidth: 1,
                                enabled: true,
                                leading: Container(
                                  alignment: Alignment.center,
                                  width: 5.h,
                                  height: 5.h,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffE6E6E6),
                                      shape: BoxShape.circle),
                                  child: Image.asset("assets/play.png"),
                                ),
                                title: Text(
                                  "${provider.artistTopTracksResponse?.tracks?[index].album?.name}",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 1.8.h,
                                      color: const Color(0xff000000)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  "${provider.artistTopTracksResponse?.tracks?[index].artists?[0].name}",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 1.3.h,
                                      color: const Color(0xff000000)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: SizedBox(
                                  width: 95,
                                  //color: Colors.amber,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          TimeConvert()
                                              .milisecontToSecondAndMinute(
                                                  provider
                                                      .artistTopTracksResponse
                                                      ?.tracks?[index]
                                                      .durationMs),
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 1.9.h,
                                              color: const Color(0xff000000))),
                                      Image.asset("assets/heart.png")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
          })),
    );
  }
}
