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

class Customer_Statment_ReportView extends StatefulWidget {
  Customer_Statment_ReportView({Key? key}) : super(key: key);

  @override
  State<Customer_Statment_ReportView> createState() =>
      _Customer_Statment_ReportViewState();
}

class _Customer_Statment_ReportViewState
    extends State<Customer_Statment_ReportView> {
  @override
  DateTime dateTime = DateTime.now();
  String? dateNowForma;
  String code_customer = '';
  // var list;
  void initState() {
    setState(() {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
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
          if (code_customer != '') {
            Search_Cubit.get(context)
                .gettotalCustomersTrnxReport(code_customer);
          }
          var list = Search_Cubit.get(context).customers_trnx_rep_list;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('كشف حساب العميل'),
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
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                Invoice_Search_Customer_List(),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.person_add,
                                              size: 22,
                                            ),
                                            label: Text(
                                              'إضافة عملاء',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              final date = await pickDate();
                                              if (date == null) return;
                                              setState(() {
                                                dateTime = date;
                                                var formatter = new DateFormat(
                                                    'yyyy-MM-dd');
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
                                      txt: 'OK',
                                      onPressed: () {
                                        setState(() {
                                          data_name_customer_Search_pr;
                                          print(data_name_customer_Search_pr);
                                          print(data_name_customer_customerId);
                                        });
                                        if (data_name_customer_customercode
                                            .isNotEmpty) {
                                          code_customer =
                                              data_name_customer_customercode;
                                          print(code_customer);
                                        }
                                        //add data
                                        //===============
                                        Navigator.of(context).pop();
                                      },
                                    ),
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
                      builder: (context) => DataTable(
                            columns: [
                              DataColumn(
                                  label: Text('فرع'),
                                  tooltip: 'represents first name of the user'),
                              DataColumn(
                                  label: Text('تاريخ'),
                                  tooltip: 'represents last name of the user'),
                              DataColumn(
                                  label: Text('رقم المستند'),
                                  tooltip:
                                      'represents email address of the user'),
                              DataColumn(
                                  label: Text('الاسم'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('مدين'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('  دائن'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text(' رصيد ما قبل'),
                                  tooltip:
                                      'represents phone number of the user'),
                              DataColumn(
                                  label: Text('صافي '),
                                  tooltip:
                                      'represents phone number of the user'),
                            ],
                            rows: Search_Cubit.get(context)
                                .customers_trnx_rep!
                                .data
                                .map((Data_items) =>
                                    // we return a DataRow every time
                                    DataRow(

                                        // List<DataCell> cells is required in every row
                                        cells: [
                                          // I want to display a green color icon when user is verified and red when unverified
                                          DataCell(Text(Data_items.branch)),
                                          DataCell(Text(Data_items.date)),
                                          DataCell(Text(Data_items.docNumber)),
                                          DataCell(Text(Data_items.customer)),
                                          DataCell(Text(Data_items.debit)),
                                          DataCell(Text(Data_items.credit)),

                                          DataCell(
                                              Text(Data_items.balancebefore)),
                                          DataCell(Text(Data_items.balance)),
                                        ]))
                                .toList(),
                          ),
                      fallback: (context) => Center(
                          child: Text(
                              '                 يجب عمل بحث عن عميل  \n'))),
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
