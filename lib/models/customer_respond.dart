// ignore: camel_case_types
class Customer_respond {
  Customer_respond({
    required this.id,
    required this.status,
  });
  late final String id;
  late final String status;

  Customer_respond.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['status'] = status;
    return _data;
  }
}
