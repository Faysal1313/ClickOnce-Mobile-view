// import 'dart:io';

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:clickonce/shared/network/remote/end_point.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/customer_model.dart';
import '../../models/items_model.dart';
import '../../modules/cubit_main/cubit.dart';
import '../../modules/cubit_main/cubit_search/cubit.dart';
import '../../modules/cubit_main/cubit_search/states.dart';
import '../styles/colores.dart';
// import '../styles/colores.dart';

Widget defaulteButton({
  double width = double.infinity,
  Color backGround = Colors.blue,
  required Function function,
  required String txt,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backGround,
      ),
      width: width,
      child: MaterialButton(
        height: 50,
        onPressed: () {
          function();
        },
        child: Text(
          txt.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultTextButton({
  required Function function,
  required String txt,
}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(txt.toUpperCase()));
// Widget defaultFromField({
//   required TextEditingController controller,
//   required TextInputType type,
//   required String txt,
//   required IconData prefiex,
//   IconData? suffix,
//   bool IsPassword = false,
//   Function? suffixPress,
//   onSubmit,
//   onChange,
//   Function? ontabe,
// }) =>
//     TextField(
//       controller: controller,
//       keyboardType: TextInputType.emailAddress,
//       obscureText: IsPassword,
//       onChanged: onChange,
//       onTap: ontabe != null ? () {} : null,
//       decoration: InputDecoration(
//         labelText: txt,
//         prefixIcon: Icon(
//           prefiex,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 icon: Icon(suffix),
//                 onPressed: () {
//                   suffixPress;
//                 },
//               )
//             : null,
//         border: OutlineInputBorder(),
//       ),
//     );

Widget defaultFromField({
  TextEditingController? controller,
  required TextInputType type,
  required String txt,
  required IconData prefiex,
  IconData? suffix,
  // ignore: non_constant_identifier_names
  bool IsPassword = false,
  Function? suffixPress,
  onSubmit,
  onChange,
  Function? ontabe,
}) =>
    TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: IsPassword,
      onChanged: onChange,
      onTap: ontabe != null ? () {} : null,
      decoration: InputDecoration(
        labelText: txt,
        prefixIcon: Icon(
          prefiex,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPress;
                },
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget ink_btn(
  String txt,
  Function? ontabe,
) =>
    InkWell(
        onTap: ontabe != null ? () {} : null,
        child: (Row(
          children: [
            Text(
              txt,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.new_label_outlined),
          ],
        )));
Widget line(int d) => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[d],
    );

// Widget buledTaskItem(Map model) => Container(
//       //2-main container
//       child: Row(children: [
//         CircleAvatar(
//           radius: 40,
//           child: Text('${model['time']}'),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '${model['title']}',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '${model['date']}',
//                 style: TextStyle(fontSize: 13, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.check_box),
//           color: Colors.green,
//         ),
//         IconButton(
//             onPressed: () {}, icon: Icon(Icons.archive), color: Colors.black45)
//       ]),
//     );

// Widget buledTaskItem(Map model, context) => Dismissible(
//     key: Key(model['id'].toString()),
//     child: Container(
//       //2-main container
//       child: Row(children: [
//         CircleAvatar(
//           radius: 40,
//           child: Text('${model['time']}'),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '${model['title']}',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '${model['date']}',
//                 style: TextStyle(fontSize: 13, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.check_box),
//           color: Colors.green,
//         ),
//         IconButton(
//             onPressed: () {}, icon: Icon(Icons.archive), color: Colors.black45),
//       ]),
//     ),
//     onDismissed: (direction) {
//       AppCubit.get(context).deleteData(id: model['id']);
//     });

// Widget buildArticalesItems(article, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewscreen(article['url']));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),

//                   // image: NetworkImage(

//                   //       '${article['https://static.remove.bg/remove-bg-web/913b22608288cd03cc357799d0d4594e2d1c6b41/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png']}'),

//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120,
//                 child: Column(
//                   // mainAxisSize: MainAxisSize.min,

//                   crossAxisAlignment: CrossAxisAlignment.start,

//                   mainAxisAlignment: MainAxisAlignment.start,

//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',

//                         // 'Title Title Title',

//                         style: Theme.of(context).textTheme.bodyText1,

//                         maxLines: 4,

//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',

//                       // 'publishedAt Title Title Title Title',

//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );
// ignore: non_constant_identifier_names
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//       condition: !list.isEmpty,
//       builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) =>
//             buildArticalesItems(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallback: (context) =>
//           isSearch ? Container() : Center(child: CircularProgressIndicator()),
//     );
void showTost({
  required String txt,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Color.fromARGB(225, 0, 85, 135);
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.yellow;
  }
}

Widget main_layer(String txt, Icon ico) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: defaultColor,
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    txt,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // Ink(
                  //   child: InkWell(
                  //       onTap: () {
                  //         print('object');
                  //       },
                  //       child: const Center(
                  //         child: Text(
                  //           'YELLOW',
                  //           style: TextStyle(
                  //               fontSize: 30,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         ),
                  //       )),
                  // ),
                  Spacer(),
                  CircleAvatar(radius: 40, child: ico),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget Customer_list(Datacustomer model) => Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.white,
        child: (Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print('**********');
                  print('${model.id}');
                  // setState(() {
                  data_name_customer_customerId = model.id;
                  data_name_customer_Search_pr = model.name1;
                  // });
                  // Navigator.of(context).pop();
                },
                child: Text(
                  '${model.code}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 1,
            ),
            Text(
              '${model.name1}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              '${model.name2}',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );

Widget btn_sp({required Function ontabe, required String txt}) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          ontabe();
        },
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: defaultColor,
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Center(
                      child: Text(
                        '${txt}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.toc, size: 40, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
Widget inkptn(
        {required Function ontabe, required String txt, required Icon ico}) =>
    GestureDetector(
        onTap: () {
          ontabe();
        },
        child: (Row(
          children: [
            // Icon(
            //   ico,
            //   size: 40,
            //   color: defaultColor,
            // )
            ico,
            SizedBox(
              width: 5,
            ),
            Text(
              txt,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        )));
Widget btn_pop({required String txt, required Function onPressed}) => Container(
    width: double.infinity,
    child: ElevatedButton(
        child: Text(txt),
        onPressed: () {
          onPressed();
        }));

Widget customerLIST(Datacustomer model, context) => Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                data_name_customer_customerId = model.id;
                data_name_customer_Search_pr = model.name1;
                data_name_customer_customercode = model.code;
                showTost(
                    txt: ' تم تحديد العميل \n ${data_name_customer_Search_pr}',
                    state: ToastStates.SUCCESS);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.domain_verification_outlined),
              color: Colors.green[500],
              iconSize: 60,
            ),
            Text(
              '${model.name1}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Main_Cubit.get(context)
                        .Customer_Balance_Respond_resMAIN(model.code);
                  },
                  icon: Icon(Icons.account_balance),
                  color: Colors.blue[600],
                  iconSize: 60,
                ),
                Text('كشف حساب'),
              ],
            ),
          ],
        ),
      ),
    );

itemsLIST(Data_items model, context) => Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    data_name_items_Search = model.name1;
                    data_id_Search = model.id;
                    data_code_items_Search = model.code;
                    data_price_Search = double.parse(model.price);
                    data_unitId_Search = model.unitId;
                    data_unitEquivalent_Search = model.unitEquivalent;
                    data_vat_value_items = model.taxValue;
                    // data_vat_value_items = 0;

                    showTost(
                        txt:
                            ' اسم الصنف:${data_name_items_Search} \nالسعر:${data_price_Search} ',
                        state: ToastStates.SUCCESS);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.domain_verification_outlined),
                  color: Colors.green[500],
                  // color: defaultColor,
                  // color: Colors.amber[700],

                  // col

                  iconSize: 60,
                ),
                Text(
                  '${model.code}',
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '${model.name1}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'السعر:${model.price}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    print('******************');
                    print(model.code);
                    Main_Cubit.get(context)
                        .Items_Balance_Respond_resMAIN(model.code);
                  },
                  icon: Icon(Icons.warehouse),
                  color: Colors.blue[600],
                  iconSize: 60,
                ),
                Text('الرصيد'),
              ],
            ),
          ],
        ),
      ),
    );

profile_screen() => Padding(
      padding: EdgeInsets.all(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Profile:',
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //       color: Colors.blueAccent[200]),
          // ),
          // SizedBox(height: 15),
          // line(300),
          SizedBox(height: 8),
          Row(
            children: [
              Text('اسم الموظف ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${salesPersonName}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('اسم الشركة ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${companyName}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('اسم الفرع ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${branchCode}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('رقم المخزن  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${warehouseCode}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('صلاحيات  التحكم في السعر',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${changeMobilePrice_str}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('صلاحيات  التحكم في الخصم ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Column(
                children: [
                  Text(': ${changeMobileDiscount_str}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
void variable_log() {
  if (branchId == '') {
    showTost(txt: 'branchId', state: ToastStates.ERROR);
    return;
  }
  if (branchName1 == '') {
    showTost(txt: 'branchName1', state: ToastStates.ERROR);
    return;
  }
  if (salesInvoiceBookId == '') {
    showTost(txt: 'salesInvoiceBookId', state: ToastStates.ERROR);
    return;
  }
  if (salesInvoiceTypeCode == '') {
    showTost(txt: 'salesInvoiceTypeCode', state: ToastStates.ERROR);
    return;
  }
  if (salesInvoiceTypeId == '') {
    showTost(txt: 'salesInvoiceTypeId', state: ToastStates.ERROR);
    return;
  }
  if (warehouseId == '') {
    showTost(txt: 'warehouseId', state: ToastStates.ERROR);
    return;
  }
  if (warehouseCode == '') {
    showTost(txt: 'warehouseCode', state: ToastStates.ERROR);
    return;
  }
  if (branchCode == '') {
    showTost(txt: 'branchCode', state: ToastStates.ERROR);
    return;
  }
  if (name_user == '') {
    showTost(txt: 'name_user', state: ToastStates.ERROR);
    return;
  }
  if (salesPersonName == '') {
    showTost(txt: 'salesPersonName', state: ToastStates.ERROR);
    return;
  }
  if (salesPersonCode == '') {
    showTost(txt: 'salesPersonCode', state: ToastStates.ERROR);
    return;
  }
  if (typeID__receipt == '') {
    showTost(txt: 'typeID__receipt', state: ToastStates.ERROR);
    return;
  }
  if (typeCode_receipt == '') {
    showTost(txt: 'typeCode_receipt', state: ToastStates.ERROR);
    return;
  }
  if (typeCode_receipt == '') {
    showTost(txt: 'typeCode_receipt', state: ToastStates.ERROR);
    return;
  }
  if (typesourceID__receipt == '') {
    showTost(txt: 'typesourceID__receipt', state: ToastStates.ERROR);
    return;
  }
  if (bookID_receipt == '') {
    showTost(txt: 'bookID_receipt', state: ToastStates.ERROR);
    return;
  }
  if (typeID__payment == '') {
    showTost(txt: 'typeID__payment', state: ToastStates.ERROR);
    return;
  }
  if (typeCode_payment == '') {
    showTost(txt: 'typeCode_payment', state: ToastStates.ERROR);
    return;
  }
  if (typesourceID__payment == '') {
    showTost(txt: 'typesourceID__payment', state: ToastStates.ERROR);
    return;
  }
  if (bookID_payment == '') {
    showTost(txt: 'bookID_payment', state: ToastStates.ERROR);
    return;
  }
  if (bookID_payment == '') {
    showTost(txt: 'bookID_payment', state: ToastStates.ERROR);
    return;
  }
  if (id_user == '') {
    showTost(txt: 'id_user', state: ToastStates.ERROR);
    return;
  }
  if (currencyId == '') {
    showTost(txt: 'currencyId', state: ToastStates.ERROR);
    return;
  }
  if (changeMobileDiscount_str == '') {
    showTost(txt: 'changeMobileDiscount_', state: ToastStates.ERROR);
    return;
  }
  if (changeMobilePrice_str == '') {
    showTost(txt: 'changeMobilePrice_str', state: ToastStates.ERROR);
    return;
  }
  if (searchWithQtyMobile_str == '') {
    showTost(txt: 'searchWithQtyMobile_str', state: ToastStates.ERROR);
    return;
  }
  if (withoutTaxesMobile_str == '') {
    showTost(txt: 'withoutTaxesMobile_str', state: ToastStates.ERROR);
    return;
  }
  if (salesPersonId == '') {
    showTost(txt: 'salesPersonId', state: ToastStates.ERROR);
    return;
  }
  if (stockIssueBookId_ == '') {
    showTost(txt: 'stockIssueBookId_', state: ToastStates.ERROR);
    return;
  }
  if (stockIssueTypeId_ == '') {
    showTost(txt: 'stockIssueTypeId_', state: ToastStates.ERROR);
    return;
  }
  if (stockIssueTypeId_ == '') {
    showTost(txt: 'stockIssueTypeId_', state: ToastStates.ERROR);
    return;
  }

  if (customerAccountId == '') {
    showTost(txt: 'customerAccountId', state: ToastStates.ERROR);
    return;
  }
  if (customerGroupId == '') {
    showTost(txt: 'customerGroupId', state: ToastStates.ERROR);
    return;
  }
  if (branchOther1Id == '') {
    showTost(txt: 'branchOther1Id', state: ToastStates.ERROR);
    return;
  }
}
