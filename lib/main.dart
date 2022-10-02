// ignore_for_file: unused_label

import 'package:clickonce/modules/cubit_main/cubit.dart';
import 'package:clickonce/modules/home_main/home_screen_nav.dart';
import 'package:clickonce/shared/bloc_observer.dart';
import 'package:clickonce/shared/components/component.dart';
import 'package:clickonce/shared/components/cubit/cubit.dart';
import 'package:clickonce/shared/components/cubit/states.dart';
import 'package:clickonce/shared/network/local/cache_helper.dart';
import 'package:clickonce/shared/network/remote/dio_helper.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:clickonce/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/login/loginnew.dart';
import 'modules/on_boarding/on_boarding.dart';

void main() {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () async {
      blocObserver:
      MyBlocObserver();
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.intit();
      await CacheHelper.init();
      bool? isDark = CacheHelper.getBoolean(key: 'isDark');
      Widget widget;
      bool? onBoarding = CacheHelper.getBoolean(key: 'onBoarding');
      token = CacheHelper.getBoolean(key: 'token');
      dbno = CacheHelper.getBoolean(key: 'nodb');
      user = CacheHelper.getBoolean(key: 'user');
      password = CacheHelper.getBoolean(key: 'password');
      // ignore: unrelated_type_equality_checks
      try {
        branchId = CacheHelper.getBoolean(key: 'branchId');
        warehouseCode = CacheHelper.getBoolean(key: 'warehouseCode');

        branchName1 = CacheHelper.getBoolean(key: 'branchName1');
        salesInvoiceBookCode =
            CacheHelper.getBoolean(key: 'salesInvoiceBookCode');
        salesInvoiceBookId = CacheHelper.getBoolean(key: 'salesInvoiceBookId');
        salesInvoiceTypeCode =
            CacheHelper.getBoolean(key: 'salesInvoiceTypeCode');
        salesInvoiceTypeId = CacheHelper.getBoolean(key: 'salesInvoiceTypeId');
        warehouseId = CacheHelper.getBoolean(key: 'warehouseId');
        typeCode_receipt = CacheHelper.getBoolean(key: 'typeCode_receipt');
        typeID__receipt = CacheHelper.getBoolean(key: 'typeID__receipt');
        typesourceID__receipt =
            CacheHelper.getBoolean(key: 'typesourceID__receipt');
        bookID_receipt = CacheHelper.getBoolean(key: 'bookID_receipt');
        typeCode_payment = CacheHelper.getBoolean(key: 'typeCode_payment');
        typeID__payment = CacheHelper.getBoolean(key: 'typeID__payment');
        typesourceID__payment =
            CacheHelper.getBoolean(key: 'typesourceID__payment');
        bookID_payment = CacheHelper.getBoolean(key: 'bookID_payment');

        id_user = CacheHelper.getBoolean(key: 'id_user');
        name_user = CacheHelper.getBoolean(key: 'name');

        currencyId = CacheHelper.getBoolean(key: 'currencyId');

        stockIssueBookId_ = CacheHelper.getBoolean(key: 'stockIssueBookId');
        stockIssueTypeId_ = CacheHelper.getBoolean(key: 'stockIssueTypeId');
        salesPersonId = CacheHelper.getBoolean(key: 'salesPersonId');
        customerAccountId = CacheHelper.getBoolean(key: 'customerAccountId');
        customerGroupId = CacheHelper.getBoolean(key: 'customerGroupId');

        branchCode = CacheHelper.getBoolean(key: 'branchCode');
        companyName = CacheHelper.getBoolean(key: 'companyName');

        salesPersonName = CacheHelper.getBoolean(key: 'employeeName1');
        salesPersonCode = CacheHelper.getBoolean(key: 'employeeCode');
        branchOther1Id = CacheHelper.getBoolean(key: 'branchOther1Id');

        changeMobileDiscount_str =
            CacheHelper.getBoolean(key: 'changeMobileDiscount');
        if (changeMobileDiscount_str == 'true') {
          changeMobileDiscount_ = true;
        } else {
          changeMobileDiscount_ = false;
        }
        changeMobilePrice_str =
            CacheHelper.getBoolean(key: 'changeMobilePrice');
        if (changeMobilePrice_str == 'true') {
          changeMobilePrice_ = true;
        } else {
          changeMobilePrice_ = false;
        }
        searchWithQtyMobile_str =
            CacheHelper.getBoolean(key: 'searchWithQtyMobile');
        if (searchWithQtyMobile_str == 'true') {
          searchWithQtyMobile_ = true;
        } else {
          searchWithQtyMobile_ = false;
        }
        withoutTaxesMobile_str =
            CacheHelper.getBoolean(key: 'withoutTaxesMobile');
        if (withoutTaxesMobile_str == 'true') {
          withoutTaxesMobile_ = true;
        } else {
          withoutTaxesMobile_ = false;
        }
        //================
        // if (branchId == '') {
        //   showTost(txt: 'branchId', state: ToastStates.ERROR);
        //   connect_varables = false;
        //   //return;
        // }
        // if (branchName1 == '') {
        //   showTost(txt: 'branchName1', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesInvoiceBookId == '') {
        //   showTost(txt: 'salesInvoiceBookId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesInvoiceTypeCode == '') {
        //   showTost(txt: 'salesInvoiceTypeCode', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesInvoiceTypeId == '') {
        //   showTost(txt: 'salesInvoiceTypeId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (warehouseId == '') {
        //   showTost(txt: 'warehouseId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (warehouseCode == '') {
        //   showTost(txt: 'warehouseCode', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (branchCode == '') {
        //   showTost(txt: 'branchCode', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (name_user == '') {
        //   showTost(txt: 'name_user', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesPersonName == '') {
        //   showTost(txt: 'salesPersonName', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesPersonCode == '') {
        //   showTost(txt: 'salesPersonCode', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typeID__receipt == '') {
        //   showTost(txt: 'typeID__receipt', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typeCode_receipt == '') {
        //   showTost(txt: 'typeCode_receipt', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typeCode_receipt == '') {
        //   showTost(txt: 'typeCode_receipt', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typesourceID__receipt == '') {
        //   showTost(txt: 'typesourceID__receipt', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (bookID_receipt == '') {
        //   showTost(txt: 'bookID_receipt', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typeID__payment == '') {
        //   showTost(txt: 'typeID__payment', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typeCode_payment == '') {
        //   showTost(txt: 'typeCode_payment', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (typesourceID__payment == '') {
        //   showTost(txt: 'typesourceID__payment', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (bookID_payment == '') {
        //   showTost(txt: 'bookID_payment', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (bookID_payment == '') {
        //   showTost(txt: 'bookID_payment', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (id_user == '') {
        //   showTost(txt: 'id_user', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (currencyId == '') {
        //   showTost(txt: 'currencyId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (changeMobileDiscount_str == '') {
        //   showTost(txt: 'changeMobileDiscount_', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (changeMobilePrice_str == '') {
        //   showTost(txt: 'changeMobilePrice_str', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (searchWithQtyMobile_str == '') {
        //   showTost(txt: 'searchWithQtyMobile_str', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (withoutTaxesMobile_str == '') {
        //   showTost(txt: 'withoutTaxesMobile_str', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (salesPersonId == '') {
        //   showTost(txt: 'salesPersonId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (stockIssueBookId_ == '') {
        //   showTost(txt: 'stockIssueBookId_', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (stockIssueTypeId_ == '') {
        //   showTost(txt: 'stockIssueTypeId_', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (stockIssueTypeId_ == '') {
        //   showTost(txt: 'stockIssueTypeId_', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }

        // if (customerAccountId == '') {
        //   showTost(txt: 'customerAccountId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (customerGroupId == '') {
        //   showTost(txt: 'customerGroupId', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }
        // if (branchOther1Id == '') {
        //   showTost(txt: 'branchOther1Id', state: ToastStates.ERROR);
        //   connect_varables = false;

        //   //return;
        // }

        //=================
        print('*******************Main*************************');
        print(id_user);
        print(salesPersonId);
        // print(typeID__receipt);
      } catch (e) {
        print(e);
      }

      if (onBoarding != null) {
        if (token != null) {
          widget = Home_screen();
        } else {
          widget = LoginNew();
        }
      } else {
        widget = OnBoardingScreen();
      }
      runApp(MyApp(isDark, widget, token));
    },
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // MyApp(bool? isDark, {Key? key}) : super(key: key);
  bool? onBoarding;
  // MyApp(this.isDark);

  bool? isDark;
  late final Widget startWidget;
  MyApp(this.isDark, this.startWidget, token);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..changeAppMode()),
        BlocProvider(
            create: (context) => Main_Cubit()
              ..customer_all()
              ..getItems_all()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Material App',
              debugShowCheckedModeBanner: false,
              theme: MyTheme.lightTheme,
              // darkTheme: MyTheme.darktheme,
              // themeMode: AppCubit.get(context).isDark
              //     ? ThemeMode.dark
              //     : ThemeMode.light,
              home: Directionality(
                  textDirection: TextDirection.ltr, child: startWidget),
            );
          }),
    );
  }
}
