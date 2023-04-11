import 'package:carousel_slider/carousel_slider.dart';
import 'package:florian_software_webapp/screens/portfolio/portfolio_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  Widget largeScreen(BuildContext context, PortfolioPageProvider provider) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: screenSize.height * 0.2,
            child: Center(
              child: SelectableText(
                "Some of our previous work",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              // scrollPhysics: NeverScrollableScrollPhysics(),
              height: screenSize.height*0.65,
            ),
            items: provider.projects.map((project) => Container(
                width: screenSize.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          width: screenSize.width*0.3,
                          child: SelectableText.rich(
                            TextSpan(
                              children: [
                                /// App name
                                TextSpan(
                                  text: "${project.name}\n",
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.primary
                                  )
                                ),
                                /// App description
                                TextSpan(
                                  text: "${project.description}",
                                  style: Theme.of(context).textTheme.headlineSmall
                                )
                              ]
                            )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(localAsset('phone'), height: screenSize.height * 0.3,),
                    )
                  ],
                ),
              ),
            ).toList()
          )
        ],
      ),
      // body: ScrollTransformView(
      //   children: [
      //     // SizedBox(height: screenSize.height*0.1,),
      //     // Center(
      //     //   child: SelectableText(
      //     //     "Some of our previous work",
      //     //     style: Theme.of(context).textTheme.headlineLarge,
      //     //   ),
      //     // ),
      //     // SizedBox(height: screenSize.height*0.15,),
      //     ScrollTransformItem(
      //       builder: (offset) {
      //         return Container(
      //           //color: Colors.red,
      //           alignment: Alignment.bottomCenter,
      //           height: screenSize.height*0.25,
      //           child: SelectableText(
      //             "Some of our previous work",
      //             style: Theme.of(context).textTheme.headlineLarge,
      //           ),
      //         );
      //       },
      //       offsetBuilder: ((scrollOffset) {
      //         return Offset(0, scrollOffset);
      //       }),
      //     ),
      //     // // First project
      //     ScrollTransformItem(
      //       builder: (offset) {
      //         return Container(
      //           height: screenSize.height*0.75,
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: Center(
      //                   child: SelectableText.rich(
      //                     TextSpan(
      //                       children: [
      //                         /// App title
      //                         TextSpan(
      //                           text: "Wine Street",
      //                           style: Theme.of(context).textTheme.headlineMedium!.copyWith(
      //                             color: Theme.of(context).colorScheme.primary
      //                           )
      //                         ),
      //                         /// App description
      //                         TextSpan(
      //                           text: "\nA restaurant booking app\nwhich offers deals and discounts",
      //                           style: Theme.of(context).textTheme.headlineSmall
      //                         )
      //                       ]
      //                     )
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //                 child: Image.asset(localAsset('phone'), height: screenSize.height * 0.3,),
      //               )
      //             ],
      //           ),
      //         );
      //       },
      //       offsetBuilder: (scrollOffset) {
      //         return Offset(0, 0)
      //       },
      //     )
      //   ],
      // ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<PortfolioPageProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider), 
      mediumScreen: null, 
      smallScreen: largeScreen(context, provider)
    );
  }
}