import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  double scrollOffset;
  HomeScreen({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // getting scroll value range 0 to 1
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          widget.scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // custom app bar
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 50.0),
        child: CustomAppbar(
          scrollOffset: widget.scrollOffset,
        ),
      ),

      // floating action action button
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Cast"),
        child: Icon(Icons.cast_rounded),
        backgroundColor: Colors.grey[800],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeder(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 15.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey("previews"),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey("myList"),
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey("originals"),
              title: "Netflix Originals",
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 8.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey("trendings"),
                title: "Trending",
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
