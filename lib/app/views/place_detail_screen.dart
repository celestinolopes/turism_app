import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_flutter/app/data/places.dart';
import 'package:challenge_flutter/app/theme/texttheme.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    @required this.travelPlace,
    required this.screenHeight,
  }) : super(key: key);
  final TravelPlace? travelPlace;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  ScrollController? _controller;
  @override
  void initState() {
    _controller =
        ScrollController(initialScrollOffset: widget.screenHeight * .3);

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: BuilderPersistentDelegate(
              maxExtent: MediaQuery.of(context).size.height,
              minExtent: 240,
              builder: (percent) {
                final topPercent = ((1 - percent / .7).clamp(0.0, 1.0));
                final bootomPercent = (percent / .3).clamp(0.0, 1.0);
                final topPadding = MediaQuery.of(context).padding.top;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRect(
                      child: Stack(children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: (20 + topPadding) * (1 - bootomPercent),
                            bottom: 160 * (1 - bootomPercent),
                          ),
                          child: Transform.scale(
                            scale: lerpDouble(1, 1.3, bootomPercent)!,
                            child: Column(
                              children: [
                                Expanded(
                                  child: PageView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    controller:
                                        PageController(viewportFraction: .9),
                                    itemCount:
                                        widget.travelPlace!.imagesUrl!.length,
                                    itemBuilder: (context, index) {
                                      final imageUrl =
                                          widget.travelPlace!.imagesUrl![index];
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 10)
                                          ],
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              imageUrl,
                                            ),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black26,
                                              BlendMode.darken,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    widget.travelPlace!.imagesUrl!.length,
                                    (index) => Container(
                                      color: Colors.black12,
                                      height: 3,
                                      width: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: -60 * (1 - bootomPercent),
                          top: topPadding,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -60 * (1 - bootomPercent),
                          top: topPadding,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: 50,
                          child: Text(
                            widget.travelPlace!.name!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                    ),
                    Positioned.fill(
                      top: null,
                      child: Container(
                          height: 140,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          child: TranslateAnimation(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline),
                                  label: Text(
                                    widget.travelPlace!.likes.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.reply_outlined),
                                  label: Text(
                                    widget.travelPlace!.shared.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.check_circle_outline),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue.shade100,
                                    primary: Colors.blue.shade700,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  label: Text(
                                    "Visitar",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Positioned.fill(
                      top: null,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 70,
                          color: Colors.white,
                          child: UserInfo(travelPlace: widget.travelPlace)),
                    )
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          widget.travelPlace!.locationDesk!,
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(height: 9),
                    Text(widget.travelPlace!.description!),
                    SizedBox(height: 9),
                    Text(widget.travelPlace!.description!),
                    SizedBox(height: 9),
                    Text(widget.travelPlace!.description!),
                    SizedBox(height: 9),
                    Text(widget.travelPlace!.description!),
                    SizedBox(height: 14),
                    Text(
                      "MAIS IMAGENS DA CIDADE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14),
                  ],
                )),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 160,
            child: ListView.builder(
                itemExtent: 150,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.travelPlace!.imagesUrl!.length,
                itemBuilder: (context, index) {
                  final collectionPlace = widget.travelPlace!.imagesUrl![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FullScreenWidget(
                          child: Center(
                            child: CachedNetworkImage(
                              width: 300,
                              height: 300,
                              imageUrl: collectionPlace,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  );
                }),
          )),
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(height: 30),
            ],
          ))
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.travelPlace,
  }) : super(key: key);

  final TravelPlace? travelPlace;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
              CachedNetworkImageProvider(travelPlace!.user!.urlPhoto!),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              travelPlace!.name!,
              style: context.bodyText1!.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Ontem às 4:34 pm",
              style: context.bodyText1!.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "+ Seguir",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate(
      {required double maxExtent, required double minExtent, this.builder})
      : _maxExtent = maxExtent,
        _minExtent = minExtent;
  final double? _maxExtent;
  final double? _minExtent;
  final Widget Function(double percent)? builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder!(shrinkOffset / _maxExtent!);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxExtent!;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtent!;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (context, value, _) {
        return Transform.translate(
          offset: Offset(0, 100 * value),
          child: child,
        );
      },
    );
  }
}
