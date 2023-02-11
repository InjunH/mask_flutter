import 'dart:developer';

import 'package:flutter/material.dart';

import '../../model/Store.dart';

class RemainStatListTile extends StatelessWidget {
  final Store store;

  const RemainStatListTile(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRemainStatWidget(store);
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '판매중지';
    var description = '판매중지';
    var color = Colors.black;
    if (store.remainStat == 'plenty') {
      remainStat = '충분';
      description = '100개 이상';
      color = Colors.green;
    }
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2 ~ 30개';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
      default:
    }
    print(store.km);
    return ListTile(
        onTap: () {
          // _launchUrl();
        },
        title: Text(store.name.toString()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(store.addr.toString()),
            Text('${store.km.toString()}km')
          ],
        ),
        trailing: Column(
          children: <Widget>[
            Text(
              remainStat,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(color: color),
            ),
          ],
        ));
  }

  // Future<void> _launchUrl() async {
  //   var url = 'https://pub.dev/packages/url_launcher';
  //   await launchUrl(Uri.parse(url));
  //   // if (!await launchUrl(Uri.parse(url))) {
  //   //   throw Exception('Could not launch $Uri.parse(url)');
  //   // }
  // }
}
