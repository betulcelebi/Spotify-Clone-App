import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../provider/spotify_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

SpotifyProvider? spotifyProvider;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    spotifyProvider!.getCategoryData();
    spotifyProvider!.getCategoryNewRelase();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Ara",
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Sanatçılar, şarkıcılar veya podcastler',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Hepsine göz at",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 70.h,
                  // decoration: const BoxDecoration(color: Colors.red),
                  child: GridView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 32, left: 5, right: 5),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 120),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DetailsPage(categories_id: '${provider.response.categories!.items![index].id}',),
                          //     ));
                        },
                        child: Card(
                          color: Colors.grey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, top: 85),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(provider.response!
                                        .categories!.items![index].icons![0].url
                                        .toString()),
                                    fit: BoxFit.fitWidth),
                                //color: itemsColor[index],
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              '${provider.response!.categories!.items![index].name!.toUpperCase()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
