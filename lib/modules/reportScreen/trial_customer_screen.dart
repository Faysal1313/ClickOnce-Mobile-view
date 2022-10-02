// ignore_for_file: camel_case_types

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/rep_totalSalesReport.dart';
import '../../shared/components/component.dart';
import '../../shared/network/remote/end_point.dart';
import '../cubit_main/cubit_search/cubit.dart';
import '../cubit_main/cubit_search/states.dart';
import '../Search/get_all_search_customer_list.dart';
import '../Search/items_list.dart';

class Trial_Customer_screen extends StatefulWidget {
  Trial_Customer_screen({Key? key}) : super(key: key);

  @override
  State<Trial_Customer_screen> createState() => _Trial_Customer_screenState();
}

class _Trial_Customer_screenState extends State<Trial_Customer_screen> {
  @override
  DateTime dateTime = DateTime.now();
  String? dateNowForma;
  String? code_item = '';
  void initState() {
    setState(() {
      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      var emailController = TextEditingController();

      String formattedDate = formatter.format(now);
      dateNowForma = formattedDate.toString();
      // print(dateNowForma);
    });
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Search_Cubit(),
      child: BlocConsumer<Search_Cubit, Search_states>(
        listener: (context, state) {},
        builder: (context, state) {
          // if (code_item != '') {
          Search_Cubit.get(context).get_Trial_customer_rep();
          // }
          var list = Search_Cubit.get(context).trial_customer_list;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('كشف حساب عملاء مجمع بالمندوب'),
              actions: [
                IconButton(
                    onPressed: () async {
                      final data = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Chose'),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // ElevatedButton.icon(
                                          //   onPressed: () {
                                          //     navigateTo(
                                          //       context,
                                          //       Invoice_Search_Items_list(),
                                          //     );
                                          //   },
                                          //   icon: Icon(
                                          //     Icons.person_add,
                                          //     size: 22,
                                          //   ),
                                          //   label: Text(
                                          //     'إختيار صنف',
                                          //     style: TextStyle(fontSize: 15),
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              final date = await pickDate();
                                              if (date == null) return;
                                              setState(() {
                                                dateTime = date;
                                                var formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                String formattedDate =
                                                    formatter.format(date);
                                                dateNowForma =
                                                    formattedDate.toString();
                                                print(dateNowForma);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.date_range_outlined,
                                              size: 22,
                                            ),
                                            label: Text(
                                              'التاريخ',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    btn_pop(
                                        txt: 'ok',
                                        onPressed: () {
                                          setState(() {
                                            // if (data_code_items_Search
                                            //     .isNotEmpty) {
                                            //   code_item =
                                            //       data_code_items_Search;
                                            //   print(code_item);
                                            // }
                                          });
                                          //add data
                                          //===============
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                ),
                              ),
                            );
                          });

                      if (data != null) {
                        // items.add(data);
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: ConditionalBuilder(
                      condition: list.isNotEmpty,
                      // condition: false,
                      builder: (context) => DataTable(
                            columns: [
                              DataColumn(
                                  label: Text('الاسم'),
                                  tooltip: 'represents first name of the user'),
                              DataColumn(
                                  label: Text('مدين '),
                                  tooltip: 'represents last name of the user'),
                              DataColumn(
                                  label: Text('دائن'),
                                  tooltip:
                                      'represents email address of the user'),
                              DataColumn(
                                  label: Text('مدين'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('دائن'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('مدين '),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('دائن '),
                                  tooltip:
                                      'represents phone number of the user'),
                            ],
                            rows: Search_Cubit.get(context)
                                .trial_customer!
                                .data
                                .map((Data_items) =>
                                    // we return a DataRow every time
                                    DataRow(

                                        // List<DataCell> cells is required in every row
                                        cells: [
                                          // I want to display a green color icon when user is verified and red when unverified
                                          DataCell(Text(Data_items.name)),
                                          DataCell(Text(Data_items.OBDebit)),
                                          DataCell(Text(Data_items.OBCredit)),

                                          DataCell(Text(Data_items.CBDebit)),
                                          DataCell(Text(Data_items.OBCredit)),
                                          DataCell(Text(Data_items.Debit)),
                                          DataCell(Text(Data_items.Credit)),
                                        ]))
                                .toList(),
                          ),
                      fallback: (context) => Row(
                            children: [
                              // Center(child: CircularProgressIndicator()),
                              Text('        يجب عمل بحث      '),
                            ],
                          )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1999, 01, 01),
      lastDate: DateTime(2060, 01, 01));
}
