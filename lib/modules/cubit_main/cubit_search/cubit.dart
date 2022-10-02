// ignore_for_file: non_constant_identifier_names, duplicate_ignore, unused_import

import 'package:clickonce/models/items_model.dart';
import 'package:clickonce/models/trial_customer.dart';
import 'package:clickonce/modules/cubit_main/cubit_search/states.dart';
import 'package:clickonce/shared/components/constance.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/InventoryValue_rep.dart';
import '../../../models/ItemsTrnx_rep.dart';
import '../../../models/SalesItemsReport.dart';
import '../../../models/customer_model.dart';
import '../../../models/customersTrnxrep_model.dart';
import '../../../models/invoice_no.dart';
import '../../../models/items_and customer_balance_respond.dart';
import '../../../models/pity_cash_report_model.dart';
import '../../../models/rep_totalSalesReport.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../invoice_screen/invoice_pdf/invoice_service.dart';

// ignore: camel_case_types
class Search_Cubit extends Cubit<Search_states> {
  Search_Cubit() : super(Search_Initial_search_states());
  static Search_Cubit get(context) => BlocProvider.of(context);

  // ignore: non_constant_identifier_names
  Items_Model? items_model;
  List<dynamic> search_items = [];
  late String apiqty;
  // void getItems_search() {
  void getItems_search(String qValue) {
    if (searchWithQtyMobile_ == true) {
      apiqty =
          'getAllItemsCardWithBalancePostman?companyCode=${dbno}&searchText=${qValue}&branchCode=${branchCode}';
    } else {
      apiqty =
          'getAllItemsCardPostman?companyCode=${dbno}&searchText=${qValue}';
    }
    emit(Search_Loading_search_states());
    DioHelper.getData(url: apiqty
            // 'getAllItemsCardPostman?companyCode=${dbno}&searchText=${qValue}',
            //'getAllItemsCardWithBalancePostman?companyCode=${dbno}&searchText=${qValue}&branchCode=${branchCode}',
            )
        .then((value) {
      items_model = Items_Model.fromJson(value.data);
      search_items = items_model!.data_items;
      // print('1111111111111111111111111/---------------------------------');
      // print(items_model?.status);
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  CustomerModel? customer_model;
  List<dynamic> search_customer = [];
  void getCustomer_search(String qValue) {
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getAllActiveCustomersPostman?companyCode=${dbno}&searchText=${qValue}&branchCode=${branchCode}',
    ).then((value) {
      customer_model = CustomerModel.fromJson(value.data);
      search_customer = customer_model!.datacustomer;
      // printFullText(customer_model!.datacustomer[0].name1);
      // print(customer_model!.result[0].name1);
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

// //-------------------------
//   CustomersCheckName? customerscheckName;
//   List<dynamic> customerscheckNamelist = [];
//   void isCustomersName(String qValue) {
//     emit(Search_Loading_search_states());
//     DioHelper.getData(
//       url:
//           // 'http://178.128.146.68/getAllActiveCustomersPostman?companyCode=${dbno}&searchText=${qValue}',
//           'http://178.128.146.68/customersCheckNamePostman?companyCode=9SW3&customerName=عملاء',
//     ).then((value) {
//       customerscheckName = CustomersCheckName.fromJson(value.data);
//       print('1111111111111111111111111/---------------------------------');
//       printFullText(customerscheckName?.data.notExist);
//       emit(Search_Success_search_states());
//     }).catchError((error) {
//       print(error.toString());
//       emit(Search_Error_search_states());
//     });
//   }

// //-------------------------------------
  GetInvoiceNo? getinvoiceno;
  void getInvoiceNO() {
    // emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          //SLM0110
          'salesInvoiceCustomDataPostman?companyCode=${dbno}&docNumber=${No_invoice}',
      // 'salesInvoiceCustomDataPostman?companyCode=${dbno}&docNumber=SLM0110',
    ).then((value) {
      getinvoiceno = GetInvoiceNo.fromJson(value.data);
      itemcodecolum.clear();
      pricecolum.clear();
      QTYcolum.clear();
      detailsTotalcolum.clear();
      for (var i = 0;
          i < getinvoiceno!.data_GetInvoiceNo.salesInvoiceDetailsList.length;
          i++) {
        itemcodecolum.add(getinvoiceno!
            .data_GetInvoiceNo.salesInvoiceDetailsList[i].itemCode);
        Nameitemscolum.add(getinvoiceno!
            .data_GetInvoiceNo.salesInvoiceDetailsList[i].itemName1);

        QTYcolum.add(getinvoiceno!
            .data_GetInvoiceNo.salesInvoiceDetailsList[i].quantity);
        pricecolum.add(
            getinvoiceno!.data_GetInvoiceNo.salesInvoiceDetailsList[i].price);
        detailsTotalcolum.add(getinvoiceno!
            .data_GetInvoiceNo.salesInvoiceDetailsList[i].detailsTotal);
        invoiceTotal.add(getinvoiceno!.data_GetInvoiceNo.invoiceTotal);
        customerName1
            .add(getinvoiceno!.data_GetInvoiceNo.customerName1.toString());

        //invoiceTotal

        //detailsTotalcolum
      }
      // print('********List come from cubit*****************');
      // print(itemcodecolum.length);
      // print(itemcodecolum.toList());

      // listprod = items_model!.data_items;
      // print('1111111111111111111111111/---------------------------------');
      print(items_model?.status);
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      emit(Search_Error_search_states());
    });
  }

  TotalSalesReport? total_sales_report;
  List<dynamic> total_sales_report_list = [];
  void gettotalSalesReport(String qValue) {
    // emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGrouptotalSalesReportPostman?branchCode=${branchCode}&companyCode=${dbno}&customerCode=&salesPersonCode=001&dateFrom=2021-08-29&dateTo=2023-08-29',
    ).then((value) {
      total_sales_report = TotalSalesReport.fromJson(value.data);
      total_sales_report_list = total_sales_report!.data;
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  //http://178.128.146.68/getGroupingReportDataJoinGroupsalesItemsReportPostman?branchCode=001&itemCode=1000&warehouseCode=001&groupCode=&customerCode=&salesPersonCode=&dateFrom=2021-08-29&dateTo=2022-09-29&companyCode=D7PH
  SalesItemsReport? salesitemsreport;
  List<dynamic> salesitemsreport_list = [];
  void getsalesitemsreport(String qValue) {
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupsalesItemsReportPostman?branchCode=${branchCode}&itemCode=&warehouseCode=${warehouseCode}&groupCode=&customerCode=&salesPersonCode=&dateFrom=2021-08-29&dateTo=2023-09-29&companyCode=${dbno}',
    ).then((value) {
      salesitemsreport = SalesItemsReport.fromJson(value.data);
      salesitemsreport_list = salesitemsreport!.data;
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  CustomersTrnx? customers_trnx_rep;
  List<dynamic> customers_trnx_rep_list = [];
  void gettotalCustomersTrnxReport(String qValue) {
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupCustomersTrnxAllColumnsPostman?companyCode=${dbno}&branchCode=${branchCode}&dateFrom=2021-08-28&dateTo=2022-12-01&customerCode=${qValue}',
    ).then((value) {
      customers_trnx_rep = CustomersTrnx.fromJson(value.data);
      customers_trnx_rep_list = customers_trnx_rep!.data;
      emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  InventoryValue_rep? inventoryvalue_rep;
  List<dynamic> inventoryvalue_rep_list = [];
  void gettotalInventoryValue_rep(String qValue) {
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupcurrentInventoryValuePostman?branchCode=${branchCode}&itemCode=${qValue}&warehouseCode=${warehouseCode}&dateFrom=2021-08-29&dateTo=2023-09-29&companyCode=${dbno}',
    ).then((value) {
      inventoryvalue_rep = InventoryValue_rep.fromJson(value.data);
      inventoryvalue_rep_list = inventoryvalue_rep!.data;
      // emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  ItemsTrnx_rep? itemstrnx_rep;
  List<dynamic> itemstrnx_rep_list = [];
  void getItemsTrnx_rep_rep(String qValue) {
    // print('**********************');
    // print(qValue);
    // if (qValue.isEmpty) return;
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupItemsTrnxPostman?branchCode=${branchCode}&itemCode=${qValue}&warehouseCode=${warehouseCode}&dateFrom=2021-08-01&dateTo=2023-09-29&companyCode=${dbno}',
    ).then((value) {
      itemstrnx_rep = ItemsTrnx_rep.fromJson(value.data);
      itemstrnx_rep_list = itemstrnx_rep!.data;
      // emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  Pity_Cash_Report_Model? pity_cash_report_model;
  List<dynamic> getPity_Cash_Report_Model_rep_list = [];
  // void getPity_Cash_Report_Model_rep(String qValue) {
  void getPity_Cash_Report_Model_rep() {
    // print('**********************');
    // print(qValue);
    // if (qValue.isEmpty) return;
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'multiPaymentAndReceiptVoucherForEmployeePostman?companyCode=${dbno}&employeeCode=${salesPersonCode}',
      // 'http://178.128.146.68/multiPaymentAndReceiptVoucherForEmployeePostman?companyCode=D7PH&employeeCode=001',
    ).then((value) {
      pity_cash_report_model = Pity_Cash_Report_Model.fromJson(value.data);

      getPity_Cash_Report_Model_rep_list =
          pity_cash_report_model!.data_cash_report;
      // emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }

  Trial_Customer? trial_customer;
  List<dynamic> trial_customer_list = [];
  // void getPity_Cash_Report_Model_rep(String qValue) {
  void get_Trial_customer_rep() {
    emit(Search_Loading_search_states());
    DioHelper.getData(
      url:
          'getGroupingReportDataJoinGroupcustomersAndVendorBalancePostman?type=customer&code=&branchCode=${branchCode}&salesPersonCode=${salesPersonCode}&groupCode=&companyCode=${dbno}&dateFrom=2021-09-13&dateTo=2024-09-13',
    ).then((value) {
      trial_customer = Trial_Customer.fromJson(value.data);
      trial_customer_list = trial_customer!.data;
      // emit(Search_Success_search_states());
    }).catchError((error) {
      print(error.toString());
      // emit(Search_Error_search_states());
    });
  }
}
