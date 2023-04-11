import 'dart:math';
import 'package:florian_software_webapp/screens/contact/contact_provider.dart';
import 'package:florian_software_webapp/utils/responsiveness.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Widget largeScreen(BuildContext context, ContactPageProvider provider){
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Name and email
              Row(
                children: [
                  /// Form
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Name and email fields
                        Container(
                          width: screenSize.width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                // flex: 3,
                                child: Container(
                                  //width: min(screenSize.width*0.3, 300),
                                  child: TextFormField(
                                    onChanged: (value) => provider.updateFormData('name', value),
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                      hoverColor: Colors.transparent,
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),                  
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: min(screenSize.width*0.03, 30),),
                              Expanded(
                                // flex: 4,
                                child: Container(
                                  //width: min(screenSize.width*0.3, 300),
                                  child: TextFormField(
                                    onChanged: (value) => provider.updateFormData('email', value),
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hoverColor: Colors.transparent,
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),                  
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),    
                        /// Company and phone number
                        Container(
                          width: screenSize.width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                // flex: 3,
                                child: Container(
                                  //width: min(screenSize.width*0.3, 300),
                                  child: TextFormField(
                                    onChanged: (value) => provider.updateFormData('company', value),
                                    decoration: InputDecoration(
                                      labelText: "Company",
                                      hoverColor: Colors.transparent,
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),                  
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: min(screenSize.width*0.03, 30),),
                              Expanded(
                                // flex: 4,
                                child: Container(
                                  //width: min(screenSize.width*0.3, 300),
                                  child: TextFormField(
                                    onChanged: (value) => provider.updateFormData('phone_number', value),
                                    decoration: InputDecoration(
                                      labelText: "Phone number",
                                      hoverColor: Colors.transparent,
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),                  
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: screenSize.width*0.4,
                          child: TextFormField(
                            onChanged: (value) => provider.updateFormData('message', value),
                            minLines: 5,
                            maxLines: 10,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              labelText: "Message",
                              hoverColor: Colors.transparent,
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),                  
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: screenSize.width*0.4,
                          alignment: Alignment.centerRight,
                          child: FilledButton(
                            onPressed: () async {
                              provider.sendMessage();
                            }, 
                            child: Text("Send message", style: Theme.of(context).textTheme.bodyMedium,)
                          ),
                        )
                      ],
                    ),
                  ),
                  /// Title
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectableText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Contact us\n",
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary
                                )
                              ),
                              TextSpan(
                                text: "Tell us what your project is about and \nwe'll get back to you within 24 hours",
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  // color: Theme.of(context).colorScheme.primary
                                )
                              )
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ContactPageProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider), 
      mediumScreen: null, 
      smallScreen: largeScreen(context, provider)
    );
  }
}