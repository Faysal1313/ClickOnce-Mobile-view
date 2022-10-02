// ignore_for_file: non_constant_identifier_names, camel_case_types, duplicate_ignore

import 'package:clickonce/modules/cubit_main/cubit_search/cubit.dart';
// import 'package:clickonce/modules/invoice_screen/invoice_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/component.dart';
import '../../shared/network/remote/end_point.dart';
import '../cubit_main/cubit_search/states.dart';

// ignore: camel_case_types
class Invoice_Search_Customer extends StatefulWidget {
  const Invoice_Search_Customer({Key? key}) : super(key: key);

  @override
  State<Invoice_Search_Customer> createState() =>
      _Invoice_Search_CustomerState();
}

class _Invoice_Search_CustomerState extends State<Invoice_Search_Customer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Search_Cubit(),
      child: BlocConsumer<Search_Cubit, Search_states>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = Search_Cubit.get(context).search_customer;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                defaultFromField(
                    onChange: (value) {
                      Search_Cubit.get(context).getCustomer_search(value);
                    },
                    type: TextInputType.text,
                    txt: 'Search',
                    prefiex: Icons.search),
                SizedBox(
                  height: 20,
                ),

                //=================================================================
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConditionalBuilder(
                        condition: list.isNotEmpty,
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                        builder: (context) => Container(
                              color: Colors.white,
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text('code'),
                                      tooltip:
                                          'represents first name of the user'),
                                  DataColumn(
                                      label: Text('Name1'),
                                      tooltip:
                                          'represents last name of the user'),
                                  DataColumn(
                                      label: Text('Name2'),
                                      tooltip:
                                          'represents email address of the user'),
                                  DataColumn(
                                      label: Text('ID'),
                                      tooltip:
                                          'represents phone number of the user'),
                                ],
                                rows: Search_Cubit.get(context)
                                    .customer_model!
                                    .datacustomer
                                    .map((Datacustomer) =>
                                        // we return a DataRow every time
                                        DataRow(
                                            onSelectChanged: (b) {
                                              // print(data.name1);
                                              data_name_customer_Search_pr =
                                                  Datacustomer.name1;
                                              data_name_customer_customerId =
                                                  Datacustomer.id;
                                              data_name_customer_customercode =
                                                  Datacustomer.code;

                                              showTost(
                                                  txt:
                                                      'Customer has been selected',
                                                  state: ToastStates.SUCCESS);

                                              // navigateTo(context,
                                              // Invoice_Screen_normal());
                                            },
                                            // List<DataCell> cells is required in every row
                                            cells: [
                                              // I want to display a green color icon when user is verified and red when unverified
                                              DataCell(Text(Datacustomer.code)),
                                              DataCell(
                                                  Text(Datacustomer.name1)),
                                              DataCell(
                                                  Text(Datacustomer.name2)),
                                              DataCell(Text(Datacustomer.id)),
                                            ]))
                                    .toList(),
                              ),
                            )),
                  ),
                ),

                // //====================,========================================
              ]),
            ),
          );
        },
      ),
    );
  }
}
