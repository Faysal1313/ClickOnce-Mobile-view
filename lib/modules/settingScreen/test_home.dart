// ignore_for_file: camel_case_types

import 'package:clickonce/shared/components/component.dart';
import 'package:flutter/material.dart';

import '../../shared/network/remote/end_point.dart';

class test_home extends StatelessWidget {
  const test_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('branchId: ${branchId}'),
            Text('branchName1: ${branchName1}'),
            Text('salesInvoiceBookId: ${salesInvoiceBookId}'),
            Text('salesInvoiceTypeCode:${salesInvoiceTypeCode}'),
            Text('salesInvoiceTypeId:${salesInvoiceTypeId}'),
            Text('warehouseId: ${warehouseId}'),
            Text('warehouseCode: ${warehouseCode}'),
            Text('branchCode: ${branchCode}'),
            Text('user: ${name_user}'),
            Text('salesPersonName: ${salesPersonName}'),
            Text('salesPersonCode: ${salesPersonCode}'),
            Text('typeID__receipt:${typeID__receipt}'),
            Text('typeCode_receipt:${typeCode_receipt}'),
            Text('typesourceID__receipt:${typesourceID__receipt}'),
            Text('bookID_receipt:${bookID_receipt}'),
            Text('typeID__payment:${typeID__payment}'),
            Text('typeCode_payment:${typeCode_payment}'),
            Text('typesourceID__payment:${typesourceID__payment}'),
            Text('bookID_payment:${bookID_payment}'),
            Text('id_user:${id_user}'),
            Text('currencyId:${currencyId}'),
            Text('changeMobileDiscount:${changeMobileDiscount_}'),
            Text('changeMobilePrice_:${changeMobilePrice_}'),
            Text('searchWithQtyMobile_:${searchWithQtyMobile_}'),
            Text('withoutTaxesMobile_:${withoutTaxesMobile_}'),
            Text('salesPersonId:${salesPersonId}'),
            Text('stockIssueBookId:${stockIssueBookId_}'),
            Text('stockIssueTypeId :${stockIssueTypeId_}'),
            Text('customerAccountId :${customerAccountId}'),
            Text('customerGroupId :${customerGroupId}'),
            Text('branchOther1Id :${branchOther1Id}'),
            SizedBox(
              height: 20,
            ),
            line(400),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(txtrecevcashjson),
            SizedBox(
              height: 20,
            ),
            line(400),
            SizedBox(
              height: 20,
            ),
            Text(txtinvoicejson),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
