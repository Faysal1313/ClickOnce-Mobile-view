// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:clickonce/models/customer_model.dart';
import 'package:clickonce/modules/cubit_main/cubit_search/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/component.dart';
import '../../shared/network/remote/end_point.dart';
import '../cubit_main/cubit_search/states.dart';

// ignore: camel_case_types
class Customer_Search extends StatefulWidget {
  const Customer_Search({Key? key}) : super(key: key);

  @override
  State<Customer_Search> createState() => _Customer_SearchState();
}

class _Customer_SearchState extends State<Customer_Search> {
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFromField(
                      onChange: (value) {
                        Search_Cubit.get(context).getCustomer_search(value);
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
                      // child: CircularProgressIndicator(),
                      child: Text('يجب عمل بحث'),
                    ),
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ListView.separated(
                        itemBuilder: (context, index) => customerLIST(
                            Search_Cubit.get(context)
                                .customer_model!
                                .datacustomer[index],
                            context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: Search_Cubit.get(context)
                            .customer_model!
                            .datacustomer
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

  // Widget customer(Datacustomer model) => Padding(
  //       padding: const EdgeInsets.all(5),
  //       child: Container(
  //         color: Colors.white,
  //         child: (Column(
  //           children: [
  //             ElevatedButton(
  //                 onPressed: () {
  //                   // print('**********');
  //                   // print('${model.id}');

  //                   data_name_customer_customerId = model.id;
  //                   data_name_customer_Search_pr = model.name1;
  //                   data_name_customer_customercode = model.code;
  //                   showTost(
  //                       txt: ' تم تحديد العميل ${data_name_customer_Search_pr}',
  //                       state: ToastStates.SUCCESS);
  //                   Navigator.of(context).pop();
  //                   //  Navigator.of(Invoice_Screen_normal()).pop();
  //                 },
  //                 child: Text(
  //                   '${model.code}',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 )),
  //             SizedBox(
  //               height: 1,
  //             ),
  //             Text(
  //               '${model.name1}',
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 1,
  //             ),
  //             Text(
  //               '${model.name2}',
  //               style: TextStyle(
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         )),
  //       ),
  //     );
}
