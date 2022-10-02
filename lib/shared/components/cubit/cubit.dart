import 'package:clickonce/shared/components/cubit/states.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      //   print('***********************************');
      //  print(fromShared.toString());
      isDark = fromShared;
      // emit(ChangeAppModeState());
    } else {
      fromShared = false;

      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        // emit(ChangeAppModeState());
      });
    }
  }
}
