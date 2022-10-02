// ignore_for_file: camel_case_types

// import 'package:clickonce/modules/invoice_screen/invoice_screen.dart';
import 'package:clickonce/modules/reportScreen/Report_items.dart';
import 'package:clickonce/modules/reportScreen/report_customer.dart';
import 'package:clickonce/modules/reportScreen/trial_customer_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/component.dart';
import '../reportScreen/report_InventoryValue_rep.dart';
import '../reportScreen/report_ItemsTrnx_statment.dart';
import '../reportScreen/report_custmer_statment.dart';
import '../reportScreen/report_pity_cash_screen.dart';
import '../reportScreen/report_saleitems_screen.dart';
import '../reportScreen/report_totalSalesReport.dart';

class Report_Main_Screen extends StatelessWidget {
  const Report_Main_Screen({Key? key}) : super(key: key);
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
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'التقارير',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                btn_sp(
                    txt: 'عهدتي',
                    ontabe: () {
                      navigateTo(context, Report_report_pity_cash_screen());
                    }),
                btn_sp(
                    txt: 'كشف حساب عميل ',
                    ontabe: () {
                      navigateTo(context, Customer_Statment_ReportView());
                    }),
                btn_sp(
                    txt: 'كشف حسابات عملاء ',
                    ontabe: () {
                      navigateTo(context, Trial_Customer_screen());
                    }),
                btn_sp(
                    txt: 'كرتة صنف',
                    ontabe: () {
                      navigateTo(
                          context, Report_ItemsTrnx_statment_ReportView());
                    }),
                btn_sp(
                    txt: 'قائمة برصيد المخزن',
                    ontabe: () {
                      navigateTo(
                          context, Report_InventoryValue_rep_ReportView());
                    }),
                btn_sp(
                    txt: 'تقرير اجمالي المبيعات إجمالي',
                    ontabe: () {
                      navigateTo(context, Total_Sales_ReportView());
                    }),
                btn_sp(
                    txt: 'تقرير تفاصيل المبيعات ',
                    ontabe: () {
                      navigateTo(context, SalesItems_ReportView());
                    }),

                btn_sp(
                    txt: 'قائمة الاصنف',
                    ontabe: () {
                      navigateTo(context, Report_Items());
                    }),

                btn_sp(
                    txt: 'قائمة العملاء',
                    ontabe: () {
                      navigateTo(context, Report_Customer());
                    }),

                //Customer_Statment_ReportView
              ],
            ),
          )
        ],
      ),
    );
  }
}
