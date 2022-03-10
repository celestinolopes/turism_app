import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_flutter/app/data/places.dart';
import 'package:challenge_flutter/app/theme/texttheme.dart';
import 'package:challenge_flutter/app/views/place_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: TravelTheme.theme,
      home: FeedScreen(),
    );
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: TravelPlace.places.length,
        itemExtent: 350,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return PlaceDetailScreen(
                      travelPlace: place,
                      screenHeight: MediaQuery.of(context).size.height,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    place.imagesUrl!.first,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(place.user!.urlPhoto!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.user!.name!,
                            style: context.bodyText1!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Ontem as 4:35 pm",
                            style: context.bodyText1!.copyWith(
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    place.name!,
                    style: context.headline2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: place.statusTag == StatusTag.popular
                            ? [Colors.cyan, Colors.blue]
                            : [
                                Colors.amber,
                                Colors.orange.shade400,
                              ],
                      ),
                    ),
                    child: Text(
                      place.statusTag == StatusTag.popular
                          ? "Em destaque"
                          : "Recente",
                      style: context.headline6!
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      TextButton.icon(
                        label: Text(place.likes.toString()),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: StadiumBorder(),
                        ),
                        icon: Icon(CupertinoIcons.heart),
                      ),
                      TextButton.icon(
                        label: Text(place.shared.toString()),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: StadiumBorder(),
                        ),
                        icon: Icon(CupertinoIcons.reply),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
