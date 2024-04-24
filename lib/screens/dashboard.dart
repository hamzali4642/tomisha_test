import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:index/extras/functions.dart';
import 'package:index/extras/wave.dart';
import 'package:index/generated/assets.dart';
import 'package:index/widget/margin_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late double height, width;

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: mainBody(
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: width > 500 ? 500 : null,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffEBF4FF),
                          Color(0xffE6FFFA),
                        ],
                      ),
                    ),
                    child: width > 500 ? mainHeaderWeb() : mainHeader(),
                  ),
                ),
              ),
              VMarginWidget(
                factor: 1.5,
              ),
              ToggleSwitch(
                totalSwitches: 3,
                initialLabelIndex: selected,
                activeBgColor: [Color(0xff81E6D9)],
                inactiveFgColor: Color(0xff319795),
                inactiveBgColor: Colors.white,
                borderColor: [Colors.black],
                borderWidth: 0.5,
                dividerColor: Colors.black,
                labels: ["Arbeitnehmer", "Arbeitgeber", "Temporarburo"],
                onToggle: (selected) {
                  print(selected);
                  this.selected = selected!;
                  setState(() {});
                },
                centerText: true,
                minWidth: 200,
              ),
              contentParentWidget(),
              VMarginWidget(
                factor: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  var textColor = Color(0xff4A5568);

  Widget contentParentWidget() {
    return Column(
      children: [
        Column(
          children: [
            VMarginWidget(
              factor: 1,
            ),
            Text(
              "Drei einfache Schritte zur Vermittlung neuer Mitarbeiter",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            firstChildWidget("assets/images/${selected + 1}.png"),
          ],
        )
      ],
    );
  }

  List<String> option = ["Arbeitnehmer", "Arbeitgeber", "Temporarburo"];

  Widget mainHeader() {
    return Column(
      children: [
        const VMarginWidget(
          factor: 1.5,
        ),
        const Text(
          "Deine Job\nwebsite",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 42,
            height: 0.9,
          ),
        ),
        const VMarginWidget(
          factor: 0.4,
        ),
        SvgPicture.asset(Assets.imagesHand),
        const VMarginWidget(
          factor: 2,
        ),
      ],
    );
  }

  Widget mainHeaderWeb() {
    return Container(

      child: Row(
        children: [
          const Text(
            "Deine Job\nwebsite",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 42,
              height: 0.9,
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              Assets.imagesHand,

              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget mainBody(Widget widget) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: height * (Functions.isTabletOrWeb(context) ? 0.08 : 0.12),
            left: 0,
            right: 0,
            bottom: height * (Functions.isTabletOrWeb(context) ? 0.08 : 0.12),
            child: widget,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Functions.isTabletOrWeb(context)
                ? headerWidget()
                : SafeArea(child: headerWidget()),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomWidget(),
          ),
        ],
      ),
    );
  }

  Widget headerWidget() {
    return Column(
      children: [
        Container(
          height: 5,
          decoration: BoxDecoration(
            gradient: gradientgreenblue(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff319795),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  LinearGradient gradientgreenblue() {
    return const LinearGradient(
      colors: [
        Color(0xff319795),
        Color(0xff3182CE),
      ],
    );
  }

  Widget bottomWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            gradient: gradientgreenblue(),
            borderRadius: const BorderRadius.all(Radius.circular(17)),
          ),
          child: const Center(
            child: Text(
              "Kostenlos Registrieren",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget firstChildWidget(String asset) {
    if (width > 500) {
      return Image(
        image: AssetImage("assets/images/1_web.png"),
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
    print(asset);
    return Column(
      children: [
        Image(
          image: AssetImage(asset),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ],
    );
  }
}
