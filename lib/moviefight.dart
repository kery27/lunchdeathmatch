import 'dart:math';
import 'dart:io';


import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'menuview.dart';
import 'titleview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


import 'main.dart';

class MovieFightMain extends StatefulWidget {

  final moviekind;
  final List getmovielist;
  const MovieFightMain({Key key, this.moviekind, this.getmovielist}) : super(key: key);

  //double get _height => height;

  @override
  _MovieFightMainState createState() => _MovieFightMainState();

}

class _MovieFightMainState extends State<MovieFightMain> {

  static List movielist = [];
  static List<String> movielist2 = [];
  static List colorlist = [];


  //MovieFightMain.height;
  String movietitle1 = '';
  String movietitle2 = '';

  String movieindx1 = '';
  String movieindx2 = '';

  Color colorval1 = Colors.green[900] ;
  Color colorval2 = Colors.deepPurple;

  double _width  = 50;
  double _height1 ;
  double _height2 ;

  double fullheight = 0;
  double half_f_height = 0;

  Color  _color  = Colors.grey;

  int stagenumber = 0;
  int finalstage = 0;
  int stagelimit = 10;

  int foldtime = 500;
  int unfoldtime = 1000;

  final random_init = Random();

  bool first = true;

  bool enableTab = true;

  String last_str ='';



  String adid = 'ca-app-pub-3904256099942544~3347511713';//테스트
  //String adid = 'ca-app-pub-5577802402176197~9576163385';//진짜
  //

  //랜덤으로 문제내기
  //첫 화면 만들기
  //초기 값 세팅할때 랜덤으로 주기

  //결과값 따로 저장해두기

  //문제낼때 화면 정렬하기
  //제목의 영화 네이버 웹뷰로 연결?


  //화면이 생길떄? ok
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(getAppID());
    print('initState');
    var kind = widget.moviekind;
    print(kind);

    movielist = [];

    movielist =
    [{"id":"0", "name":"백반","url":"https://ssl.pstatic.net/imgmovie/mdi/mit110/0396/39640_P32_175320.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=39640"},
    {"id":"1", "name":"중화요리","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1501/150198_P60_142006.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=150198"},
    {"id":"2", "name":"순대국","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0635/63513_P23_163407.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=63513"},
    {"id":"3", "name":"라멘","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0326/32686_P47_105154.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=32686"},
    {"id":"4", "name":"돈까스","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0187/18781_P40_110031.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=18781"},
    {"id":"5", "name":"햄버거","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/1842/184208_P08_170257.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=184208"},
    {"id":"6", "name":"설렁탕","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0691/F9105-00.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=69105"},
    {"id":"7", "name":"부대찌개","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0650/F5021-00.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=65021"},
    {"id":"8", "name":"김밥","url" : "https://ssl.pstatic.net/imgmovie/mdi/mit110/0754/75470_P55_153307.jpg","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=75470"},
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

    colorlist = [Colors.red,Colors.orange,Colors.green[300],Colors.blue,Colors.deepOrange,
      Colors.pink,Colors.grey,Colors.brown,Colors.indigo,Colors.amber,Colors.red,Colors.orange,
      Colors.green[900],Colors.blue,Colors.deepOrange, Colors.pink,Colors.grey,Colors.brown,
      Colors.red,Colors.orange,Colors.pink,Colors.grey,Colors.brown,
      Colors.green[900],Colors.blue,Colors.deepOrange, Colors.pink,Colors.grey,Colors.brown];

    stagenumber = 0;
    finalstage = 0;

    stagelimit = widget.moviekind == 0 ? 10: 11;

    int rndnum = random_init.nextInt(movielist.length-1);


    movietitle1 = movielist[rndnum]['name'];
    movieindx1 = movielist[rndnum]['id'];
    movielist.removeAt(rndnum);
    rndnum = random_init.nextInt(movielist.length-1);
    movietitle2 = movielist[rndnum]['name'];
    movieindx2 = movielist[rndnum]['id'];
    movielist.removeAt(rndnum);

    //print(movielist);




  }

  //화면이 사라질때??? ok
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');

  }


  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    final orientation=mediaQuery.orientation;
    final double statusBarHeight = mediaQuery.padding.top;
    final double statusBarbottom = mediaQuery.padding.bottom;

    //print('status statusBarbottom $statusBarbottom');
    //print('status statusBarHeight $statusBarHeight');
    fullheight = mediaQuery.size.height - statusBarHeight - statusBarbottom;
    half_f_height = fullheight / 2;

    if (first){
      _height1 = half_f_height;
      _height2 = half_f_height;
      first = false;
    }

    //print('');
    //print('어디서');
    //int i = 1;
    return Scaffold(
        body: SafeArea(
          child: Container(
            //padding: const EdgeInsets.all(32),
            child: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  AnimatedContainer(
                    width: _width,
                    height: _height1,
                    decoration: BoxDecoration(
                      color:colorval1,
                      //borderRadius: BorderRadius.circular(random1.nextInt(100).toDouble())
                    ),
                    duration: Duration(milliseconds: foldtime),
                    curve: Curves.fastOutSlowIn,
                    child: widget.moviekind == 0 ?
                            Stack(
                              children: <Widget>[

                                SizedBox.expand(
                                  child: InkWell(
                                    child: Image.asset('assets/data/$movieindx1.jpg',fit: BoxFit.cover,),
                                    onTap: _nextStep1,

                                  ),
                                ),

                                Center(
                                  child: FlatButton(

                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          ),

                                          //borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Stack(children: <Widget>[

                                          Text(movietitle1,textAlign:TextAlign.center, style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 5
                                              ..color = Colors.black,)),

                                          Text(movietitle1,textAlign:TextAlign.center, style: TextStyle(
                                             fontSize: 50,
                                             fontWeight: FontWeight.bold,)),


                                        ],),
                                        padding: EdgeInsets.all(20.0),


                                      ),
                                      onPressed: _nextStep1),
                                ),
                                Container(
                                    height: 100,
                                    child: Row(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: <Widget>[
                                    //Icon(Icons.favorite),Text(' X 1')
                                  ],
                                )),
                              ],
                            ):
                            RaisedButton(
                                color: colorval1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: const Color(0xff7c94b6),
                                    //image: const DecorationImage(
                                    //image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                    //fit: BoxFit.cover,
                                    //),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),

                                    //borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(movietitle1,textAlign:TextAlign.center,style: TextStyle(fontSize: 40,),),
                                  padding: EdgeInsets.all(20.0),

                                ),
                                onPressed: _nextStep1),
                          ),
                  AnimatedContainer(
                    width: _width,
                    height: _height2,
                    decoration: BoxDecoration(
                      color:colorval2,
                      //borderRadius: BorderRadius.circular(random1.nextInt(100).toDouble())
                    ),
                    duration: Duration(milliseconds: foldtime),
                    curve: Curves.fastOutSlowIn,
                    child: widget.moviekind == 0 ?
                            Stack(
                              children: <Widget>[
                                SizedBox.expand(
                                  child: InkWell(
                                    child: Image.asset('assets/data/$movieindx2.jpg',fit: BoxFit.cover,),
                                    onTap: _nextStep2,

                                  ),
                                ),

                                Center(
                                  child: FlatButton(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Text(movietitle2,textAlign:TextAlign.center, style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 5
                                              ..color = Colors.black,)),
                                          Text(movietitle2,textAlign:TextAlign.center, style: TextStyle(
                                            fontSize: 50, fontWeight: FontWeight.bold,)),
                                        ],),
                                        padding: EdgeInsets.all(20.0),
                                      ),
                                      onPressed: _nextStep2),
                                ),
                                Container(
                                    height: 100,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                      ],
                                    )),
                              ],
                            ) :
                            RaisedButton(
                                color: colorval2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: const Color(0xff7c94b6),
                                    //image: const DecorationImage(
                                    //image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                    //fit: BoxFit.cover,
                                    //),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    //borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(movietitle2,textAlign:TextAlign.center,style: TextStyle(fontSize: 40),),
                                  padding: EdgeInsets.all(20.0),
                                ),
                                onPressed: _nextStep2),
                          ),
/*
                  Container(
                    //margin: EdgeInsets.only(top: 20.0),
                    child: AdmobBanner(
                        adUnitId: getBannerAdUnitId(),
                        adSize: AdmobBannerSize.FULL_BANNER,
                        listener: (AdmobAdEvent event, Map<String, dynamic> args){
                          //handleEvent(event,args,'Banner');
                        }
                    ),
                  ),
*/
                ],
              ),
              Container(padding:EdgeInsets.only(bottom: 80),
                  child: Center(
                      child: Text(last_str,textAlign:TextAlign.center,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),))),


            ],)
          ),
        )
    );
  }



  void resizeheight1() async {

    var future = Future.delayed(Duration(milliseconds: unfoldtime), (){

    });

    // await은 Future의 결과를 기다린다
    var rslt = await future;
    setResize1();

    var future1 = Future.delayed(Duration(milliseconds: foldtime), (){
      enableTab = true;

    });

    if (stagenumber == stagelimit){
      last_str = 'Last';
    }
  }

  void resizeheight2() async {


    var future = Future.delayed(Duration(milliseconds: unfoldtime), (){

    });

    // await은 Future의 결과를 기다린다
    var rslt = await future;

    setResize2();

    var future1 = Future.delayed(Duration(milliseconds: foldtime), (){
      enableTab = true;
    });

    if (stagenumber == stagelimit){
      last_str = 'Last';
    }
  }

  void setResize1(){
    setState(() {


      final random = Random();
      if (stagenumber == 0){
        finalstage = movielist.length-1;
      }
      int indx = 0;

      stagenumber++;

      if (movielist.length-1 == 0){
        indx = 0;
      }else{
        indx = random.nextInt(movielist.length-1 >= 0 ? movielist.length : 0);
      }

      String str = movielist[indx]['name'];
      movieindx2 = movielist[indx]['id'];
      movietitle2 = str;

      movielist.removeAt(indx);

      colorval2 = colorlist[stagenumber];

      //print(movielist);
      //print(indx);
      //print('final $finalstage');

      _height2 = half_f_height;
      _height1 = half_f_height;
    });

  }

  void setResize2(){
    setState(() {

      final random = Random();
      int indx = 0;

      if (stagenumber == 0){
        finalstage = movielist.length-1;
      }

      stagenumber++;

      if (movielist.length-1 == 0){
        indx = 0;
      }else{
        indx = random.nextInt(movielist.length-1 >= 0 ? movielist.length : 0);
      }

      String str = movielist[indx]['name'];

      movietitle1 = str;
      movieindx1 = movielist[indx]['id'];
      movielist.removeAt(indx);

      colorval1 = colorlist[stagenumber];

      _height2 = half_f_height;
      _height1 = half_f_height;


      //print(movielist);
      //print(indx);
      //print('final $finalstage');

    });

  }

  void _nextStep1(){
    setState(() {
      //print('enableTab $enableTab');
      //print('movieindx1 $movieindx1');
      if (!enableTab){
        return;
      }
      enableTab = false;
      if (stagenumber == stagelimit){
        _finished(movietitle1,movieindx1);

      }else{
        _height2 = 0;
        _height1 = fullheight;

        resizeheight1();
      }

    });

  }

  void _nextStep2(){
    setState(() {
      //print('enableTab $enableTab');
      //print('movieindx2 $movieindx2');
      if (!enableTab){
        return;
      }
      enableTab = false;
      if (stagenumber == stagelimit){
        _finished(movietitle2,movieindx2);

      }else{
        _height1 = 0;
        _height2 = fullheight;

        resizeheight2();
      }

    });
  }



  void _finished(String winner, String indx) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
          //print(context);
          //return FinishedPopup();

          //마지막 영화 인덱스 저
          _SavedData(indx);

          var kind = widget.moviekind;

          String rslt_kind ='';
          if (kind == 0){
            rslt_kind ='추천 점심메뉴는';
          }else{
            rslt_kind ='추천 메뉴는';
          }

          var safePadding = MediaQuery.of(context).padding.top;
          //print(safePadding);

          return Scaffold(body:
              Stack(
                children: <Widget>[
                  Container(
                    color: Colors.orange[600],
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //SizedBox(height: 100,),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('오늘 $rslt_kind ', style: TextStyle(fontSize: 30),),
                          ),

                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child:Stack(children: <Widget>[

                              Text('$winner',textAlign:TextAlign.center, style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 5
                                  ..color = Colors.black,)),

                              Text('$winner',textAlign: TextAlign.center, style: TextStyle(fontSize: 60,  fontWeight: FontWeight.bold),),
                            ],)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Material(
                                  color: Colors.orange[600],
                                  child: Center(

                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.pink,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        color: Colors.white,
                                        onPressed: ()=> Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return MovieFightMain(moviekind:0,getmovielist:movielist);
                                            })),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Material(
                                  color: Colors.orange[600],
                                  child: Center(
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.green,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.menu,),
                                        color: Colors.white,
                                        onPressed: ()=> Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return Menuview();
                                            })),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Material(
                                  color: Colors.orange[600],

                                  child: Center(
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.blue,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                          icon: Icon(Icons.info),
                                          color: Colors.white,
                                          onPressed: ()=> _endview()
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  ,
/*
                  SafeArea(
                    child:

                    Container(

                      //padding: EdgeInsets.only(top: 30.0),
                      child: AdmobBanner(
                          adUnitId: getBannerAdUnitId(),
                          adSize: AdmobBannerSize.FULL_BANNER,
                          listener: (AdmobAdEvent event, Map<String, dynamic> args){
                            //handleEvent(event,args,'Banner');
                          }
                      ),
                    ),

                  ),*/

                ],
              )
          );
        }));
  }

  void _endview() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('App Info'),),
            body:

          Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('점심 뭐먹죠', style: TextStyle(fontSize: 40),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
                    child: Text('메뉴선택장애 해결사', style: TextStyle(fontSize: 30),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 0, 8),
                    child: Text('App Version : 1.1.1', style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 5, 0, 5),
                    child: Text('이 App은 Flutter로 만들었습니다.', style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 5, 0, 5),
                    child: Text('만든이 : kery027@gmail.com ', style: TextStyle(fontSize: 20),),
                  ),
                  //SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 5, 0, 8),
                    child: Text('Helper : 두영 창규 정현 선영 일엽', style: TextStyle(fontSize: 14),),
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 100,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Material(
                          //color: Colors.white,
                          child: Center(
                            child: Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.pink,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,

                                onPressed: ()=>
                                    /*
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return MovieFightMain(moviekind:0,getmovielist:movielist);
                                    })),*/
                                 Navigator.of(context).pop()


                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          );
        }));
  }


  String buildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return 'release';
    }
    var result = 'profile';
    assert(() {
      result = 'debug';
      return true;
    }());
    return result;
  }

  String getAppID() {

    var mode = buildMode();
    //print(mode);

    if (mode == 'debug'){
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544~1458002511';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544~3347511713';
      }
    }else{
      if (Platform.isIOS) {
        return 'ca-app-pub-5577802402176197~6341126385';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-5577802402176197~1134205191';
      }
    }
  }

  String getBannerAdUnitId() {

    var mode = buildMode();
    print(mode);

    if (mode == 'debug'){
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
    }else{
      if (Platform.isIOS) {
        return 'ca-app-pub-5577802402176197/3714963049';//진짜
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-5577802402176197/8821123521';//진짜
      }
    }
  }


  _SavedData(indx) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {

      var kind = widget.moviekind;
      //print('kind $kind');
      if (kind == 0){

        prefs.setString('resultmovielife', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmovielife'));

      }else if (kind == 1){

        prefs.setString('resultmovieromance', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmovieromance'));

      }else if (kind == 2){
        prefs.setString('resultmovieaction', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmovieaction'));
      }else if (kind == 3){
        prefs.remove('resultmoviehorror');
        prefs.setString('resultmoviehorror', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmoviehorror'));
      }else if (kind == 4){
        prefs.remove('resultmoviedrama');
        prefs.setString('resultmoviedrama', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmoviedrama'));
      }else if (kind == 5){
        prefs.setString('resultmovieanimation', indx);
        print('result ' );
        print('결과'+prefs.getString('resultmovieanimation'));
      }else{

      }
    });
  }


}
