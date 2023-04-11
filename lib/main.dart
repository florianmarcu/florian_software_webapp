import 'package:firebase_core/firebase_core.dart';
import 'package:florian_software_webapp/common_widgets/web_appbar/web_appbar.dart';
import 'package:florian_software_webapp/common_widgets/web_appbar/web_appbar_provider.dart';
import 'package:florian_software_webapp/screens/about/about_page.dart';
import 'package:florian_software_webapp/screens/about/about_provider.dart';
import 'package:florian_software_webapp/screens/home/home_page.dart';
import 'package:florian_software_webapp/screens/home/home_provider.dart';
import 'package:florian_software_webapp/screens/portfolio/portfolio_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/contact/contact_page.dart';
import 'screens/contact/contact_provider.dart';
import 'screens/portfolio/portfolio_page.dart';


GoRouterObserver goRouterObserver = GoRouterObserver();
RouterChangesProvider routerChangesProvider = RouterChangesProvider();

void main() async{
  debugPrint = debugPrintSynchronously;
  await config();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RouterChangesProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Florian Software Presentation Web App',
        theme: theme(context),
        routerConfig: router,
        // home: ChangeNotifierProvider(
        //   create: (_) => HomePageProvider(),
        //   child: HomePage()
        // ),
      ),
    );
  }
}

GoRouter router = GoRouter(
  observers: [goRouterObserver],
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        // print("route name in shell router: ${state.location.substring(1, state.location.length)}");
        var routeName = state.location.substring(1, state.location.length);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => WebAppbarProvider(),
            ),
            // ChangeNotifierProvider.value(
            //   value: routerChangesProvider
            // ),
            Provider.value(
              value: routeName
            )
          ],
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: WebAppBar(),
            body: Center(
              child: child,
            ),
          ),
        );
      },
      routes: [
        /// Home screen
        GoRoute(
          name: 'home',
          path: "/",
          builder: (context, state) { 
            routerChangesProvider.updateCurrentRouteName("");
            //print("home route state name: ${state.name}");
            return ChangeNotifierProvider(
              create: (_) => HomePageProvider(),
              child: HomePage()
            );
          },
        ),
        /// About screen
        GoRoute(
          name: 'about',
          path: "/about",
          builder: (context, state) {
            routerChangesProvider.updateCurrentRouteName(state.name ?? "");
            return ChangeNotifierProvider(
              create: (_) => AboutPageProvider(),
              child: AboutPage()
            );
          },
        ),
        /// Contact screen
        GoRoute(
          name: 'contact',
          path: "/contact",
          builder: (context, state) {
            routerChangesProvider.updateCurrentRouteName(state.name ?? "");
            return ChangeNotifierProvider(
              create: (_) => ContactPageProvider(),
              child: ContactPage()
            );
          },
        ),
        /// Portfolio screen
        GoRoute(
          name: 'portfolio',
          path: "/portfolio",
          builder: (context, state) {
            routerChangesProvider.updateCurrentRouteName(state.name ?? "");
            return ChangeNotifierProvider(
              create: (_) => PortfolioPageProvider(),
              child: PortfolioPage()
            );
          },
        ),
      ]
    ),
  ]
);

Future<void> config() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA15HV3r9xfeHUixqTXRHuYECa0fM9pK_g",
      authDomain: "flo-stacks.firebaseapp.com",
      projectId: "flo-stacks",
      storageBucket: "flo-stacks.appspot.com",
      messagingSenderId: "441023712645",
      appId: "1:441023712645:web:c2668c9d801bf4032bc8ec",
      measurementId: "G-6XJXMD669H"
    )
  );
}


class GoRouterObserver extends NavigatorObserver with ChangeNotifier{

  NavigatorState? _navigator;
  String currentRouteName = "";

  @override
  void didPop(Route route, Route? previousRoute) {
    currentRouteName = route.settings.name ?? "null";
    print("didPop");
    notifyListeners();
  }
  
  @override
  void didPush(Route route, Route? previousRoute) {
    currentRouteName = route.settings.name ?? "null";
    print("didPush");
    print(route.settings.name == null || route.settings.name == "" ? "null" : route.settings.name);

    notifyListeners();
  }
  
  @override
  void didRemove(Route route, Route? previousRoute) {
    currentRouteName = route.settings.name ?? "null";
    print("didRemove");

    notifyListeners();
  }
  
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    currentRouteName = newRoute != null ? newRoute.settings.name ?? "null" : oldRoute != null ? oldRoute.settings.name! : "null";
    print("didReplace");

    notifyListeners();
  }
  
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
  }
  
  @override
  void didStopUserGesture() {
  }
  
  @override
  NavigatorState? get navigator => _navigator;

  set navigator(NavigatorState? navigator) {
    _navigator = navigator;
  }
}


class RouterChangesProvider with ChangeNotifier{
  String currentRouteName = goRouterObserver.currentRouteName;

  void updateCurrentRouteName(String newRouteName){
    currentRouteName = newRouteName;

    notifyListeners();
  }
}