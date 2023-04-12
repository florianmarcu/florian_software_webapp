import 'dart:math';
import 'package:florian_software_webapp/screens/home/home_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget largeScreen(BuildContext context, HomePageProvider provider) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ScrollTransformView(
        children: [
          /// Image item
          ScrollTransformItem(
            builder: (offset) => Container(
              height: screenSize.height,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenSize.width*0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SelectableText(
                              "Any app, any time",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SelectableText(
                              "Contact us and let's make your dreams come true",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 30,),
                            FilledButton(
                              onPressed: () => context.go('/contact'),
                              child: Text("Talk to us", style: Theme.of(context).textTheme.bodyLarge,),
                            )
                          ],
                        ),
                      )
                    )
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(localAsset('app'), width: 400,)
                    ),
                  )
                ],
              ),
            ),
            /// Keeps image in place
            offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
          ),
          /// Mockup item
          ScrollTransformItem(
            builder: (offset) {
              bool startRotatingMockup = offset > screenSize.height / 2;
              /// rotation is between 3pi/2 and 2pi
              var rotationPercentage = 3*math.pi / 2 + (offset - screenSize.height / 2)*0.01;
              var rotation = min(2*math.pi, rotationPercentage);
              bool finishedRotating = rotationPercentage > 2*math.pi;
              var movingPercentage = min(1, offset / 300 - 1.8);
              bool endMovingToRight = movingPercentage < 1;
              return Container(
                color: Theme.of(context).primaryColor,
                height: screenSize.height,
                width: screenSize.width,
                child: Stack(
                  children: [
                    /// Text
                    // Align(
                    //   child: SelectableText(
                    //     "We deliver the best product for our clients",
                    //    
                    // style: Theme.of(context).textTheme.headlineMedium,
                    //   ),
                    // ),
                    /// Mockup
                    Align(
                      alignment: Alignment(
                        finishedRotating
                        ? (endMovingToRight
                          ? movingPercentage.toDouble() / 2
                          : 0.5)
                        : 0, 
                        offset
                      ),
                      child: Transform.rotate(
                        angle: startRotatingMockup ? rotation : 3*math.pi/2,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset(localAsset('phone'),)
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            offsetBuilder: (offset) {
              // var offScreenPercentage = min(offset / screenSize.height, 1.0);
              //var rotation = min(2*math.pi, 3*math.pi / 2 + (offset - screenSize.height)*0.01);
              bool startedRotating = offset > screenSize.height / 2;
              return startedRotating
              ? Offset(0, offset  - screenSize.height) /// mockup entered the image and stopped rotating
              : Offset(0, - offset); /// mockup is still entering/rotating
            },
          ),
          /// Text item near mockup
          ScrollTransformItem(
            builder: (offset){
              return Container(
                height: screenSize.height,
                child: Align(
                  alignment: Alignment(-0.7, 0),
                  child: SelectableText(                      
                    "We deliver the best products for our clients",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).canvasColor),
                  ),
                )
              );
            },
            offsetBuilder: (scrollOffset) {
              bool endMovingText = scrollOffset > 1 * screenSize.height + 0.25 * screenSize.width;
              return endMovingText
              ? Offset(0, scrollOffset - 2 * screenSize.height)
              : Offset(0, - screenSize.height + 0.25 * screenSize.width);
            },
          ),
          // ScrollTransformItem(
          //   builder: (offset){
          //     return Container(
          //       width: screenSize.width,
          //       height: screenSize.height
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget smallScreen(BuildContext context, HomePageProvider provider) => Scaffold(
    appBar: AppBar(),
  );

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomePageProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider), 
      mediumScreen: null,
      smallScreen: largeScreen(context, provider),
    );
  }
}