import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/builder/cache_data.dart';
import 'core/widget/block_observer.dart';
import 'feature/fav/data/data.dart';
import 'feature/profile/model/profile_data.dart';
import 'my_app.dart';

void main() {
  FavData.getAllFav();
  ProfileData().getData();
  //put this line when using firebase
  WidgetsFlutterBinding.ensureInitialized();
  CacheShared.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}