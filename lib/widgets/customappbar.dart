import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class CustomAppbar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppbar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: CustomAppBarMobile(),
        tablet: CustomAppBarMobile(),
        desktop: CustomAppBarDesktop(),
      ),
    );
  }
}

class CustomAppBarMobile extends StatelessWidget {
  const CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(title: "Tv shows", onTap: () => print("Tv shows")),
                AppBarButton(title: "Movies", onTap: () => print("Moviews")),
                AppBarButton(title: "My List", onTap: () => print("My List")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarDesktop extends StatelessWidget {
  const CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.netflixLogo1),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(title: "Homes", onTap: () => print("Homes")),
                AppBarButton(title: "Tv shows", onTap: () => print("Tv shows")),
                AppBarButton(title: "Movies", onTap: () => print("Moviews")),
                AppBarButton(title: "Latest", onTap: () => print("My List")),
                AppBarButton(title: "My List", onTap: () => print("My List")),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => print("Search"),
                  child: Icon(
                    Icons.search,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                MaterialButton(
                  onPressed: () => print("Gift"),
                  child: Icon(
                    Icons.card_giftcard,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                AppBarButton(title: "Kids", onTap: () => print("Kisd")),
                AppBarButton(title: "Dvd", onTap: () => print("Dvd")),
                MaterialButton(
                  onPressed: () => print("Notification"),
                  child: Icon(
                    Icons.notifications,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Appbar button

class AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => onTap,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.0),
        ),
      ),
    );
  }
}
