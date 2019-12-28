import 'package:flutter/material.dart';
import 'menuview.dart';
import 'moviefight.dart';
import 'webview.dart';


class MainGateView extends StatefulWidget {
  @override
  _MainGateViewState createState() => _MainGateViewState();
}

class _MainGateViewState extends State<MainGateView> with SingleTickerProviderStateMixin {

  AnimationController anicontroller ;

  List lunchmenu =[];
  @override
  void initState(){
    super.initState();
    anicontroller = AnimationController( vsync:this, duration: Duration(milliseconds: 2500));
    anicontroller.forward();
    //anicontroller.reverse();

    lunchmenu =
    [{"id":"0", "name":"백반","url":"https://ssl.pstatic.net/imgmovie/mdi/mit110/0396/39640_P32_175320.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=39640"},
      {"id":"1", "name":"중화요리","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1501/150198_P60_142006.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=150198"},
      {"id":"2", "name":"순대국","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0635/63513_P23_163407.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=63513"},
      {"id":"3", "name":"라멘","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0326/32686_P47_105154.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=32686"},
      {"id":"4", "name":"돈까스","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0187/18781_P40_110031.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=18781"},
      {"id":"5", "name":"햄버거","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1842/184208_P08_170257.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=184208"},
      {"id":"6", "name":"설렁탕","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0691/F9105-00.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=69105"},
      {"id":"7", "name":"부대찌개","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0650/F5021-00.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=65021"},
      {"id":"8", "name":"김밥떡볶이순대","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0754/75470_P55_153307.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=75470"},
      {"id":"9", "name":"초밥","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1019/101966_P09_114632.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=101966"},
      {"id":"10","name":"해장국","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1009/100931_P98_151621.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=100931"},
      {"id":"11","name":"도시락","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1156/115622_P24_095702.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=115622"},
      {"id":"12","name":"닭갈비","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"13","name":"쌀국수","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"14","name":"피자","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"15","name":"삼계탕","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"16","name":"김치찌개","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"17","name":"낙지덮밥","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"18","name":"제육볶음","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"19","name":"샌드위치","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"20","name":"콩나물국밥","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"21","name":"순두부찌개","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"22","name":"비빔밥","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"23","name":"참치회","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"24","name":"죽","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"25","name":"냉면","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"26","name":"떡볶이","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"27","name":"샤브샤브","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"28","name":"칼국수","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
      {"id":"29","name":"다이어트","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1517/151728_P21_103229.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=151728"},
    ];
  }


  //화면이 사라질때??? ok
  @override
  void dispose() {
    // TODO: implement dispose
    anicontroller.dispose();
    super.dispose();

    print('dispose');

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.orange[600],
        child: (
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[SizedBox(height: 100,),
              Stack(children: <Widget>[
                Center(
                    child: Text('점심 뭐먹지',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        )
                    )
                ),
                Center(
                    child: Text('점심 뭐먹지',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,

                        )
                    )
                ),


              ],),
                SizedBox(height: 20,),
                Stack(children: <Widget>[
                  Center(
                      child: Text('메뉴 선택이 어려울때 필요한 어플',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,))
                  ),
                  Center(
                      child: Text('메뉴 선택이 어려울때 필요한 어플',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,

                  ),))
                ],),
                //SizedBox(height: 50,),

                Container(

                  width: 200,
                  height: 200,
                  color: Colors.orange[600],
                  child: Material(
                    color: Colors.orange[600],
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.red,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          iconSize: 50,
                          icon: AnimatedIcon(

                              progress: anicontroller,
                              icon:AnimatedIcons.pause_play),

                          color: Colors.white,
                          onPressed: ()=> Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                //return Menuview();
                                return MovieFightMain(moviekind:0,getmovielist:lunchmenu);

                              })),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.orange[600],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    AnimatedIcon(
                      icon: AnimatedIcons.home_menu,
                      progress: anicontroller,
                    ),
                    Text(' Big Johnson Garcia',)
                  ],)
                ),
/*
                Container(
                    padding: EdgeInsets.all(20.0),
                    width: 250,
                    child: Image.asset('assets/data/naver.png',scale: 0.2,))
                    */

                
            ],
        )),
      ),
    );
  }
}


