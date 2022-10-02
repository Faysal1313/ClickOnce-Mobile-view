import 'package:clickonce/modules/login/cubit_login/state.dart';
import 'package:clickonce/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/login_modelc.dart';
import '../../../shared/network/remote/dio_helper.dart';

class CubitL extends Cubit<Login_States> {
  CubitL() : super(Login_InitialState());
  static CubitL get(context) => BlocProvider.of(context);
  ClickLoginModel? loginModelm;
  void login(
      {required String userdb,
      required String email,
      required String password}) async {
    await DioHelper.getData(
            url:
                'http://178.128.146.68/mainUsersLoginPostman?companyCode=${userdb}&email=${email}&password=${password}')
        // 'http://178.128.146.68/mainUsersLoginPostman?companyCode=D7PH&email=admin@test.com&password=123')
        .then((value) {
      loginModelm = ClickLoginModel.fromJson(value.data);
      dbno = userdb;
      token = loginModelm!.data.token.toString();
      companyName = loginModelm!.data.companyName.toString();
      email = loginModelm!.data.email.toString();
      id = loginModelm!.data.id.toString();
      lineNo = loginModelm!.data.lineNo.toString();
      name_user = loginModelm!.data.name.toString();
      phone = loginModelm!.data.phone.toString();
      branchId = loginModelm!.data.branchId.toString();
      branchName1 = loginModelm!.data.branchName1.toString();
      salesInvoiceBookCode = loginModelm!.data.salesInvoiceBookCode.toString();
      salesInvoiceBookId = loginModelm!.data.salesInvoiceBookId.toString();
      salesInvoiceTypeCode = loginModelm!.data.salesInvoiceTypeCode.toString();
      salesInvoiceTypeId = loginModelm!.data.salesInvoiceTypeId.toString();
      warehouseId = loginModelm!.data.warehouseId.toString();
      warehouseCode = loginModelm!.data.warehouseCode.toString();
      typeCode_receipt = loginModelm!.data.receiptTypeCode.toString();
      typeID__receipt = loginModelm!.data.receiptTypeId.toString();
      typesourceID__receipt = loginModelm!.data.receiptSourceId.toString();
      bookID_receipt = loginModelm!.data.receiptBookId.toString();
      typeCode_payment = loginModelm!.data.paymentTypeCode.toString();
      typeID__payment = loginModelm!.data.paymentTypeId.toString();
      typesourceID__payment = loginModelm!.data.paymentSourceId.toString();
      bookID_payment = loginModelm!.data.paymentBookId.toString();
      id_user = loginModelm!.data.id.toString();
      currencyId = loginModelm!.data.currencyId;
      stockIssueBookId_ = loginModelm!.data.stockIssueBookId.toString();
      stockIssueTypeId_ = loginModelm!.data.stockIssueTypeId.toString();
      salesPersonId = loginModelm!.data.employeeId;
      customerGroupId = loginModelm!.data.customerGroupId.toString();
      customerAccountId = loginModelm!.data.customerAccountId.toString();
      branchCode = loginModelm!.data.branchCode.toString();
      name_user = loginModelm!.data.name.toString();
      salesPersonName = loginModelm!.data.employeeName1.toString();
      salesPersonCode = loginModelm!.data.employeeCode.toString();
      branchOther1Id = loginModelm!.data.branchOther1Id.toString();

      if (loginModelm!.data.changeMobileDiscount == 'true') {
        changeMobileDiscount_ = true;
      } else {
        changeMobileDiscount_ = false;
      }
      if (loginModelm!.data.changeMobilePrice == 'true') {
        changeMobilePrice_ = true;
      } else {
        changeMobilePrice_ = false;
      }
      if (loginModelm!.data.searchWithQtyMobile == 'true') {
        searchWithQtyMobile_ = true;
      } else {
        searchWithQtyMobile_ = false;
      }
      if (loginModelm!.data.withoutTaxesMobile == 'true') {
        withoutTaxesMobile_ = true;
      } else {
        withoutTaxesMobile_ = false;
      }

//       bool searchWithQtyMobile_=false;
// String searchWithQtyMobile_str='false';
// bool withoutTaxesMobile_=false;
// String withoutTaxesMobile_str='false';

      // print('******************LOGINPASS*******************');
      // print(salesPersonId);
      // print(loginModelm!.data.employeeId);

      // print('******************END*******************');
      // cError_login = '******************LOGINPASS*******************';
      emit(Login_SuccessState(loginModelm!));
    }).catchError((error) {
      print(error.toString());
      cError_login = error.toString();
      emit(LoginErrorState(error.toString()));
    });
  }
}
