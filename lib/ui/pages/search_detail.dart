import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone_app/provider/spotify_provider.dart';
import 'package:spotify_clone_app/ui/pages/search_page.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({super.key});

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

SpotifyProvider? spotifyProvider;

class _SearchDetailPageState extends State<SearchDetailPage> {
  @override
  void initState() {
    super.initState();
    spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    apisFunction();
  }

  apisFunction() async {
    await spotifyProvider!.getSearchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Consumer(
          builder: (context, SpotifyProvider provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                       
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 212, 209, 209)),
                        child: Image.asset("assets/left_chevron.png",
                            color: const Color(0xff545454)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(),
                      width: 350,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            provider.getQueryData("bet??l");
                          } else {
                            provider.getQueryData(value);
                          }
                        },
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                            labelText:
                                "Sanat????lar, ??ark??c??lar veya podcastler..."),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Artists"),
                    SizedBox(height: 10),
                    Container(
                     
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          itemCount:
                              provider.searchResponse?.artists?.items?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return provider.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.transparent,
                                  ))
                                : ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(
                                        "${provider.searchResponse?.artists?.items?[index].name??"dfdsfsdg"}"),
                                    leading: CircleAvatar(
                                      foregroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          "${provider.searchResponse?.artists?.items?[index].images?[0].url}??"""),
                                    ));
                          },
                        ),
                      ),
                    ),
                    // Text("Albums"),
                    // SizedBox(height: 10),
                    // Container(
                    //   child: SizedBox(
                    //     height: 150,
                    //     child: ListView.builder(
                    //       padding: EdgeInsets.all(0),
                    //       itemCount: 2,
                    //       itemBuilder: (context, index) {
                    //         return ListTile(
                    //           contentPadding: EdgeInsets.all(0),
                    //           title: Text(
                    //               "${provider.searchResponse?.tracks?.items?[index].name}"),
                    //           leading: CircleAvatar(
                    //               child: Image.network(
                    //                   "${provider.searchResponse?.tracks?.items?[index].album?.images?[0].url}")),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
