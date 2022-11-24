import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_clone_app/ui/pages/search_page.dart';
import '../../provider/spotify_provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

SpotifyProvider? spotifyProvider;

class _SearchScreenState extends State<SearchScreen> {
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
      builder: (BuildContext context, SpotifyProvider provider, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Ara",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 12),
                          labelText:
                              "Sanatçılar, şarkıcılar veya podcastler..."),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text(
                      "Hepsine göz at",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 80.h,
                    child: GridView.builder(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 32,
                      ),
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 120),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: provider.isLoading == true
                              ? CircularProgressIndicator()
                              : Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 85),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${provider.response?.categories?.items?[index].icons?[0].url}'),
                                          fit: BoxFit.cover,opacity: 0.8,invertColors: true,alignment: Alignment.center ),
                                      //color: itemsColor[index],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    '${provider.response?.categories?.items?[index].name?.toLowerCase()}',
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
