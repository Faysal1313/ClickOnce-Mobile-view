// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:clickonce/modules/cubit_main/cubit_search/cubit.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/items_model.dart';
import '../../shared/components/component.dart';
import '../cubit_main/cubit_search/states.dart';

// ignore: camel_case_types
class Items_Search extends StatefulWidget {
  // const Items_Search({Key? key}) : super(key: key);

  @override
  State<Items_Search> createState() => _Items_SearchState();
}

class _Items_SearchState extends State<Items_Search> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Search_Cubit(),
      child: BlocConsumer<Search_Cubit, Search_states>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = Search_Cubit.get(context).search_items;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFromField(
                      onChange: (value) {
                        Search_Cubit.get(context).getItems_search(value);
                      },
                      type: TextInputType.text,
                      txt: 'Search',
                      prefiex: Icons.search),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: list.isNotEmpty,
                    fallback: (context) => Center(
                      child: Text('يجب عمل بحث'),
                      // Row(
                      //   children: [
                      //     // CircularProgressIndicator(),
                      //     Text('يجب عمل بحث'),
                      //   ],
                      // ),
                    ),
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ListView.separated(
                        itemBuilder: (context, index) => itemsLIST(
                            Search_Cubit.get(context)
                                .items_model!
                                .data_items[index],
                            context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: Search_Cubit.get(context)
                            .items_model!
                            .data_items
                            .length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


    // return Scaffold();
    // return BlocProvider(
    //   create: (context) => Search_Cubit(),
    //   child: BlocConsumer<Search_Cubit, Search_states>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       var list = Search_Cubit.get(context).search_items;

    //       return Scaffold(
    //         backgroundColor: Colors.white,
    //         appBar: AppBar(),
    //         body: Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Column(children: [
    //             defaultFromField(
    //                 onChange: (value) {
    //                   Search_Cubit.get(context).getItems_search(value);
    //                 },
    //                 type: TextInputType.text,
    //                 txt: 'Search',
    //                 prefiex: Icons.search),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   print('*******************');
    //                   // Search_Cubit.get(context).getItems_search();
    //                 },
    //                 child: Text('Search')),

    //             //=================================================================
    //             Expanded(
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: ConditionalBuilder(
    //                     condition: list.isNotEmpty,
    //                     fallback: (context) => Center(
    //                           child: CircularProgressIndicator(),
    //                         ),
    //                     builder: (context) => Container(
    //                           color: Colors.white,
    //                           child: DataTable(
    //                             //  rows: getRows(users),
    //                             columns: [
    //                               DataColumn(
    //                                   label: Text('Verified'),
    //                                   tooltip:
    //                                       'represents if user is verified.'),
    //                               DataColumn(
    //                                   label: Text('code'),
    //                                   tooltip:
    //                                       'represents first name of the user'),
    //                               DataColumn(
    //                                   label: Text('Name1'),
    //                                   tooltip:
    //                                       'represents last name of the user'),
    //                               DataColumn(
    //                                   label: Text('Name2'),
    //                                   tooltip:
    //                                       'represents email address of the user'),
    //                               DataColumn(
    //                                   label: Text('Price'),
    //                                   tooltip:
    //                                       'represents phone number of the user'),
    //                             ],
    //                             rows: Search_Cubit.get(context)
    //                                 .items_model!
    //                                 .data_items
    //                                 .map((data) =>
    //                                     // we return a DataRow every time
    //                                     DataRow(
    //                                         // List<DataCell> cells is required in every row
    //                                         cells: [
    //                                           DataCell((true)
    //                                               ? Icon(
    //                                                   Icons.verified_user,
    //                                                   color: Colors.green,
    //                                                 )
    //                                               // ignore: dead_code
    //                                               : Icon(Icons.cancel,
    //                                                   color: Colors.red)),

    //                                           // I want to display a green color icon when user is verified and red when unverified
    //                                           DataCell(Text(data.code)),
    //                                           DataCell(Text(data.name1)),
    //                                           DataCell(Text(data.name2)),
    //                                           DataCell(Text(data.price)),
    //                                         ]))
    //                                 .toList(),
    //                           ),
    //                         )),
    //               ),
    //             ),
    //             //====================,========================================
    //           ]),
    //         ),
    //       );
    //     },
    //   ),
    // );
  // }
// }
