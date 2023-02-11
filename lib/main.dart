import 'package:flutter/material.dart';
import 'package:mask_flutter/view_model/store_model.dart';
import 'package:mask_flutter/ui/screen/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider.value(
    value: StoreModel(),
    child: const MyApp(),
  ));
}
