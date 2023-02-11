import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mask_flutter/repository/location_repository.dart';
import 'package:mask_flutter/repository/store_repository.dart';

import '../model/Store.dart';

class StoreModel with ChangeNotifier {
  bool isLoading = true;
  List<Store> storeList = [];
  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    print('call fetch');
    isLoading = true;
    notifyListeners();
    Position? position = await _locationRepository.getCurrentLocator();
    storeList = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}
