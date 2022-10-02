// http://178.128.146.68/getGroupingReportDataJoinGroupcustomersAndVendorBalancePostman?type=customer&code=&branchCode=&salesPersonCode=&groupCode=&companyCode=D7PH&dateFrom=2021-09-13&dateTo=2022-09-13
class Trial_Customer {
  Trial_Customer({
    required this.data,
  });
  late final List<Data> data;

  Trial_Customer.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  late final String CBCredit;
  late final String CBDebit;
  late final String Credit;
  late final String Debit;
  late final String OBCredit;
  late final String OBDebit;
  late final String name;

  Data.fromJson(Map<String, dynamic> json) {
    CBCredit = json['C.B Credit'];
    CBDebit = json['C.B Debit'];
    Credit = json['Credit'];
    Debit = json['Debit'];
    OBCredit = json['O.B Credit'];
    OBDebit = json['O.B Debit'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C.B Credit'] = CBCredit;
    _data['C.B Debit'] = CBDebit;
    _data['Credit'] = Credit;
    _data['Debit'] = Debit;
    _data['O.B Credit'] = OBCredit;
    _data['O.B Debit'] = OBDebit;
    _data['name'] = name;
    return _data;
  }
}
