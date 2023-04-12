import 'package:florian_software_webapp/common_widgets/footer/footer.dart';
import 'package:florian_software_webapp/screens/about/about_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget largeScreen(BuildContext context, AboutPageProvider provider){
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            height: screenSize.height,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "We ", 
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary
                            )
                          ),
                          TextSpan(
                            text: "deliver custom",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary
                            )
                          ),
                          TextSpan(
                            text: "\nmobile applications and websites\n",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context).colorScheme.primary
                            )
                          ),
                          TextSpan(
                            text: "for our clients",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary
                            )
                          ),
                        ]
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(localAsset('dev'), width: 400,)
                  ),
                )
              ],
            ),
          ),
          Container(
            //height: screenSize.height,
            child: Center(
              child: SelectableText(
                "How we work",
                style: Theme.of(context).textTheme.headlineMedium
              )
            ),
          ),
          SizedBox(height: 50,),
          Container(
            //height: screenSize.height,
            child: Center(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 50),
                shrinkWrap: true,
                children: [
                  /// First step
                  Row(
                    children: [
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0, right: 30),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Talk to us", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nWe collect all necessary information\nabout your product", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              /// NDA tooltip
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Tooltip(
                                  margin: EdgeInsets.only(right: screenSize.width*0.1),
                                  preferBelow: false,
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                    radius: 10,
                                    child: Icon(Icons.question_mark_rounded, size: 16, color: Theme.of(context).canvasColor,)
                                  ),
                                  message: "If needed, we are more than eager to sign a non-disclosure agreement.",
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "1", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment(-0.2, 3),
                            width: screenSize.width*0.2,
                            height: screenSize.height*0.3,
                            child: Image.asset(
                              localAsset('talk'), 
                              //width: 300,
                              fit: BoxFit.fitWidth,
                            )
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 100),
                  /// Second step
                  Row(
                    children: [                      
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            width: screenSize.width*0.2,
                            height: screenSize.height*0.3,
                            child: Image.asset(
                              localAsset('design'), 
                              //width: 300,
                              fit: BoxFit.fitWidth,
                            )
                          )
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "2", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "We design", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nAfter we settle all the details\nand understand your needs,\n"
                                        + "we come up with a ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "design", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\n for the product.", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  /// Third step
                  Row(
                    children: [
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "We develop", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nOnce you approve the design,\nwe start ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "building", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      TextSpan(
                                        text: " your product.", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "3", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment(-0.2, 3),
                            width: screenSize.width*0.2,
                            child: Image.asset(
                              localAsset('develop'), 
                              //width: 300,
                              fit: BoxFit.fitWidth,
                            )
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 100),
                  /// Fourth step
                  Row(
                    children: [                      
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            width: screenSize.width*0.2,
                            height: screenSize.height*0.3,
                            child: Image.asset(
                              localAsset('test'),
                            )
                          )
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "4", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "We test", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nAfter your product has been developed,\nwe start ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "testing", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      TextSpan(
                                        text: " it to ensure it meets \nyour requirements and is free of \n", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "bugs and errors.", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  /// Fifth step
                  Row(
                    children: [
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( right: 30),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "We deploy", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nOnce your product has been \ntested and approved,\n we ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "deploy", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      TextSpan(
                                        text: " it to your preffered environment ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "5", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment(-0.2, 3),
                            width: screenSize.width*0.2,
                            child: Image.asset(
                              localAsset('deploy'), 
                              //width: 300,
                              fit: BoxFit.fitWidth,
                            )
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 100),
                  /// Sixth step
                  Row(
                    children: [                      
                      /// Vector image
                      Expanded(
                        child: Center(
                          child: Container(
                            width: screenSize.width*0.2,
                            height: screenSize.height*0.3,
                            child: Image.asset(
                              localAsset('maintain'),
                            )
                          )
                        ),
                      ),
                      /// Index
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          "6", 
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).canvasColor
                          ),
                        ),
                      ),
                      /// Text box
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width*0.4,
                          //padding: EdgeInsets.all(50),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: SelectableText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "We maintain", 
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "\nOoorah! Your product is ", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                      TextSpan(
                                        text: "live", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      TextSpan(
                                        text: ".\nNow, we provide maintance and support \nfor your app and ensure everything \nruns as you wished.", 
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          //color: Theme.of(context).colorScheme.tertiary
                                        )
                                      ),
                                    ]
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            )
          ),
          SizedBox(height: 50,),
          Container(
            height: 70,
            child: Center(
              child: FilledButton(
                onPressed: () => context.go('/contact'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text("Let's talk!", style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
          Footer()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AboutPageProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider), 
      mediumScreen: null, 
      smallScreen: largeScreen(context, provider)
    );
  }
}