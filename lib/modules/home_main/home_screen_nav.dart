// ignore_for_file: must_be_immutable, camel_case_types, override_on_non_overriding_member, annotate_overrides

import 'package:clickonce/modules/home_main/drawer.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../shared/components/component.dart';
import '../../shared/styles/colores.dart';
import '../cubit_main/cubit.dart';
import '../cubit_main/states.dart';
import '../login/loginnew.dart';

class Home_screen extends StatefulWidget {
  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  // const Home_screen({Key? key}) : super(key: key);
  @override
  bool x = false;

  Widget build(BuildContext context) {
    return BlocConsumer<Main_Cubit, Main_states>(
      listener: (context, state) {
        // print('*****------------------------------------------');
        // print(connect);
        // print(branchId);
        // print(branchName1);
        // print(salesInvoiceBookId);
        // print(salesInvoiceTypeCode);
        // print(salesInvoiceTypeId);
        // print(warehouseId);
        // print(warehouseCode);
        // print('------------------------------------------********');
      },
      builder: (context, state) {
        var cubit = Main_Cubit.get(context);
        bool ErrorNotFound = true;
        String message = '';
        if (connect == false) {
          message = 'Items NOT Found';
          showTost(txt: 'Items NOT Found', state: ToastStates.ERROR);

          bool ErrorNotFound = false;
        }

        return Builder(builder: (context) {
          return ConditionalBuilder(
            // condition: connect,
            condition: ErrorNotFound,
            // condition: true,

            fallback: (context) => Center(
                child: Column(
              children: [
                CircularProgressIndicator(),
                Text(message),
              ],
            )),
            builder: (context) => Scaffold(
              drawer: const Drawer_screen(),
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //LOGO:-
                    //++++++++++++++++
                    // Text('Click Once',
                    //     style:
                    //         TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                    // SizedBox(
                    //   width: 15,
                    // ),
                    // Icon(Icons.flag_rounded, size: 40, color: defaultColor)
                    GestureDetector(
                      onTap: () async {
                        // navigateTo(context, Drawer_screen());
                        // Scaffold.of(context).openDrawer();

                        final data = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [profile_screen()],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Image(
                        // image: AssetImage('assets/image/logoclick.png'),
                        image: AssetImage('assets/image/clickoncelogo.png'),

                        //click once logo.png
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                actions: [
                  // IconButton(
                  //     onPressed: () {
                  //       // navigateTo(context, SearchScreen());
                  //     },
                  //     icon: Icon(Icons.search),
                  //     color: Colors.black)
                  Ink(
                    // child: Text(
                    //   '${companyName}\n${dbno}  ',
                    // )
                    child: Text(
                      'DataBase:${dbno}  ',
                    ),
                  )
                  // Text('asdasdasdasd',),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Report',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Sittings',
                  ),
                ],
                onTap: (index) {
                  cubit.changeBottom(index);
                },
              ),
              backgroundColor: defaultColor,
              body: Builder(builder: (context) {
                return cubit.bottomScreen[cubit.currentIndex];
              }),
            ),
          );
        });
      },
    );
  }
}
