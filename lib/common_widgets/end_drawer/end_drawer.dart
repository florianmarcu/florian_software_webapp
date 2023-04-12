import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EndDrawer extends StatelessWidget {
  final Map<String, String> pages;

  EndDrawer(this.pages);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: pages.keys.map((path) => ListTile(
        onTap: (){
          context.go('/$path');
          context.pop();
        },
        title: Text(
          pages[path] ?? "",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      )).toList()
    );
  }
}