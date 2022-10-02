import 'package:clickonce/shared/styles/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class MyTheme {
  // static final darkTheme = ThemeData(
  //   scaffoldBackgroundColor: Colors.grey.shade900,
  //   textTheme: ThemeData.dark().textTheme,
  //   colorScheme: const ColorScheme.dark(),
  //   primaryColor: Colors.black,
  //   iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: Colors.purple.shade200,
  //     unselectedItemColor: Colors.grey,
  //     elevation: 20,
  //     backgroundColor: Colors.black12,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.grey.shade900,
  //     elevation: 0,
  //     titleTextStyle: const TextStyle(
  //         color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  //     iconTheme: const IconThemeData(
  //       color: Colors.white,
  //     ),
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: Colors.grey.shade900,
  //       statusBarIconBrightness: Brightness.light,
  //     ),
  //   ),
  // );

  // static final lightTheme = ThemeData(
  //   textTheme: ThemeData.light().textTheme,
  //   scaffoldBackgroundColor: Colors.white,
  //   colorScheme: const ColorScheme.light(),
  //   primaryColor: Colors.white,
  //   iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: Colors.purple.shade200,
  //     unselectedItemColor: Colors.grey,
  //     elevation: 20,
  //     backgroundColor: Colors.white,
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     titleTextStyle: TextStyle(
  //         color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  //     iconTheme: IconThemeData(
  //       color: Colors.black,
  //     ),
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: Colors.white,
  //       statusBarIconBrightness: Brightness.dark,
  //     ),
  //   ),
  // );

  // ThemeData darkTheme = ThemeData(
  //     primarySwatch: Colors.deepOrange,
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: HexColor('333739'),
  //       elevation: 0,
  //       titleTextStyle: TextStyle(
  //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  //       toolbarTextStyle: TextStyle(color: Colors.white),
  //       iconTheme: IconThemeData(
  //         color: Colors.white,
  //       ),
  //       systemOverlayStyle: SystemUiOverlayStyle(
  //         statusBarColor: HexColor('333739'),
  //         statusBarIconBrightness: Brightness.light,
  //       ),
  //     ),
  //     floatingActionButtonTheme: FloatingActionButtonThemeData(
  //       backgroundColor: Colors.deepOrange,
  //     ),
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       type: BottomNavigationBarType.fixed,
  //       selectedItemColor: Colors.deepOrange,
  //       unselectedItemColor: Colors.grey,
  //       elevation: 20,
  //       backgroundColor: HexColor('333739'),
  //     ),
  //     scaffoldBackgroundColor: HexColor('333739'),
  //     textTheme: ThemeData.dark().textTheme,
  //     drawerTheme: DrawerThemeData(
  //       backgroundColor: HexColor('333739'),
  //       elevation: 20,
  //     ));

  // ThemeData lightTheme = ThemeData(
  //   primarySwatch: defaultColor,
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     titleTextStyle: TextStyle(
  //         color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  //     iconTheme: IconThemeData(
  //       color: Colors.black,
  //     ),
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: Colors.white,
  //       statusBarIconBrightness: Brightness.light,
  //     ),
  //   ),
  //   floatingActionButtonTheme: FloatingActionButtonThemeData(
  //     backgroundColor: Colors.deepOrange,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: defaultColor,
  //     unselectedItemColor: Colors.grey,
  //     elevation: 20,
  //     backgroundColor: Colors.white,
  //   ),
  //   textTheme: ThemeData.light().textTheme,
  // );
  static final ThemeData darktheme = ThemeData(
      // primarySwatch: defaultColor,

      primarySwatch: Colors.deepOrange,

      //Color.fromARGB(8, 225, 80, 88);
      scaffoldBackgroundColor: HexColor('333739'),
      appBarTheme: AppBarTheme(
        // backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor('333739'),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        backgroundColor: HexColor('333739'),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ));

  static final ThemeData lightTheme = ThemeData(
    // primarySwatch: defaultColor,
    primarySwatch: Colors.deepOrange,
    // primarySwatch: Colors.red,
    // primarySwatch:Colors.deepOrange,

    // Color.fromARGB(223, 255, 65, 90);

    scaffoldBackgroundColor: defaultColor,
    appBarTheme: AppBarTheme(
      foregroundColor: Color.fromARGB(225, 0, 85, 135),
      // toolbarHeight: 1,
      centerTitle: false,
      surfaceTintColor: Colors.blue,
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      // backgroundColor: Colors.white,
      backgroundColor: Colors.grey[200],

      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.white,
      elevation: 20,
      backgroundColor: defaultColor,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
  );
}
