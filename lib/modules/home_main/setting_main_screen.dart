// ignore_for_file: camel_case_types, unused_import

import 'package:clickonce/modules/login/loginnew.dart';
import 'package:clickonce/modules/settingScreen/test_home.dart';
import 'package:clickonce/shared/components/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/end_point.dart';
import '../../shared/styles/colores.dart';

class Setting_Main_screen extends StatelessWidget {
  const Setting_Main_screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),

                color: Colors.grey[200],
              )),
          Column(
            children: [
              Text(
                'الاعدادات',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Padding(
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
                            Ink(
                              child: InkWell(
                                  onTap: () {
                                    CacheHelper.removeData(key: 'onBoarding');
                                    CacheHelper.removeData(key: 'nodb');
                                    CacheHelper.removeData(key: 'user');
                                    CacheHelper.removeData(key: 'password');
                                    CacheHelper.removeData(key: 'token');
                                    CacheHelper.removeData(key: 'branchId');
                                    CacheHelper.removeData(key: 'branchName1');
                                    CacheHelper.removeData(key: 'companyName');

                                    CacheHelper.removeData(
                                        key: 'salesInvoiceBookCode');
                                    CacheHelper.removeData(
                                        key: 'salesInvoiceBookId');
                                    CacheHelper.removeData(
                                        key: 'salesInvoiceTypeCode');
                                    CacheHelper.removeData(
                                        key: 'salesInvoiceTypeId');
                                    CacheHelper.removeData(key: 'warehouseId');
                                    CacheHelper.removeData(
                                        key: 'warehouseCode');

                                    CacheHelper.removeData(
                                        key: 'typeCode_receipt');
                                    CacheHelper.removeData(
                                        key: 'typeID__receipt');
                                    CacheHelper.removeData(
                                        key: 'typesourceID__receipt');
                                    CacheHelper.removeData(
                                        key: 'bookID_receipt');
                                    CacheHelper.removeData(
                                        key: 'typeCode_payment');
                                    CacheHelper.removeData(
                                        key: 'typeID__payment');
                                    CacheHelper.removeData(
                                        key: 'typesourceID__payment');
                                    CacheHelper.removeData(
                                        key: 'bookID_payment');

                                    CacheHelper.removeData(key: 'currencyId');
                                    CacheHelper.removeData(
                                        key: 'changeMobileDiscount');
                                    CacheHelper.removeData(
                                        key: 'changeMobilePrice');
                                    CacheHelper.removeData(
                                        key: 'salesPersonId');

                                    CacheHelper.removeData(
                                        key: 'customerAccountId');
                                    CacheHelper.removeData(
                                        key: 'customerGroupId');
                                    CacheHelper.removeData(key: 'branchCode');
                                    CacheHelper.removeData(key: 'companyName');
                                    CacheHelper.removeData(key: 'name');
                                    CacheHelper.removeData(
                                        key: 'employeeName1');
                                    CacheHelper.removeData(key: 'employeeCode');
                                    CacheHelper.removeData(
                                        key: 'searchWithQtyMobile');
                                    CacheHelper.removeData(
                                        key: 'withoutTaxesMobile');
                                    CacheHelper.removeData(
                                        key: 'branchOther1Id');

                                    navigateTo(context, LoginNew());
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Sign Out',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )),
                            ),
                            Spacer(),
                            CircleAvatar(
                                radius: 40,
                                child: Icon(Icons.exit_to_app_sharp,
                                    size: 40, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
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
                            Ink(
                              child: InkWell(
                                  onTap: () {
                                    navigateTo(context, test_home());
                                  },
                                  child: const Center(
                                    child: Text(
                                      'LOG ClickONCE',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.outdoor_grill,
                                  size: 40, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
