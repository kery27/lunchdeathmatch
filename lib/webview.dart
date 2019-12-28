import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatelessWidget {

  String url;
  String title;

  //MyWebview({Key key, this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('url $url');
    return Scaffold(
      appBar: AppBar(title: Text('이미지 출처'),),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('이미지 출처 리스트 '),

            ),
            ListTile(
              title: Text('[저작자] 백반 by Hyerimwon, Wikimedia'),
              subtitle: Text('[이미지출처] https://commons.wikimedia.org/wiki/File:%EA%B0%80%EC%A0%95%EC%8B%9D%EB%B0%B1%EB%B0%98.jpg#file '),
            ),
            ListTile(
              title: Text('[저작자] 김치찌개 by Miyagawa, Wikimedia'),
              subtitle: Text('[이미지출처] https://www.flickr.com/photos/bulknews/464355661/'),
            ),
            ListTile(
              title: Text('[저작자] 순두부찌개 by titanium22, flickr'),
              subtitle: Text('[이미지출처] https://www.flickr.com/photos/nagarazoku/122555103/ '),
            ),

          ],
        ),
      )
    );
  }
}
