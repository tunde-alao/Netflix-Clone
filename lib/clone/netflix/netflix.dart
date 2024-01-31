import 'package:flutter/material.dart';
import 'package:flutter_testing/clone/netflix/netflix_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Netflix extends StatefulWidget {
  const Netflix({super.key});

  @override
  State<Netflix> createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          backgroundColor: Color(0xFF292929),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Header(),
                    SizedBox(
                      height: 20,
                    ),
                    HighlightSection(),
                    SizedBox(
                      height: 20,
                    ),
                    ContinueWatchingSection(),
                    SizedBox(
                      height: 20,
                    ),
                    HumanConnectionSection(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF473231),
      child: SafeArea(
        top: false,
        child: Container(
          margin: EdgeInsets.only(bottom: 10, top: 10),
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FooterButton(
                text: "Home",
                icon: "images/netflix/home.png",
                selected: true,
              ),
              FooterButton(
                text: "New & Hot",
                icon: "images/netflix/new_hot.png",
                selected: false,
              ),
              FooterButton(
                text: "My Netflix",
                icon: "images/netflix/my_netflix.png",
                selected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;

  const FooterButton({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    Color color = selected ? Colors.white : Color(0xFF92938E);

    return Column(
      children: [
        Image.asset(
          icon,
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ],
    );
  }
}

class HumanConnectionSection extends StatelessWidget {
  const HumanConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Human Connections',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...humanConnections.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        item.imageUrl,
                      ),
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContinueWatchingSection extends StatelessWidget {
  const ContinueWatchingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Continue Watching for Tunde',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...continueWatching.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: [
                          Image.network(
                            item.imageUrl,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFF161616),
                              ),
                              child: Row(
                                children: [
                                  FaIcon(
                                    Icons.info_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  FaIcon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HighlightSection extends StatelessWidget {
  const HighlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              highlight.imageUrl,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Image.network(
                    highlight.metaImageUrl!,
                  ),
                  Text(
                    'Gritty · Drama · Fight the system',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: NetflixButton(
                          text: 'Play',
                          icon: FontAwesomeIcons.play,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: NetflixButton(
                          text: 'My List',
                          icon: FontAwesomeIcons.plus,
                          backgroundColor: Color(0xFF292525),
                          textColor: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "For Tunde",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chromecast,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                HeaderButton(body: 'Series'),
                SizedBox(
                  width: 12,
                ),
                HeaderButton(body: 'Films'),
                SizedBox(
                  width: 12,
                ),
                HeaderButton(
                  body: 'Categories',
                  showDropdown: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  final String body;
  final bool showDropdown;

  const HeaderButton({
    super.key,
    required this.body,
    this.showDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF766C6B),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        child: Row(
          children: [
            Text(
              body,
              style: TextStyle(
                color: Color(0xFFD5D5D5),
                fontSize: 10,
              ),
            ),
            if (showDropdown) ...[
              SizedBox(
                width: 4,
              ),
              FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 10,
                color: Color(0xFFD5D5D5),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class NetflixButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  const NetflixButton({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: textColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
