import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../model/Store.dart';

class StoreRepository {
  final Distance distance = new Distance();
  /*
    async 비동기
    async - await
      비동기로 실행하는 함수다 
      반드시 future 사용해야 한다.

   */
  Future<List<Store>> fetch() async {
    List<Store> storesList = [];
    double lat = 37.6862598;
    double lng = 127.0538723;
    print('lat : ${lat}\nlng : ${lng}');
    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';

    var response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);

        final jsonStores = jsonResult['stores'];

        for (var store in jsonStores) {
          // print(store);
          // km = 423
          final km = distance.as(LengthUnit.Kilometer,
              LatLng(store['lat'], store['lng']), LatLng(lat, lng));
          store['km'] = km;
          storesList.add(Store.fromJson(store));
        }
        print("fetch 완료");

        return storesList.where((e) => e.remainStat != 'break').toList()
          ..sort(((a, b) => a.km!.compareTo(b.km!)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
