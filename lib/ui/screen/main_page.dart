import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/store_model.dart';
import '../widget/remain_stat_list_tile.dart';
// import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 확인 : ${storeModel.storeList.length}곳'),
        actions: [
          IconButton(
              onPressed: () {
                storeModel.fetch();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: storeModel.isLoading ? loadingWidget() : _buildBody(storeModel),
    );
  }

  Widget _buildBody(StoreModel storeModel) {
    if (storeModel.storeList.isEmpty) {
      return Container(child: const Text('반경 5km 내에 매장이 없습니다'));
    }

    return Center(
      child: ListView(
        children: storeModel.storeList.map((e) {
          return RemainStatListTile(e);
        }).toList(),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('데이터 가져오는 중'),
          SizedBox(height: 24),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
