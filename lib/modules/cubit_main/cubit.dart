// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, camel_case_types, unrelated_type_equality_checks

import 'package:clickonce/models/customer_model.dart';
import 'package:clickonce/models/items_model.dart';
import 'package:clickonce/models/receiptvoucher.dart';
import 'package:clickonce/modules/cubit_main/states.dart';
import 'package:clickonce/modules/home_main/report_main_screen.dart';
import 'package:clickonce/modules/home_main/setting_main_screen.dart';
import 'package:clickonce/shared/components/constance.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/CycleInsertSalesInvoiceSto.dart';
import '../../models/customerCheakCode.dart';
import '../../models/customer_respond.dart';
import '../../models/invoice_respond.dart';
import '../../models/items_and customer_balance_respond.dart';
import '../../models/stockissuevoucher.dart';
import '../../shared/components/component.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../home_main/home_main_screen.dart';
// import 'package:http/http.dart' as http;

// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';

class Main_Cubit extends Cubit<Main_states> {
  Main_Cubit() : super(Main_Initial_states());
  static Main_Cubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    Home_Main_screen(),
    Report_Main_Screen(),
    Setting_Main_screen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(Main_Bottum_Nav_states());
  }

  Items_Model? items_model;
  late List<dynamic> lsx = [];
  late String apiqty;
  void getItems_all() async {
    if (searchWithQtyMobile_ == true) {
      apiqty = 'getAllItemsCardWithBalancePostman?companyCode=${dbno}';
    } else {
      apiqty = 'getAllItemsCardPostman?companyCode=${dbno}';
    }
    await DioHelper.getData(
      url: apiqty,
    ).then((value) {
      items_model = Items_Model.fromJson(value.data);
      // print('*******369**********');

      // print(items_model!.data_items[0].code);
      // print(items_model!.data_items[0].name1);
      // print(items_model!.data_items[0].name2);
      // print(items_model!.data_items[0].id);
      // print(items_model!.data_items[0].unitEquivalent);
      // print(items_model!.data_items[0].unitId);

      // if (items_model!.data_items.isNotEmpty)
      //   for (var i = 0; i < items_model!.data_items.length; i++) {
      //     print('*******369**********');
      //     print(items_model!.data_items[i].code);
      //     print(items_model!.data_items[i].name1);
      //     print(items_model!.data_items[i].price);
      //     // listprod.add(items_model!.data_items[i].code);
      //   }
      // print('********List come from cubit*****************');
      // print(listprod.length);
      // print(listprod.toList());

      // print('*******123**********');
      emit(Main_Success_Items_states());
    }).catchError((error) {
      print(error.toString());
      connect = false;
      // emit(Main_Error_Items_states());
    });
  }

  CustomerModel? cutomer_model;
  List<dynamic> cutomer_model_list = [];

  Future<void> customer_all() async {
    DioHelper.getData(
      url:
          'getAllActiveCustomersPostman?companyCode=${dbno}&branchCode=${branchCode}',
      // 'getAllActiveCustomersPostman?companyCode=${dbno}&branchCode=001',
    ).then((value) {
      AsyncSnapshot.waiting();

      cutomer_model = CustomerModel.fromJson(value.data);
      cutomer_model_list = cutomer_model!.datacustomer;

      emit(Main_Success_Customer_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Main_Error_Customer_states());
    });
  }

  String STate_inv = '';
  // String no_inv = '';

  late Invoice_Respond invoice_respond;
  void insertinvoice(String txt) {
    // print(txt);
    emit(Invoice_LodingState());
    DioHelper.postData(
            // DioHelper.getData(
            url: 'salesInvoiceInsertPostman?companyCode=${dbno}',
            data: txt)
        .then((value) {
      invoice_respond = Invoice_Respond.fromJson(value.data);
      No_invoice = invoice_respond.docNumber;
      ID_invoice = invoice_respond.id;

      print('////////**************************');
      print(invoice_respond.id);
      print(invoice_respond.docNumber);
      print(invoice_respond.result);
      emit(Invoice_SuccessState(invoice_respond));
      //
      print('Emit respond invoice////////**************************');

      print(invoice_respond.docNumber);
    }).catchError((error) {
      print('Error in Invoice_Respond API:------------');
      txtrecevcashjson = txt;
      printFullText(txt);
      print(error.toString());
      // emit(InvoiceErrorState(error.toString()));
    });
  }

  late StockIssueVoucher_Respond stock_issue_voucher_respond;
  void insert_StockIssueVoucher(String txt) {
    print(txt);
    emit(StockIssueVoucher_LodingState());
    DioHelper.postData(
            url: 'stockIssueVoucherInsertPostman?companyCode=${dbno}',
            data: txt)
        .then((value) {
      stock_issue_voucher_respond =
          StockIssueVoucher_Respond.fromJson(value.data);
      No_issue_voucher = stock_issue_voucher_respond.docNumber;
      ID_issue_voucher = stock_issue_voucher_respond.id;

      print('*************/**/*//*/**/*/*/*//*/*///*/*******************');
      print(ID_invoice);
      print(ID_issue_voucher);

      emit(StockIssueVoucher_SuccessState(stock_issue_voucher_respond));
      print(
          '*************Cubit Invoice and Issue/**/*//*/**/*/*/*//*/*///*/*******************');
      print(ID_invoice);
      print(ID_issue_voucher);

      print(invoice_respond.id);
      print(stock_issue_voucher_respond.id);

      insert_cycleInsert_sales_invoiceStockIssue(
          invoice_respond.id, stock_issue_voucher_respond.id);

      // insert_cycleInsert_sales_invoiceStockIssue('');
    }).catchError((error) {
      print('Error in Invoice_Respond API:------------');
      txtrecevcashjson = txt;
      // printFullText(txt);
      // print(error.toString());
      // emit(IStockIssueVoucherErrorState(error.toString()));
    });
  }

  late CycleInsertSalesInvoiceStockIssuePostman
      cycleInsert_sales_invoiceStockIssue_respond;
  void insert_cycleInsert_sales_invoiceStockIssue(String id1, String id2) {
    // print(txt);
    // if (ID_invoice == '') {
    //   print('is null ID_invoice');
    // }
    // if (ID_issue_voucher == '') {
    //   print('is null ID_issue_voucher');
    // }
    emit(CycleInsertSalesInvoiceStockIssuePostman_LodingState());
    DioHelper.getData(
      url:
          // 'http://178.128.146.68/documentsCycleInsertSalesInvoiceStockIssuePostman?prevDocumentId=${ID_invoice}&docId=${ID_issue_voucher}&companyCode=${dbno}',
          'documentsCycleInsertSalesInvoiceStockIssuePostman?prevDocumentId=${id1}&docId=${id2}&companyCode=${dbno}',

      //http://178.128.146.68/documentsCycleInsertSalesInvoiceStockIssuePostman?prevDocumentId=63298b99f43b814e1fafd7bd&docId=63298b9e1f6e1cb222afdb6f&companyCode=D7PH
    ).then((value) {
      cycleInsert_sales_invoiceStockIssue_respond =
          CycleInsertSalesInvoiceStockIssuePostman.fromJson(value.data);
      print('*********************************');
      print(cycleInsert_sales_invoiceStockIssue_respond.message);
      emit(CycleInsertSalesInvoiceStockIssuePostman_SuccessState(
          cycleInsert_sales_invoiceStockIssue_respond));
    }).catchError((error) {
      print('Error in Invoice_Respond API:------------');
      // printFullText(txt);
      print(error.toString());
      // emit(IStockIssueVoucherErrorState(error.toString()));
    });
  }

  late ReceiptVoucher receipt_voucher;
  void insertReceiptVoucher(String txt) {
    emit(Invoice_LodingState());

    print(txt);
    DioHelper.postData(
            url:
                'multiPaymentAndReceiptVoucherInsertPostman?companyCode=${dbno}',
            data: txt)
        .then((value) {
      receipt_voucher = ReceiptVoucher.fromJson(value.data);
      emit(ReceiptVoucher_SuccessState(receipt_voucher));
    }).catchError((error) {
      print('Error in Receipt_voucher API:------------');
      // txtrecevcashjson = txt;
      // printFullText(txt);
      // print(error.toString());
      // emit(InvoiceErrorState(error.toString()));
    });
  }

  late Customer_respond customerespond;
  void insertCustomer_add_respond(String txt) {
    emit(Invoice_LodingState());
    DioHelper.postData(
            url: 'customersInsertPostman?companyCode=${dbno}', data: txt)
        .then((value) {
      customerespond = Customer_respond.fromJson(value.data);
      emit(Customer_respond_SuccessState(customerespond));
    }).catchError((error) {
      print(error.toString());
      // printFullText(txt);
      emit(Customer_respondErrorState(error.toString()));
    });
  }

//-------------------------
  CustomersCheckCode? customerscheck_code;
  void isCustomersName(String nameValue) {
    if (nameValue == '') return;
    // emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          // 'http://178.128.146.68/getAllActiveCustomersPostman?companyCode=${dbno}&searchText=${qValue}',
          'customersCheckNamePostman?companyCode=${dbno}&customerName=${nameValue}',
    ).then((value) {
      customerscheck_code = CustomersCheckCode.fromJson(value.data);
      // emit(Search_Success_search_states());
      // emit(Customer_respond_SuccessState(customerespond));
      isCustomersName_b = customerscheck_code!.data.Exist;
      print(customerscheck_code!.data.Exist);
      print(isCustomersName_b);
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
      // emit(Customer_respondErrorState(error.toString()));
    });
  }

  void iscustomersCheckCode(String codeValue) {
    if (codeValue == '') return;
    // emit(Validation_customer_LodingState());
    DioHelper.getData(
      url:
          'customersCheckCodePostman?companyCode=${dbno}&customerCode=${codeValue}',
    ).then((value) {
      customerscheck_code = CustomersCheckCode.fromJson(value.data);
      // emit(Search_Success_search_states());
      // emit(Customer_respond_SuccessState(customerespond));
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
      // emit(Customer_respondErrorState(error.toString()));
    });
  }

  void valid_code_and_name(String address_var, String notes_var) async {
    if (id_Add_customer.isEmpty) {
      showTost(
          txt: 'يجب ادخال كود العميل او رقم التلفون ',
          state: ToastStates.ERROR);
      return;
    } else if (name_Add_customer.isEmpty) {
      showTost(txt: 'يجب اختيار اسم للعميل', state: ToastStates.ERROR);
      return;
    }
    //=========chik code customer
    await DioHelper.getData(
      url:
          'customersCheckCodePostman?companyCode=${dbno}&customerCode=${id_Add_customer}',
    ).then((value) {
      customerscheck_code = CustomersCheckCode.fromJson(value.data);
      print(
          'customersCheckCodePostman:=====11111111111---CODE-----11111111111111/---------------------------------//');
      iscustomersCheckCode_b = customerscheck_code!.data.Exist;
    }).catchError((error) {
      print(error.toString());
    });
    //===========
    if (iscustomersCheckCode_b == 'true') {
      print('code is repetation-----true----CODE---------');
      showTost(txt: 'الكود مكرر', state: ToastStates.ERROR);
      return;
    }
    //=========chik name customer
    await DioHelper.getData(
      url:
          'customersCheckNamePostman?companyCode=${dbno}&customerName=${name_Add_customer}',
    ).then((value) {
      customerscheck_code = CustomersCheckCode.fromJson(value.data);
      print(
          'customersCheckCodePostman:=====11111111111---NAME-----11111111111111/---------------------------------//');
      isCustomersName_b = customerscheck_code!.data.Exist;
      print(customerscheck_code!.data.Exist);
      print(isCustomersName_b);
    }).catchError((error) {
      print(error.toString());
    });
    //===========
    isCustomersName(id_Add_customer);
    if (isCustomersName_b == 'true') {
      showTost(txt: 'اسم العميل مكرر', state: ToastStates.ERROR);
      return;
    } else {
      String txt = '''
{
    "additionalDetailsList": [
        {
            "name": "",
            "value": ""
        }
    ],
    "additionalInformation": "",
    "address": "",
    "branches": [
        "${branchId}"
    ],
    "buildingNumber": "",
    "city": "AFGKabul",
    "code": "${id_Add_customer}",
    "country": "AFG",
    "countryTaxes": "EG",
    "creditLimit": "0",
    "creditPeriod": "0",
    "currency": "${currencyId}",
    "description": "${notes_var}",
    "exempt": "0",
    "fax": "",
    "floor": "${notes_var}",
    "governate": "",
    "group": "${customerGroupId}",
    "integration": [
        {
            "accountFromChart": "${customerAccountId}",
            "accountName": "Customers",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "SalesReturns",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "GrossSales",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "AccountReceivables",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "SalesDiscount",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "OtherAccounts1",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "OtherAccounts2",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "OtherAccounts3",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "OtherAccounts4",
            "description": ""
        },
        {
            "accountFromChart": "",
            "accountName": "OtherAccounts5",
            "description": ""
        }
    ],
    "isActive": "on",
    "itemPriceFactor": 0.0,
    "landmark": "",
    "mail": "",
    "name1": "${name_Add_customer}",
    "name2": "${name_Add_customer}",
    "nationalId": "",
    "postalCode": "",
    "priceName": "price0",
    "regionCity": "",
    "responsiblePerson":"${salesPersonId}",
    "result": "true",
    "room": "",
    "salesPerson": "${salesPersonId}",
    "shippingAddress": "",
    "street": "",
    "targetDetailsList": [
        {
            "actualSales": "",
            "rowIndex": 0,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 1,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 2,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 3,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 4,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 5,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 6,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 7,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 8,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 9,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 10,
            "targetValue": ""
        },
        {
            "actualSales": "",
            "rowIndex": 11,
            "targetValue": ""
        }
    ],
    "taxGlobalSubType": "null",
    "taxGlobalType": "null",
    "taxesFile": "",
    "taxesId": "*",
    "telephone1": "",
    "telephone2": "",
    "type": "customer",
    "typee": "null",
    "website": ""
}
''';
      insertCustomer_add_respond(txt);
      // print('**************************sccussefulty Voucher***************');
      // print(txt);
    }
  }

  Items_Balance_Respond? items_balance_respond;
  void Items_Balance_Respond_resMAIN(String qValue) {
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupItemsTrnxBalancePostman?itemCode=${qValue}&warehouseCode=${warehouseCode}&companyCode=${dbno}',
    ).then((value) {
      items_balance_respond = Items_Balance_Respond.fromJson(value.data);
      showTost(
          txt:
              ' رصيد من الصنف: \n${items_balance_respond!.balance.toString()} ',
          state: ToastStates.SUCCESS);
    }).catchError((error) {});
  }

  void Customer_Balance_Respond_resMAIN(String qValue) {
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupCustomersTrnxBalancePostman?customerCode=${qValue}&companyCode=${dbno}',
    ).then((value) {
      items_balance_respond = Items_Balance_Respond.fromJson(value.data);
      showTost(
          txt: ' رصيد العميل: \n${items_balance_respond!.balance.toString()} ',
          state: ToastStates.SUCCESS);
    }).catchError((error) {});
  }
}
