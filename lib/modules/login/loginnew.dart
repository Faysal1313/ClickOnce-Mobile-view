// ignore_for_file: override_on_non_overriding_member, must_be_immutable, annotate_overrides

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/end_point.dart';
import '../../shared/styles/colores.dart';
import '../home_main/home_screen_nav.dart';
import 'cubit_login/cubit.dart';
import 'cubit_login/state.dart';

class LoginNew extends StatelessWidget {
  // const LoginNew({Key? key}) : super(key: key);

  @override
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var userdbController = TextEditingController();

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitL(),
        child: BlocConsumer<CubitL, Login_States>(
          listener: (context, state) {
            if (state is Login_SuccessState) {
              if (state.loginModel.status == 'true') {
                //=======================================================
                if (branchId == '') {
                  showTost(txt: 'branchId', state: ToastStates.ERROR);
                  return;
                }
                if (branchName1 == '') {
                  showTost(txt: 'branchName1', state: ToastStates.ERROR);
                  return;
                }
                if (salesInvoiceBookId == 'null') {
                  showTost(txt: 'salesInvoiceBookId', state: ToastStates.ERROR);
                  return;
                }
                if (salesInvoiceTypeCode == '') {
                  showTost(
                      txt: 'salesInvoiceTypeCode', state: ToastStates.ERROR);
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
                  showTost(
                      txt: 'typesourceID__receipt', state: ToastStates.ERROR);
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
                  showTost(
                      txt: 'typesourceID__payment', state: ToastStates.ERROR);
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
                  showTost(
                      txt: 'changeMobileDiscount_', state: ToastStates.ERROR);
                  return;
                }
                if (changeMobilePrice_str == '') {
                  showTost(
                      txt: 'changeMobilePrice_str', state: ToastStates.ERROR);
                  return;
                }
                if (searchWithQtyMobile_str == '') {
                  showTost(
                      txt: 'searchWithQtyMobile_str', state: ToastStates.ERROR);
                  return;
                }
                if (withoutTaxesMobile_str == '') {
                  showTost(
                      txt: 'withoutTaxesMobile_str', state: ToastStates.ERROR);
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

                //=======================================================

                CacheHelper.saveData(key: 'nodb', value: userdbController.text);
                CacheHelper.saveData(key: 'user', value: emailController.text);
                CacheHelper.saveData(
                    key: 'branchId', value: state.loginModel.data.branchId);
                CacheHelper.saveData(
                    key: 'branchName1',
                    value: state.loginModel.data.branchName1);
                CacheHelper.saveData(
                    key: 'companyName',
                    value: state.loginModel.data.companyName);
                CacheHelper.saveData(
                    key: 'salesInvoiceBookCode',
                    value: state.loginModel.data.salesInvoiceBookCode);
                CacheHelper.saveData(
                    key: 'salesInvoiceBookId',
                    value: state.loginModel.data.salesInvoiceBookId);
                CacheHelper.saveData(
                    key: 'salesInvoiceTypeCode',
                    value: state.loginModel.data.salesInvoiceTypeCode);
                CacheHelper.saveData(
                    key: 'salesInvoiceTypeId',
                    value: state.loginModel.data.salesInvoiceTypeId);
                CacheHelper.saveData(
                    key: 'warehouseCode',
                    value: state.loginModel.data.warehouseCode);
                CacheHelper.saveData(
                    key: 'warehouseId',
                    value: state.loginModel.data.warehouseId);
                CacheHelper.saveData(
                    key: 'typeCode_receipt',
                    value: state.loginModel.data.receiptTypeCode);
                CacheHelper.saveData(
                    key: 'typeID__receipt',
                    value: state.loginModel.data.receiptTypeId);
                CacheHelper.saveData(
                    key: 'typesourceID__receipt',
                    value: state.loginModel.data.receiptSourceId);
                CacheHelper.saveData(
                    key: 'bookID_receipt',
                    value: state.loginModel.data.receiptBookId);
                CacheHelper.saveData(
                    key: 'typeCode_payment',
                    value: state.loginModel.data.paymentTypeCode);
                CacheHelper.saveData(
                    key: 'typeID__payment',
                    value: state.loginModel.data.paymentTypeId);
                CacheHelper.saveData(
                    key: 'typesourceID__payment',
                    value: state.loginModel.data.paymentSourceId);
                CacheHelper.saveData(
                    key: 'bookID_payment',
                    value: state.loginModel.data.paymentBookId);
                CacheHelper.saveData(
                    key: 'id_user', value: state.loginModel.data.id);
                CacheHelper.saveData(
                    key: 'stockIssueBookId',
                    value: state.loginModel.data.stockIssueBookId);
                CacheHelper.saveData(
                    key: 'stockIssueTypeId',
                    value: state.loginModel.data.stockIssueTypeId);
                CacheHelper.saveData(
                    key: 'currencyId', value: state.loginModel.data.currencyId);
                CacheHelper.saveData(
                    key: 'employeeCode',
                    value: state.loginModel.data.employeeCode);
                CacheHelper.saveData(
                    key: 'employeeName1',
                    value: state.loginModel.data.employeeName1);

                CacheHelper.saveData(
                    key: 'changeMobileDiscount',
                    value: state.loginModel.data.changeMobileDiscount);
                CacheHelper.saveData(
                    key: 'changeMobilePrice',
                    value: state.loginModel.data.changeMobilePrice);
                CacheHelper.saveData(
                    key: 'searchWithQtyMobile',
                    value: state.loginModel.data.searchWithQtyMobile);
                CacheHelper.saveData(
                    key: 'withoutTaxesMobile',
                    value: state.loginModel.data.withoutTaxesMobile);
                CacheHelper.saveData(
                    key: 'salesPersonId',
                    value: state.loginModel.data.employeeId);
                CacheHelper.saveData(
                    key: 'customerAccountId',
                    value: state.loginModel.data.customerAccountId);
                CacheHelper.saveData(
                    key: 'customerGroupId',
                    value: state.loginModel.data.customerGroupId);
                CacheHelper.saveData(
                    key: 'branchCode', value: state.loginModel.data.branchCode);
                CacheHelper.saveData(
                    key: 'companyName',
                    value: state.loginModel.data.companyName);
                CacheHelper.saveData(
                    key: 'name', value: state.loginModel.data.name);
                CacheHelper.saveData(
                    key: 'branchOther1Id',
                    value: state.loginModel.data.branchOther1Id);

                CacheHelper.saveData(
                    key: 'password', value: passController.text);
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.data.token)
                    .then((value) {
                  token = state.loginModel.data.token;

                  navigateAndFinish(context, Home_screen());
                });
                print(state.loginModel.data.email);
                showTost(
                    txt: 'تم تسجيل الدخول بنجاح ${state.loginModel.data.email}',
                    state: ToastStates.SUCCESS);
              } else {
                // showTost(
                //     txt: state.loginModel.status.toString(),
                //     state: ToastStates.ERROR);
              }
            } else {
              showTost(
                  txt: 'لايمكن الاتصال بقاعدة البيانات',
                  state: ToastStates.ERROR);
              // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              return;
            }
          },
          builder: (context, state) {
            return Scaffold(
              // appBar: AppBar(backgroundColor: defaultColor),
              backgroundColor: defaultColor,
              body: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    // Icon(Icons.currency_exchange_outlined,
                    //     size: 80, color: Colors.white),
                    Image(
                      // image: AssetImage('assets/image/logoclick.png'),
                      image: AssetImage('assets/image/clickoncelogo.png'),

                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Click Once',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: Colors.white,
                              )),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      color: defaultColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFromField(
                                      controller: userdbController,
                                      type: TextInputType.emailAddress,
                                      txt: 'DataBase Number',
                                      prefiex: Icons.dataset_linked_sharp),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFromField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      txt: 'Email',
                                      prefiex: Icons.email),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFromField(
                                      controller: passController,
                                      type: TextInputType.visiblePassword,
                                      suffix: Icons.visibility_outlined,
                                      txt: 'Password',
                                      IsPassword: true,
                                      prefiex: Icons.password),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ConditionalBuilder(
                                    condition: State is! Login_States,
                                    fallback: (context) => Center(
                                        child: CircularProgressIndicator()),
                                    builder: (context) => Container(
                                      //buttom
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: defaultColor,
                                      ),
                                      //  width: double.infinity,
                                      width: 270,
                                      child: MaterialButton(
                                        height: 50,
                                        onPressed: () {
                                          CubitL.get(context).login(
                                              userdb: userdbController.text,
                                              email: emailController.text,
                                              password: passController.text);
                                          // CubitL.get(context).customer_all();

                                          // print('****************************');
                                          // CubitL.get(context).userLogin(
                                          //     userdb: userdbController.text,
                                          //     email: emailController.text,
                                          //     password: passController.text

                                          //     //     // userdb: '9SW3',
                                          //     //     // email: 'admin@test.com',
                                          //     //     // password: '123'

                                          //     );
                                          // navigateAndFinish(context, Home_Main());
                                          // print('****************************');

                                          // if (state is Shop_Login_SuccessState) {
                                          // if (state.LoginModel.status == true) {
                                          //     print(
                                          //         '+++++++++++++++++++************************');
                                          //     print(state.LoginModel.message.toString());
                                          //     print(state.LoginModel.data?.token);
                                          //   } else {
                                          //     print(state.LoginModel.message);
                                          //   }
                                          // }
                                        },
                                        child: Text(
                                          'SIGN IN'.toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Don\'t have an account'),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                            color: defaultColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${cError_login} ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
