import 'dart:math';
import 'package:florian_software_webapp/common_widgets/footer/footer.dart';
import 'package:florian_software_webapp/screens/contact/contact_provider.dart';
import 'package:florian_software_webapp/utils/responsiveness.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Widget largeScreen(BuildContext context, ContactPageProvider provider){
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      /// Form
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: AbsorbPointer(
                                absorbing: provider.isSending,
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
                                                controller: provider.controllers['name'],
                                                enabled: !provider.isSending,
                                                validator: (value) => provider.validateFormField('name', value),
                                                onChanged: (value) => provider.updateFormData('name', value),
                                                decoration: InputDecoration(
                                                //fillColor: !provider.isSending ? Colors.grey: Theme.of(context).highlightColor,
                                                  isDense: true,
                                                  labelText: "Name*",
                                                  hoverColor: Colors.transparent,
                                                  labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),                  
                                                style: TextStyle(
                                                  color: Theme.of(context).colorScheme.tertiary,
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
                                                controller: provider.controllers['email'],
                                                enabled: !provider.isSending,
                                                validator: (value) => provider.validateFormField('email', value),
                                                onChanged: (value) => provider.updateFormData('email', value),
                                                decoration: InputDecoration(
                                                //fillColor: !provider.isSending ? Colors.grey: Theme.of(context).highlightColor,
                                                  labelText: "Email*",
                                                  hoverColor: Colors.transparent,
                                                  labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),                  
                                                style: TextStyle(
                                                  color: Theme.of(context).colorScheme.tertiary,
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
                                                controller: provider.controllers['company'],
                                                enabled: !provider.isSending,
                                                onChanged: (value) => provider.updateFormData('company', value),
                                                decoration: InputDecoration(
                                                //fillColor: provider.isSending ? Colors.grey: Theme.of(context).highlightColor,
                                                  labelText: "Company",
                                                  hoverColor: Colors.transparent,
                                                  labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),                  
                                                style: TextStyle(
                                                  color: Theme.of(context).colorScheme.tertiary,
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
                                                controller: provider.controllers['phone_number'],
                                                enabled: !provider.isSending,
                                                onChanged: (value) => provider.updateFormData('phone_number', value),
                                                decoration: InputDecoration(
                                                //fillColor: !provider.isSending ? Colors.grey: Theme.of(context).highlightColor,
                                                  labelText: "Phone number",
                                                  hoverColor: Colors.transparent,
                                                  labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),                  
                                                style: TextStyle(
                                                  color: Theme.of(context).colorScheme.tertiary,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    /// Message
                                    Container(
                                      width: screenSize.width*0.4,
                                      child: TextFormField(
                                        controller: provider.controllers['message'],
                                        enabled: !provider.isSending,
                                        validator: (value) => provider.validateFormField('message', value),
                                        onChanged: (value) => provider.updateFormData('message', value),
                                        minLines: 5,
                                        maxLines: 10,
                                        textAlignVertical: TextAlignVertical.top,
                                        decoration: InputDecoration(
                                          //fillColor: !provider.isSending ? Colors.grey: Theme.of(context).highlightColor,
                                          labelText: "Message*",
                                          hoverColor: Colors.transparent,
                                          alignLabelWithHint: true,
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),                  
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.tertiary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    Container(
                                      width: screenSize.width*0.4,
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Visibility(
                                            visible: provider.sent,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal : 10.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.check_circle_outline_rounded, color:  Colors.green,),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    "Your message was sent.\nWe'll get back to you shortly",
                                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                          FilledButton(
                                            onPressed: provider.isSending
                                            ? null
                                            : () async {
                                              if(await provider.sendMessage()){
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    behavior: SnackBarBehavior.floating,
                                                    content: Text("Your message was sent.\nWe'll get back to you shortly"), 
                                                    // actions: [],
                                                  )
                                                );
                                              }
                                                // ScaffoldMessenger.of(context).showMaterialBanner( )
                                            }, 
                                            child: Text("Send message", style: Theme.of(context).textTheme.bodyMedium,)
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /// Title
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    ),
                                    TextSpan(
                                      text: "\nor ",
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        // color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                    WidgetSpan(
                                      child: InkWell(
                                        child: MaterialButton(
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          padding: null,
                                          onPressed: () async{
                                            await provider.launchCallBooking();
                                          },
                                          child: Text(
                                            "book a call",
                                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                              color: Theme.of(context).colorScheme.primary,
                                              decoration: TextDecoration.underline
                                            )
                                          )
                                        ),
                                      ),
                                      style: Theme.of(context).textTheme.headlineSmall
                                    ),
                                    TextSpan(
                                      text: ".",
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        // color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                  ]
                                )
                              ),
                              // SizedBox(height: 20,),
                              // FilledButton(
                              //   onPressed: (){
                                  
                              //   }, 
                              //   child: Text("Book a call", style: Theme.of(context).textTheme.bodyMedium,)
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Footer()
        ],
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