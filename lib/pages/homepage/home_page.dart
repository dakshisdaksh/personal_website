import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_website/pages/aboutpage/about_page.dart';
import 'package:personal_website/pages/contactpage/contact_page.dart';
import 'package:personal_website/pages/navbar/navbar.dart';
import 'package:personal_website/pages/portfoliopage/portfolio_page.dart';
import 'package:personal_website/pages/servicespage/services_page.dart';
import 'package:personal_website/providers/utility_provider.dart';
import 'package:personal_website/utilities/strings.dart';

import 'package:personal_website/widgets/logo_widget.dart' as Logo;
import 'package:provider/provider.dart';

import '../github_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var utilityProvider;
  var width;
  var height;

  //portfolio images
  late Image myProfileImage;
  late Image uiIconImage;
  late Image mobileIconImage;
  late Image webIconImage;

  //work images
  late Image work1Image;
  late Image work2Image;
  late Image work3Image;
  late Image work4Image;

  bool isSplashVisible = true;
  final List pageList = [
    TopNavbar(),
    AboutPage(),
    ServicesPage(),
    PortfolioPage(),
    GithubPage(),
    ContactPage()
  ];

  @override
  void initState() {
    super.initState();
    // initializing the asset images
    myProfileImage = Image.asset(kProfileImageURL);
    uiIconImage = Image.asset('lib/icons/pen.png');
    mobileIconImage = Image.asset('lib/icons/mob_dev.png');
    webIconImage = Image.asset('lib/icons/web.png');

    work1Image = Image.asset(kWorkImageUrl1);
    work2Image = Image.asset(kWorkImageUrl2);
    work3Image = Image.asset(kWorkImageUrl3);
    work4Image = Image.asset(kWorkImageUrl4);

    Future.delayed(
      Duration(seconds: 3),
    ).then((value) {
      setState(() {
        isSplashVisible = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //pre caching images for faster load time of website
    precacheImage(myProfileImage.image, context);
    precacheImage(uiIconImage.image, context);
    precacheImage(mobileIconImage.image, context);
    precacheImage(webIconImage.image, context);

    precacheImage(work1Image.image, context);
    precacheImage(work2Image.image, context);
    precacheImage(work3Image.image, context);
    precacheImage(work4Image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return isSplashVisible
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("lib/images/loader.json",height: 200,width: 200,fit:BoxFit.contain)
              ],
            ),
          )
        : ListView.builder(
            controller: utilityProvider.getScrollController(),
            physics: BouncingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return pageList[index];
            });
  }
}
