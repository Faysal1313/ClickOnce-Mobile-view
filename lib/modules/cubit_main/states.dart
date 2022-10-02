// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:clickonce/models/invoice_respond.dart';
import 'package:clickonce/models/receiptvoucher.dart';

import '../../models/CycleInsertSalesInvoiceSto.dart';
import '../../models/customer_respond.dart';
// ignore: unused_import
import '../../models/items_model.dart';
import '../../models/stockissuevoucher.dart';

abstract class Main_states {}

class Main_Initial_states extends Main_states {}

class Main_Bottum_Nav_states extends Main_states {}

class Main_Loading_HomeData_states extends Main_states {}

class Main_Success_HomeData_states extends Main_states {}

class Main_Error_HomeData_states extends Main_states {}

//items
class Main_Loading_Items_states extends Main_states {}

class Main_Success_Items_states extends Main_states {
  // final Items_Model zz;
  Main_Success_Items_states();
}

class Main_Error_Items_states extends Main_states {}

class Main_Items_states extends Main_states {}

//---------------------------------------------
//items
class Main_Loading_Items_statesx extends Main_states {}

class Main_Success_Items_statesx extends Main_states {}

class Main_Error_Items_statesx extends Main_states {}

class Main_Items_statesx extends Main_states {}

//================
//Customer
class Main_Loading_Customer_states extends Main_states {}

class Main_Success_Customer_states extends Main_states {}

class Main_Error_Customer_states extends Main_states {}

class Main_Customer_states extends Main_states {}

//================

//=============Invoice=========
// ignore: camel_case_types
class Invoice_InitialState extends Main_states {}

// ignore: camel_case_types
class Invoice_LodingState extends Main_states {}

// ignore: camel_case_types
class Invoice_SuccessState extends Main_states {
//  final ShopLoginModel loginModel;
  // ignore: non_constant_identifier_names
  final Invoice_Respond invoice_respond;
  Invoice_SuccessState(this.invoice_respond);
}

class InvoiceErrorState extends Main_states {
  final String error;
  InvoiceErrorState(this.error);
}

//==================
//=============StockIssueVoucher=========
// ignore: camel_case_types
class StockIssueVoucher_InitialState extends Main_states {}

// ignore: camel_case_types
class StockIssueVoucher_LodingState extends Main_states {}

// ignore: camel_case_types
class StockIssueVoucher_SuccessState extends Main_states {
//  final ShopLoginModel loginModel;
  // ignore: non_constant_identifier_names
  final StockIssueVoucher_Respond stock_issue_voucher_respond;
  StockIssueVoucher_SuccessState(this.stock_issue_voucher_respond);
}

class IStockIssueVoucherErrorState extends Main_states {
  final String error;
  IStockIssueVoucherErrorState(this.error);
}

//==================
//=============StockIssueVoucher=========
// ignore: camel_case_types
class CycleInsertSalesInvoiceStockIssuePostman_InitialState
    extends Main_states {}

// ignore: camel_case_types
class CycleInsertSalesInvoiceStockIssuePostman_LodingState extends Main_states {
}

// ignore: camel_case_types
class CycleInsertSalesInvoiceStockIssuePostman_SuccessState
    extends Main_states {
//  final ShopLoginModel loginModel;
  // ignore: non_constant_identifier_names
  final CycleInsertSalesInvoiceStockIssuePostman
      cycleInsertsalesinvoiceStockissue;
  CycleInsertSalesInvoiceStockIssuePostman_SuccessState(
      this.cycleInsertsalesinvoiceStockissue);
}

class CycleInsertSalesInvoiceStockIssuePostmanErrorState extends Main_states {
  final String error;
  CycleInsertSalesInvoiceStockIssuePostmanErrorState(this.error);
}

//==================
//=============ReceiptVoucher=========
// ignore: camel_case_types
class ReceiptVoucher_InitialState extends Main_states {}

// ignore: camel_case_types
class ReceiptVoucher_LodingState extends Main_states {}

// ignore: camel_case_types
class ReceiptVoucher_SuccessState extends Main_states {
  final ReceiptVoucher receiptvoucher;
  ReceiptVoucher_SuccessState(this.receiptvoucher);
}

class ReceiptVoucherErrorState extends Main_states {
  final String error;
  ReceiptVoucherErrorState(this.error);
}

//==================
//=============Add Customer=========
// ignore: camel_case_types
class Customer_respond_InitialState extends Main_states {}

// ignore: camel_case_types
class Customer_respond_LodingState extends Main_states {}

// ignore: camel_case_types
class Customer_respond_SuccessState extends Main_states {
  final Customer_respond customerrespond;
  Customer_respond_SuccessState(this.customerrespond);
}

// ignore: camel_case_types
class Customer_respondErrorState extends Main_states {
  final String error;
  Customer_respondErrorState(this.error);
}

//==================
//=============validation Customer=========
// ignore: camel_case_types
class Validation_customer_InitialState extends Main_states {}

// ignore: camel_case_types
class Validation_customer_LodingState extends Main_states {}

// ignore: camel_case_types
class Validation_customer_SuccessState extends Main_states {
//  final ShopLoginModel loginModel;
  // ignore: non_constant_identifier_names
  // final CustomersCheckName customers_checkName;
  Validation_customer_SuccessState();
}

class Validation_customerErrorState extends Main_states {
  final String error;
  Validation_customerErrorState(this.error);
}

//==================