import 'package:flutter/material.dart';
import '../core/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final int _expandedAppBarHeight = 240;
  late ScrollController _scrollController;
  double _appBarCardsOpacity = 1;
  double _scrollControllerOffset = 0.0;
  Color _appBarTextColor = Colors.white;
  Color _appBarBackCircletColor = Colors.white.withOpacity(0.2);

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: RefreshIndicator(
            color: Colors.blue,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 3));
              return;
            },
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerUp: (_) => animateScroll(),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    collapsedHeight: 70,
                    expandedHeight: 240,
                    leading: null,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    backgroundColor: Colors.white,
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          // Weather
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _appBarBackCircletColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.cloud_outlined,
                                      color: _appBarTextColor,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  '6\xb0',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: _appBarTextColor
                                  ),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(width: 12,),

                          // AQI
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _appBarBackCircletColor,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'AQI',
                                          style: TextStyle(
                                            color: _appBarTextColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width: 12,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(0xff, 0, 150, 100),
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: _appBarTextColor
                                  ),
                                )
                              ],
                            ),
                          ),

                          const Spacer(),

                          // Profile
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.account_circle,
                                  size: 64,
                                  color: Colors.grey.shade200,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsetsDirectional.only(
                        start: 0.0,
                        bottom: 32.0,
                      ),
                      title: Opacity(
                        opacity: _appBarCardsOpacity,
                        child: SizedBox(
                          height: 80,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...appBarCardsList,
                              GestureDetector(
                                onTap: () {},
                                onLongPress: (){},
                                child: Container(
                                  color: Colors.transparent,
                                  width: 70,
                                  padding: const EdgeInsets.symmetric(horizontal:8, vertical: 8),
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white.withOpacity(0.2),
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/K.png',
                                            scale: 14,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4,),
                                      const Flexible(
                                        child: Text(
                                          'Більше сервісів',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blueAccent.shade100,
                              const Color.fromARGB(0xff, 85, 145, 220),
                              const Color.fromARGB(0xff, 85, 145, 220),
                              Colors.blueAccent.shade100,
                            ],
                            stops: const [0.0, 0.18, 0.82, 1.0],
                          ),
                        ),
                        // color: Colors.blue,
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: flattenedList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: flattenedList[index],
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0), Colors.white],
                  stops: const [0.6, 0.9]
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade300,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/K.png',
                    scale: 8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    _scrollControllerOffset = 1 - (_scrollController.offset.clamp(0, 100) / 100);
    double colorOpacity = 1.0 - (_scrollController.offset / 200);
    setState(() {
      _appBarCardsOpacity = _scrollControllerOffset;
      _appBarTextColor = Color.lerp(Colors.black, Colors.white, colorOpacity)!;
      _appBarBackCircletColor = Color.lerp(Colors.grey.shade200, Colors.white.withOpacity(0.2), _scrollControllerOffset)!;
    });
  }

  void animateScroll() {
    if (_scrollController.offset < _expandedAppBarHeight) {
      if (_scrollController.offset < _expandedAppBarHeight / 2) {
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
      } else if (_scrollController.offset > _expandedAppBarHeight / 2 && _scrollController.offset < _expandedAppBarHeight) {
        _scrollController.animateTo(170, duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
      }
    }
  }
}