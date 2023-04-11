import 'package:flutter/material.dart';

Color _tertiaryColor = Color(0xFF3E363F);
Color _highlightColor = Colors.white;
Color _primaryColor = Color(0xFF382DB3);
Color _lightPrimaryColor = Color(0xFF382DB3).withOpacity(0.5);
Color _secondaryColor = Color(0xFFDD403A);
/// The color of the text, used in TextTheme
Color _textColor = _tertiaryColor;
Color _secondaryTextColor = Color(0xFF737373);
// Color _textColor = Colors.black;
// Color _splashColor = Color(0xFF95b1db);
Color _splashColor = _primaryColor.withOpacity(0.1);
Color _canvasColor = Color(0xFFF5EFED);
// var _greyColor = Colors.grey[500];

theme(BuildContext context) => ThemeData(
  textTheme: _textTheme(context),
  canvasColor: _canvasColor,
  splashColor: _splashColor,
  colorScheme: _colorScheme,
  primaryColor: _primaryColor,
  appBarTheme: _appBarTheme(context),
  fontFamily: 'Sequel Sans',
  textButtonTheme: _textButtonTheme,
  filledButtonTheme: _filledButtonTheme,
  inputDecorationTheme: _inputDecorationTheme
);

_appBarTheme(BuildContext context) => AppBarTheme(
  elevation: 0,
  backgroundColor: Colors.transparent,
  titleTextStyle: TextStyle(
    color: _tertiaryColor,
    letterSpacing: 1,
    fontSize: 23*(1/MediaQuery.textScaleFactorOf(context)),
    fontWeight: FontWeight.bold,
    fontFamily: 'Sequel Sans'
  )
);

var _textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(

  )
);

var _filledButtonTheme = FilledButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      _primaryColor 
    ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      TextStyle(
        fontFamily: 'Sequel Sans',
        color: _highlightColor
      ) 
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.symmetric(horizontal: 40, vertical: 15)
    ),
  )
);


ColorScheme _colorScheme = ColorScheme(
  primary: _primaryColor,
  secondary: _lightPrimaryColor,
  tertiary: _tertiaryColor, 
  background: _highlightColor, 
  brightness: Brightness.light, 
  error: Colors.red, 
  onBackground: Colors.black, 
  onError: _highlightColor, 
  onPrimary: Colors.black, 
  onSecondary: _highlightColor, 
  onTertiary: _highlightColor,
  onSurface: Colors.black, 
  surface: _primaryColor,
);

_textTheme(BuildContext context) => TextTheme(
  headlineLarge: TextStyle(
    color: _textColor,
    fontSize: 40*1/(MediaQuery.textScaleFactorOf(context))
  ),
  headlineMedium: TextStyle(
    color: _secondaryTextColor,
    fontSize: 30*1/(MediaQuery.textScaleFactorOf(context))
  ),
  headlineSmall: TextStyle(
    color: _secondaryTextColor,
    fontSize: 25*1/(MediaQuery.textScaleFactorOf(context))
  ),
  bodyLarge: TextStyle(
    color: _highlightColor,
    fontSize: 20*1/(MediaQuery.textScaleFactorOf(context))
  ),
  bodyMedium: TextStyle(
    color: _highlightColor,
    fontSize: 18*1/(MediaQuery.textScaleFactorOf(context))
  ),
  bodySmall: TextStyle(
    color: _highlightColor,
    fontSize: 14*1/(MediaQuery.textScaleFactorOf(context))
  ),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  focusColor: _secondaryColor,
  fillColor: _highlightColor,
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
  suffixStyle: TextStyle(color: _highlightColor,),
  labelStyle: TextStyle(
    color: _highlightColor
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.transparent)
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.transparent)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.transparent),
  ),
);
