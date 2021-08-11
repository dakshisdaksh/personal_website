import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/providers/theme_provider.dart';
import 'package:personal_website/providers/utility_provider.dart';
import 'package:personal_website/themes/themes.dart';
import 'package:personal_website/utilities/strings.dart';
import 'package:provider/provider.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  var utilityProvider;
  var themeProvider;
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32),
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Flexible(child: websiteIcon()),
              Flexible(child: navBarItems(scrollController,themeProvider)),
            ])));
  }
}

class MobileNavbar extends StatefulWidget {
  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  var utilityProvider;
  var themeProvider;
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();

    return Container(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: websiteIcon()),
        SizedBox(
          height: 10,
        ),
        navBarItems(scrollController, themeProvider)
      ],
    ));
  }
}

Widget websiteIcon() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: [
        Container(
          // decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.2),
          //     border: Border.all(color: Colors.amberAccent,width: 5),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(40),
          //       topRight: Radius.circular(40),
          //       bottomRight: Radius.circular(40),
          //       bottomLeft: Radius.circular(40),
          //
          //     ),
          //
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Shhdwi",
              // style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.redAccent,
              //     fontWeight: FontWeight.bold),
              style: GoogleFonts.specialElite( fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "|  Shrish Dwivedi",
            // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            style: GoogleFonts.tangerine(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget navBarItems(ScrollController scrollController, ThemeProvider themeProvider) {
 ThemeData _theme = themeProvider.getTheme;
 bool light = true;
 // ignore: unrelated_type_equality_checks
 if (_theme == Themes.lightTheme){
   light =true;
 }else{light = false;}
  return Row(
    // mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      navBarOptions(kAbout, 1, () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent + 120,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kServices, 2, () {
        scrollController.animateTo(
          0.30 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kPortfolio, 3, () {
        scrollController.animateTo(
          0.65 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      navBarOptions(kContact, 4, () {
        scrollController.animateTo(
          1 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      IconButton(
          icon: light ?  Icon(Icons.light_mode_rounded ): Icon(Icons.dark_mode_rounded),
          onPressed: () async {
            await scrollController.animateTo(
                scrollController.position.minScrollExtent,
                duration: Duration(seconds: 1),
                curve: Curves.ease);
                themeProvider.toggleTheme();
          }),
    ],
  );
}

Widget navBarOptions(String title, int position, void Function()? function) {
  return InkWell(
    onTap: function,
    // hoverColor: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
