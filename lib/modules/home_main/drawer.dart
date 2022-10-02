import 'package:clickonce/modules/home_main/setting_main_screen.dart';
import 'package:clickonce/modules/invoice_screen/invoice_screen.dart';
import 'package:clickonce/modules/reportScreen/report_ItemsTrnx_statment.dart';
import 'package:clickonce/modules/reportScreen/report_customer.dart';
import 'package:clickonce/modules/reportScreen/report_pity_cash_screen.dart';
import 'package:clickonce/shared/components/component.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:flutter/material.dart';

import '../../shared/network/local/cache_helper.dart';
import '../login/loginnew.dart';
import '../reportScreen/report_custmer_statment.dart';
import 'draw_items.dart';

class Drawer_screen extends StatelessWidget {
  const Drawer_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'Cash Statment',
                icon: Icons.people,
                onPressed: () {
                  navigateTo(context, Report_report_pity_cash_screen());
                },
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: () async {
                    final data = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Profile'),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profile_screen()
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Items Statment',
                  icon: Icons.message_outlined,
                  // onPressed: () => onItemPressed(context, index: 2)),
                  onPressed: () => navigateTo(
                      context, Report_ItemsTrnx_statment_ReportView())),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Customer Statment',
                  icon: Icons.message_outlined,
                  // onPressed: () => onItemPressed(context, index: 2)),
                  onPressed: () =>
                      navigateTo(context, Customer_Statment_ReportView())),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Invoice',
                  icon: Icons.insert_invitation_outlined,
                  // onPressed: () => onItemPressed(context, index: 3)),
                  onPressed: () =>
                      navigateTo(context, Invoice_Screen_normal())),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  // onPressed: () => onItemPressed(context, index: 4)),
                  onPressed: () => navigateTo(context, Setting_Main_screen())),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  // onPressed: () => onItemPressed(context, index: 5)),
                  onPressed: () {
                    CacheHelper.removeData(key: 'onBoarding');
                    CacheHelper.removeData(key: 'nodb');
                    CacheHelper.removeData(key: 'user');
                    CacheHelper.removeData(key: 'password');
                    CacheHelper.removeData(key: 'token');
                    CacheHelper.removeData(key: 'branchId');
                    CacheHelper.removeData(key: 'branchName1');
                    CacheHelper.removeData(key: 'companyName');

                    CacheHelper.removeData(key: 'salesInvoiceBookCode');
                    CacheHelper.removeData(key: 'salesInvoiceBookId');
                    CacheHelper.removeData(key: 'salesInvoiceTypeCode');
                    CacheHelper.removeData(key: 'salesInvoiceTypeId');
                    CacheHelper.removeData(key: 'warehouseId');
                    CacheHelper.removeData(key: 'warehouseCode');

                    CacheHelper.removeData(key: 'typeCode_receipt');
                    CacheHelper.removeData(key: 'typeID__receipt');
                    CacheHelper.removeData(key: 'typesourceID__receipt');
                    CacheHelper.removeData(key: 'bookID_receipt');
                    CacheHelper.removeData(key: 'typeCode_payment');
                    CacheHelper.removeData(key: 'typeID__payment');
                    CacheHelper.removeData(key: 'typesourceID__payment');
                    CacheHelper.removeData(key: 'bookID_payment');

                    CacheHelper.removeData(key: 'currencyId');
                    CacheHelper.removeData(key: 'changeMobileDiscount');
                    CacheHelper.removeData(key: 'changeMobilePrice');
                    CacheHelper.removeData(key: 'salesPersonId');

                    CacheHelper.removeData(key: 'customerAccountId');
                    CacheHelper.removeData(key: 'customerGroupId');
                    CacheHelper.removeData(key: 'branchCode');
                    CacheHelper.removeData(key: 'companyName');
                    CacheHelper.removeData(key: 'name');
                    CacheHelper.removeData(key: 'employeeName1');
                    CacheHelper.removeData(key: 'employeeCode');

                    navigateTo(context, LoginNew());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const People()));
        break;
    }
  }

  Widget headerWidget() {
    // const url = 'https://www.onlinewebfonts.com/icon/568657';
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          // backgroundImage: NetworkImage(url),
          backgroundImage: AssetImage('assets/image/avatar.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${salesPersonName}',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('${name_user}',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}
