// ignore_for_file: prefer_single_quotes, camel_case_types

import 'package:clickonce/modules/Receve_payment/receiptvoucher_screen.dart';
import 'package:clickonce/modules/home_main/chart.dart';
import 'package:clickonce/modules/login/loginnew.dart';
// import 'package:clickonce/shared/styles/colores.dart';
import 'package:flutter/material.dart';

import '../../shared/components/component.dart';
import '../../shared/network/remote/end_point.dart';
import '../Receve_payment/payvoucher_screen.dart';
import '../add_customer/add_customer.dart';
import '../invoice_screen/invoice_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home_Main_screen extends StatefulWidget {
  const Home_Main_screen({Key? key}) : super(key: key);

  @override
  State<Home_Main_screen> createState() => _Home_Main_screenState();
}

class _Home_Main_screenState extends State<Home_Main_screen> {
  @override
  late List<GDPData> _charData;
  late TooltipBehavior _tooltipBehaviro;
  void initState() {
    // setState(() {
    _charData = getchartData();
    _tooltipBehaviro = TooltipBehavior(enable: true);
    if (connect_varables == false) {
      // navigateAndFinish(context, LoginNew());
    }
    // });
  }

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
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),

                  // color: Colors.white,
                  color: Colors.grey[200])),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            //invoice
                            //-----------------------------
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  navigateTo(context, Invoice_Screen_normal());
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  // color: defaultColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(3),
                                          // color: Colors.white,
                                          // boxShadow: const [
                                          //   BoxShadow(
                                          //       color: Colors.blueAccent,
                                          //       spreadRadius: 3),
                                          //   // BoxShadow(
                                          //   //     color: Colors.yellow,
                                          //   //     spreadRadius: 5),
                                          // ],
                                          ),
                                      height: 60,
                                      width: 60,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/image/invoice.png"),
                                          height: 40,
                                          width: 40),
                                    ),
                                    Text(
                                      'فواتير',
                                      style: TextStyle(
                                        fontSize: 25,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            //Re-invoce
                            //-----------------------------
                            GestureDetector(
                              onTap: () {
                                navigateTo(context, PaymentVoucher_screen());
                              },
                              child: Container(
                                // decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                // ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/image/pay_cash.png"),
                                        height: 40,
                                        width: 40),
                                    Text(
                                      'سند صرف',
                                      style: TextStyle(
                                        fontSize: 25,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            //Recever
                            //-----------------------------
                            GestureDetector(
                              onTap: () {
                                navigateTo(context, ReceiptVoucher_screen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/image/recev_cash.png"),
                                        height: 40,
                                        width: 40),
                                    Text(
                                      'سند قبض',
                                      style: TextStyle(
                                        fontSize: 25,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          //AddCustomer
                          //-----------------------------
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, add_customer());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: defaultColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/image/add_customer2.png"),
                                      // "assets/image/icon2.png"),
                                      height: 40,
                                      width: 40),
                                  Text(
                                    'إضافة عميل',
                                    style: TextStyle(
                                      fontSize: 25,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          //Transfer Wares
                          //-----------------------------
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, Chart());
                            },
                            child: Container(
                              //   decoration: BoxDecoration(
                              //       // borderRadius: BorderRadius.circular(15),
                              //       ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/image/transfer_ware.png"),
                                      // "assets/image/icon1.png"),
                                      height: 40,
                                      width: 40),
                                  Text(
                                    'عرض فواتير ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    child: SafeArea(
                  child: SfCircularChart(
                    title: ChartTitle(text: 'الاصناف الاكثر مبيعا'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    tooltipBehavior: _tooltipBehaviro,
                    series: <CircularSeries>[
                      PieSeries<GDPData, String>(
                          dataSource: _charData,
                          xValueMapper: (GDPData data, _) => data.continent,
                          yValueMapper: (GDPData data, _) => data.gdp,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          enableTooltip: true),
                    ],
                  ),
                )),
                SizedBox(
                  height: 5,
                ),
                Text('${companyName} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent[200])),
                Text('${dbno}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent[200])),
                Text(' ${salesPersonName} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent[200])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<GDPData> getchartData() {
    final List<GDPData> chartData = [
      GDPData('فراخ 700', 1600),
      GDPData('800فراخ', 2490),
      GDPData('850 فراخ', 2900),
      GDPData('فراخ950', 21000),
      GDPData('1200 فراخ', 24880),
      GDPData('1300فراخ', 34390),

      // GDPData('تحقيق الهدف', 8000),
      // GDPData('المتبقي من تحقيق الهدف', 12000),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
