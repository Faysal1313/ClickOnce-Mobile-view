class CustomerModel {
  late final List<Datacustomer> datacustomer;
  late final String status;

  CustomerModel.fromJson(Map<String, dynamic> json) {
    datacustomer =
        List.from(json['data']).map((e) => Datacustomer.fromJson(e)).toList();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = datacustomer.map((e) => e.toJson()).toList();
    data['status'] = status;
    return data;
  }
}

class Datacustomer {
  late final List<Branchescustomer> branchescustomer;
  late final String code;
  late final String id;
  late final String name1;
  late final String name2;

  Datacustomer.fromJson(Map<String, dynamic> json) {
    branchescustomer = List.from(json['branches'])
        .map((e) => Branchescustomer.fromJson(e))
        .toList();
    code = json['code'];
    id = json['id'];
    name1 = json['name1'];
    name2 = json['name2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['branches'] = branchescustomer.map((e) => e.toJson()).toList();
    data['code'] = code;
    data['id'] = id;
    data['name1'] = name1;
    data['name2'] = name2;
    return data;
  }
}

class Branchescustomer {
  late final String code;
  late final String id;
  late final String name1;
  late final String name2;

  Branchescustomer.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name1 = json['name1'];
    name2 = json['name2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['id'] = id;
    data['name1'] = name1;
    data['name2'] = name2;
    return data;
  }
}

// class CustomerModel {
//   CustomerModel({
//     required this.result,
//   });
//   late final List<Result> result;

//   CustomerModel.fromJson(Map<String, dynamic> json) {
//     result = List.from(json['data']).map((e) => Result.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = result.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Result {
//   Result({
//     required this.branches,
//     required this.code,
//     required this.id,
//     required this.name1,
//     required this.name2,
//   });
//   late final List<Branches> branches;
//   late final String code;
//   late final String id;
//   late final String name1;
//   late final String name2;

//   Result.fromJson(Map<String, dynamic> json) {
//     branches =
//         List.from(json['branches']).map((e) => Branches.fromJson(e)).toList();
//     code = json['code'];
//     id = json['id'];
//     name1 = json['name1'];
//     name2 = json['name2'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['branches'] = branches.map((e) => e.toJson()).toList();
//     _data['code'] = code;
//     _data['id'] = id;
//     _data['name1'] = name1;
//     _data['name2'] = name2;
//     return _data;
//   }
// }

// class Branches {
//   Branches({
//     required this.code,
//     required this.id,
//     required this.name1,
//     required this.name2,
//   });
//   late final String code;
//   late final String id;
//   late final String name1;
//   late final String name2;

//   Branches.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     id = json['id'];
//     name1 = json['name1'];
//     name2 = json['name2'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['code'] = code;
//     _data['id'] = id;
//     _data['name1'] = name1;
//     _data['name2'] = name2;
//     return _data;
//   }
// }
