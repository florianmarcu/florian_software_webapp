
import 'package:florian_software_webapp/common_widgets/web_appbar/web_appbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class WebAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<WebAppbarProvider>();
    // var currentRouteName = context.watch<RouterChangesProvider>().currentRouteName;
    var currentRouteName = context.watch<String?>();
    var pages = provider.pages;
    return AppBar(
      scrolledUnderElevation: 10,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(left: min(150.0, MediaQuery.of(context).size.width*0.1), right: min(150.0, MediaQuery.of(context).size.width*0.1)),
        child: Row(
          children: [
            const Text("flo-stacks"),
            Spacer(),
            Row(
              children: pages.keys.map((path) => Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                      path == currentRouteName
                      ? Theme.of(context).splashColor
                      : Theme.of(context).appBarTheme.backgroundColor
                    )
                  ),
                  onPressed: () {
                    provider.updateCurrentRouteName(path);
                    context.go('/$path');
                  },
                  child: Text(
                    pages[path] ?? "",
                    //style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                ),
              ))
              .toList(),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(70);
}