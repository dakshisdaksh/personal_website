import 'package:flutter/material.dart';
import 'package:personal_website/models/github_model.dart';
import 'package:personal_website/pages/services/http_service.dart';
import 'package:personal_website/providers/utility_provider.dart';
import 'package:personal_website/utilities/strings.dart';
import 'package:personal_website/widgets/icon_widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class GithubPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopServicesPage();
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
          return TabletServicesPage();
        } else {
          return MobileServicesPage();
        }
      },
    );
  }
}


class DesktopServicesPage extends StatefulWidget {
  @override
  _DesktopServicesPageState createState() => _DesktopServicesPageState();
}

class _DesktopServicesPageState extends State<DesktopServicesPage> {
  var width;
  var height;
  var utilityProvider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
      width: width,
      // height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: whatIDoWidget(45)),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.yellowAccent.withOpacity(0.4),
                  'lib/icons/pen.png',
                  kCard1title,
                  kCard1Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
              whatIDoCard(
                  Colors.tealAccent.withOpacity(0.4),
                  'lib/icons/mob_dev.png',
                  kCard2title,
                  kCard2Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
              whatIDoCard(
                  Colors.redAccent.withOpacity(0.4),
                  'lib/icons/web.png',
                  kCard3title,
                  kCard3Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: whoIAmWidget(45),
              ),
              SizedBox(
                width: 0.10 * width,
              ),
              whoIamDetailsWidget(80)
            ],
          )
        ],
      ),
    );
  }
}

class TabletServicesPage extends StatefulWidget {
  @override
  _TabletServicesPageState createState() => _TabletServicesPageState();
}

class _TabletServicesPageState extends State<TabletServicesPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      //height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(child: whatIDoWidget(30)),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.yellowAccent.withOpacity(0.4),
                  'lib/icons/pen.png',
                  kCard1title,
                  kCard1Descrption,
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.tealAccent.withOpacity(0.4),
                  'lib/icons/mob_dev.png',
                  kCard2title,
                  kCard2Descrption,
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.redAccent.withOpacity(0.4),
                  'lib/icons/web.png',
                  kCard3title,
                  kCard3Descrption,
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              whoIAmWidget(30),
              // SizedBox(
              //   width: 0.20 * width,
              // ),
              whoIamDetailsWidget(40)
            ],
          )
        ],
      ),
    );
  }
}

class MobileServicesPage extends StatefulWidget {
  @override
  _MobileServicesPageState createState() => _MobileServicesPageState();
}

class _MobileServicesPageState extends State<MobileServicesPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, right: 20),
      width: width,
      //height: height,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          whatIDoWidget(30),
          SizedBox(
            height: 30,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.yellowAccent.withOpacity(0.4),
            'lib/icons/pen.png',
            kCard1title,
            kCard1Descrption,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.tealAccent.withOpacity(0.4),
            'lib/icons/mob_dev.png',
            kCard2title,
            kCard2Descrption,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.redAccent.withOpacity(0.4),
            'lib/icons/web.png',
            kCard3title,
            kCard3Descrption,
          ),
          SizedBox(
            height: 30,
          ),
          whoIAmWidget(30),
          whoIamDetailsWidget(30)
        ],
      ),
    );
  }
}

Widget whatIDoWidget(double fontSize) {
  return Text(kWhatIdo,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whatIDoCard(
    Color color,
    String iconPath,
    String title,
    String description,
    double devWidth,
    double devHeight,
    double cardWidth,
    double cardHeight,
    double cardTitleTextSize,
    double cardDescriptionTextSize) {
  return Material(
    //color: Colors.white54,
    //shadowColor: Colors.tealAccent,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    elevation: 20,
    child: Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.2, color: Colors.white12, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     Container(
          //       width: 120,
          //       height: 120,
          //       color: color,
          //       child: Center(
          //         child: Image(
          //           //fit: BoxFit.cover,
          //             width: 60,
          //             image: AssetImage(
          //               iconPath,
          //             )),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: cardTitleTextSize, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: cardDescriptionTextSize,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget whoIAmWidget(double fontSize) {
  return Text(kWhoIam,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whoIamDetailsWidget(double spaceAfterCards) {
  return Container(
    margin: EdgeInsets.only(top: spaceAfterCards),
    width: 500,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kWhoIamDetails,
          textAlign: TextAlign.left,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 14,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          children: [
            MaterialButton(
                hoverElevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                color: Colors.red[400],
                child: Text(
                  kDownloadCV,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final url = kCvUrl;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            SizedBox(
              width: 40,
            ),
            iconWidget('linkedin'),
            SizedBox(
              width: 10,
            ),
            iconWidget('twitter'),
            SizedBox(
              width: 10,
            ),
            iconWidget('github'),
          ],
        )
      ],
    ),
  );
}

Widget whatIdoCardMobile(double height, double width, Color color,
    String imagePath, String title, String description) {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        //color: Colors.black,
        // height: height / 6,
        width: width,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          elevation: 20,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: color,
                ),
                width: 120,
                height: 130,
                child: Center(
                  child: Image(
                    //fit: BoxFit.cover,
                      width: 60,
                      image: AssetImage(
                        imagePath,
                      )),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}


class GithubPage extends StatefulWidget {

  @override
  _GithubPageState createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  late Future<All> futureRepo;

  @override
  void initState() {
    super.initState();
    futureRepo=fetchRepos();

  }
  Widget build(BuildContext context) {

    return Material(
      color: Vx.purple700,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "All Creative works,\n"
                .richText
                .withTextSpanChildren(
                ["Github Repositories".textSpan.yellow400.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
                child: FutureBuilder<All>(
                  future: futureRepo,
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      List<Repo> repos = [];
                      List<Widget> list =[];
                      for (int i =0; i<snapshot.data!.repos.length; i++){
                        repos.add(Repo(name: snapshot.data!.repos[i].name, htmlUrl: snapshot.data!.repos[i].htmlUrl, description: snapshot.data!.repos[i].description));

                      }

                      for (int i =0; i<snapshot.data!.repos.length; i++){
                         list.add( ProjectWidget(title: repos[i].name, Url: repos[i].htmlUrl,));

                      }


                      return VxSwiper(
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        height: 170,
                        items: list,
                        viewportFraction: context.isMobile ? 0.75 : 0.4,
                        autoPlay: true,
                        autoPlayAnimationDuration: 1.seconds,
                      );

                    }
                    else{return Center(child: CircularProgressIndicator());}

    }

                ))
          ]).p64().h(context.isMobile ? 500 : 300),
    );
  }
}
class ProjectWidget extends StatelessWidget {
  final String title;
  final String Url;

  const ProjectWidget({ required this.title, required this.Url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ launchUrl(Url);},
      child: title.text.bold.white.xl.wide.center
          .make()
          .box
          .p8
          .roundedLg
          .neumorphic(color: Vx.purple700, elevation: 5, curve: VxCurve.flat)
          .alignCenter
          .square(200)
          .make()
          .p16(),
    );
  }
}
