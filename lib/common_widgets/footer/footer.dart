import 'package:florian_software_webapp/common_widgets/footer/footer_provider.dart';
import 'package:florian_software_webapp/screens/home/home_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Widget largeScreen(BuildContext context, FooterProvider provider){
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.05, vertical: 20),
      height: 150,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Business stuff
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Business name and socials
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Business name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SelectableText(
                          "flo:stacks",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => provider.launchSocialOrLegalUrl('instagram'),
                            icon: ImageIcon(
                              AssetImage(localAsset('instagram'),),
                              color: Theme.of(context).canvasColor,
                              size: 16,
                            ),
                            hoverColor: Theme.of(context).colorScheme.secondary,
                          ),
                          IconButton(
                            onPressed: () => provider.launchSocialOrLegalUrl('facebook'),
                            icon: Icon(
                              Icons.facebook_outlined,
                              color: Theme.of(context).canvasColor,
                              size: 18,
                            ),
                            hoverColor: Theme.of(context).colorScheme.secondary,
                          ),
                          IconButton(
                            onPressed: () => provider.launchSocialOrLegalUrl('email'),
                            icon: Icon(
                              Icons.email_outlined,
                              color: Theme.of(context).canvasColor,
                              size: 18,
                            ),
                            hoverColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SelectableText(
                    "© 2023 - Florian Software S.R.L",
                    style: Theme.of(context).textTheme.bodySmall!,
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => provider.launchSocialOrLegalUrl('privacy-policy'),
                child: Text(
                  "Privacy Policy",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14*(1/MediaQuery.textScaleFactorOf(context))
                  )
                ),
              ),
              TextButton(
                onPressed: () => provider.launchSocialOrLegalUrl('terms-and-conditions'),
                child: Text(
                  "Terms and Conditions",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14*(1/MediaQuery.textScaleFactorOf(context))
                  )
                ),
              ),
              TextButton(
                onPressed: () => provider.launchSocialOrLegalUrl('contact'),
                child: Text(
                  "Contact",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14*(1/MediaQuery.textScaleFactorOf(context))
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget smallScreen(BuildContext context, FooterProvider provider){
    return Container(

    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<FooterProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider), 
      mediumScreen: null, 
      smallScreen: smallScreen(context, provider)
    );
  }
}