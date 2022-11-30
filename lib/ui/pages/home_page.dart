import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_clone_app/ui/pages/album_page.dart';
import "package:spotify_clone_app/ui/pages/home_page.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/spotify_provider.dart';
import '../../utils/time_convert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

SpotifyProvider? spotifyProvider;

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
      print(index);
    });
  }

  @override
  void initState() {
    super.initState();
    spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    apisFunction();
  }

  apisFunction() async {
    await spotifyProvider!.getFuturePlaylistData();
    spotifyProvider!.getPlaylistIdData(
        spotifyProvider!.futurePlaylistResponse?.playlists?.items?.first.id);
  }

  List<String> songList = ["News", "Video", "Artists", "Podcast"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //  physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Consumer(
              builder: (context, SpotifyProvider provider, child) {
                return provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/search.png"),
                                Image.asset("assets/spotify.png"),
                                Image.asset(
                                  "assets/more_vertical.png",
                                  color: const Color(0xff7D7D7D),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 36, right: 20, top: 105),
                            child: Stack(
                              children: [
                                Container(
                                  width: 340,
                                  height: 118,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff42C83C),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SizedBox(
                                    height: 90,
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          left: 19, top: 14, bottom: 16),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("New album",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffFBFBFB),
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                              "${provider.futurePlaylistResponse?.playlists?.items?[0].name}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xffFBFBFB),
                                                  fontWeight: FontWeight.w700)),
                                          Text(
                                              "${provider.futurePlaylistResponse?.playlists?.items?[0].name}",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xffFBFBFB),
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 220,
                                    bottom: 0,
                                    child: Image.asset("assets/union.png"))
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 200,
                              child: SizedBox(
                                width: 34.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.sp),
                                  child: FadeInDown(
                                    delay: const Duration(seconds: 1),
                                    child: Image.network(
                                        "${provider.futurePlaylistResponse?.playlists?.items?[0].images?[0].url}"),
                                  ),
                                ),
                              )),
                        ],
                      );
              },
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 35),
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8, top: 42),
                    width: 80,
                    height: 30,
                    child: Stack(
                      children: [
                        Text(
                          songList[index],
                          style: GoogleFonts.roboto(
                              color: currentIndex == index
                                  ? Colors.black
                                  : const Color(0xffBEBEBE),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        Positioned(
                            bottom: 0,
                            left: 10,
                            child: Image.asset(
                              "assets/green-rec.png",
                              color: currentIndex == index
                                  ? const Color(0xff42C83C)
                                  : Colors.transparent,
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 31),
            Consumer(
              builder: (context, SpotifyProvider provider, child) {
                return provider.isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 240,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 28),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: provider
                              .futurePlaylistResponse?.playlists?.items?.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                provider.getPlaylistIdData(provider
                                    .futurePlaylistResponse
                                    ?.playlists
                                    ?.items?[index]
                                    .id);
                              },
                              child: SlideInLeft(
                                delay: Duration(seconds: 1),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 14,
                                      ),
                                      width: 148,
                                      height: 185,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${provider.futurePlaylistResponse?.playlists?.items?[index].images?.first.url}"),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                      top: 170,
                                      left: 110,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffE6E6E6),
                                            shape: BoxShape.circle),
                                        child: Image.asset("assets/play.png"),
                                      ),
                                    ),
                                    Positioned(
                                      top: 200,
                                      left: 15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${provider.futurePlaylistResponse?.playlists?.items?[index].name}",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "${provider.futurePlaylistResponse?.playlists?.items?[index].description}",
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(height: 37),
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(left: 28, right: 29),
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
            Consumer(
              builder: (context, SpotifyProvider provider, child) {
                return provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        //height: 200,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          itemCount: provider
                                  .playlistIdResponse?.tracks?.items?.length ??
                              1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AlbumScreen(
                                        id: "${provider.playlistIdResponse?.tracks?.items?[index].track?.artists?.first.id}"),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 60,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.only(
                                      left: 28, right: 30),
                                  isThreeLine: true,
                                  minVerticalPadding: 1,
                                  minLeadingWidth: 1,
                                  enabled: true,
                                  leading: Container(
                                    alignment: Alignment.center,
                                    width: 38,
                                    height: 38,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE6E6E6),
                                        shape: BoxShape.circle),
                                    child: Image.asset("assets/play.png"),
                                  ),
                                  title: Text(
                                    provider
                                            .playlistIdResponse
                                            ?.tracks
                                            ?.items?[index]
                                            .track
                                            ?.album
                                            ?.name ??
                                        "",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    provider
                                            .playlistIdResponse
                                            ?.tracks
                                            ?.items?[index]
                                            .track
                                            ?.artists
                                            ?.first
                                            .name ??
                                        "",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Container(
                                    width: 100,
                                    //color: Colors.amber,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            TimeConvert()
                                                .milisecontToSecondAndMinute(
                                                    provider
                                                        .playlistIdResponse
                                                        ?.tracks
                                                        ?.items?[index]
                                                        .track
                                                        ?.durationMs),
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15)),
                                        Image.asset("assets/solid-like.png")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
