import 'package:flutter/material.dart';
import 'dart:convert';

import 'moviefight.dart';
import 'webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Menuview extends StatefulWidget {

  @override
  _MenuviewState createState() => _MenuviewState();
}

class _MenuviewState extends State<Menuview> with SingleTickerProviderStateMixin {

  static List<String> gamelist = [];
  static List<Color> colorlist = [];
  static List<String> resultlist = [];

  List<dynamic> userresult = [];

  AnimationController anicontroller ;

  List urllist = [];
  List linkurllist = [];

  List movielist = [];
  List romancelist =[];

  List actionlist =[];

  List dramalist =[];

  List horrorlist =[];

  List anilist =[];

  List urllist2 =[];

  List lunchmenu =[];


  _SavedData() async {
    // Get shared preference instance
    var future = Future.delayed(Duration(milliseconds: 1000), (){

    });
    await future;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Set value
      String result = json.encode(userresult);
      prefs.setString('resultjson', result);
      //print('result ' );
      //print('결과'+prefs.getString('resultjson'));
    });
  }

  _loaddData() async {
    // Get shared preference instance

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //prefs.setString('resultjson', '');
      //return;
      // Set value
      String str = prefs.getString('resultjson');
      //print('str $str');
      if (str == '' || str == []){
        str = '[{"test":"1","name":"kimchi"}]';
      }
      List resultjson = json.decode(str);

      userresult = resultjson;
      print('가져오기');
      print(userresult);
      print(userresult[0]['name']);
      print(json.decode(str));
    });

  }

  String _findmovieinfo(key,value,List lst) {



    for (int i = 0; i < lst.length; i++){
      if (value == lst[i][key]){
        return lst[i]['name'];
      }
    }
  }

  String _findmovieurl(String key,value,List lst) {

    for (int i = 0; i < lst.length; i++){
      if (value == lst[i][key]){
        return lst[i]['url'];
      }
    }

  }

  String _findmovielink(String key,value,List lst) {
    print('dttdtdtd111');
    for (int i = 0; i < lst.length; i++){
      if (value == lst[i]['id']){
        print('dttdtdtd');
        return lst[i]['link'];
      }
    }
  }

  _initMovielist() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String str = prefs.getString('resultmovielife');
    //print('print');
    //print('str $str');


    //todo 지금은 영화의 인덱스만 로컬에 저장햄 그러나
    // 영화의 이미지 정보나 링크 정보가 로컬에 저장되어 있을 필요가 있지
    // 이걸 하려면 영화 정보나 링크 정보가 제이슨으로 저장이 되어 이써야지
    // 영화 정보랑 제이슨 정보를 저장 해놓는 로컬 변수를 만들고
    // 거기서 영화 정보를 불러다가

    // 값이 존재 하지 않으면 api를 태워서 값을 가져오고

    // 가져온 값을 저장하는 로직을 넣어야 하는데
    // 대문에서 해야하나 싶네.
    // 영화는 게임이 끝났을때 결정이 되자나.
    // 일단 만들고 어디서 할지를 정하자


    setState(() {
      //Todo 환경설정 값을 가져와서 값이 있는 (플레이 결과가 있는) 리스트에 차례로 넣어주기.
      //print('이닛이 시작되엇냐?');

      if(str != '' && str != null){
        String movie_name = _findmovieinfo('id',str,movielist);
        if (movie_name != ''){
          //값 세팅
          resultlist[0] = movie_name;
          urllist[0]['url'] = _findmovieurl('id',str,movielist);
          urllist[0]['link'] = _findmovielink('link',str,movielist) ;
          if(urllist[0]['link'] == '' || urllist[0]['link'] == null){
            //var rtn = getmovieinfo(urllist[0]);
            //urllist[0]['link'] =

            //print(urllist[0]);
          }
        }
      }

      str = prefs.getString('resultmovieromance');
      if(str != ''&& str != null){
        String movie_name = _findmovieinfo('id',str,romancelist);
        if (movie_name != ''){
          //값 세팅
          resultlist[1] = movie_name;
          //print(_findmovieurl('id',str,romancelist));
          urllist[1]['url'] = _findmovieurl('id',str,romancelist);
          urllist[1]['link'] = _findmovielink('link',str,romancelist) ;
          if(urllist[1]['link'] == '' || urllist[1]['link'] == null){
            //var rtn = getmovieinfo(urllist[1]);
            //urllist[0]['link'] =
            //print(urllist[1]);
          }
        }
      }

      str = prefs.getString('resultmovieaction');
      if(str != ''&& str != null){
        String movie_name = _findmovieinfo('id',str,actionlist);
        if (movie_name != ''){
          //값 세팅
          resultlist[2] = movie_name;
          urllist[2]['url'] = _findmovieurl('id',str,actionlist);
          urllist[2]['link'] = _findmovielink('link',str,actionlist) ;
        }
      }

      str = prefs.getString('resultmoviehorror');
      //print('horror $str');
      if(str != ''&& str != null){
        String movie_name = _findmovieinfo('id',str,horrorlist);
        if (movie_name != ''){
          //값 세팅
          resultlist[3] = movie_name;
        //  print('dddddd '+_findmovieurl('id',str,horrorlist));
          urllist[3]['url'] = _findmovieurl('id',str,horrorlist);
          urllist[3]['link'] = _findmovielink('link',str,horrorlist) ;

        //  print('dddddd '+urllist[3]['url']);
        }
      }

      str = prefs.getString('resultmoviedrama');
      if(str != ''&& str != null){
        String movie_name = _findmovieinfo('id',str,dramalist);
        if (movie_name != ''){
          //값 세팅
          resultlist[4] = movie_name;
          urllist[4]['url'] = _findmovieurl('id',str,dramalist);
          urllist[4]['link'] = _findmovielink('link',str,dramalist) ;
        }
      }

      str = prefs.getString('resultmovieanimation');
      if(str != ''&& str != null){
        String movie_name = _findmovieinfo('id',str,anilist);
        if (movie_name != ''){
          //값 세팅
          resultlist[5] = movie_name;
          urllist[5]['url'] = _findmovieurl('id',str,anilist);
          urllist[5]['link'] = _findmovielink('link',str,anilist) ;
        }
      }
    });
  }


  @override
  void initState(){
    super.initState();
    //getJSONData();

    //_loaddData();
    //_SavedData();


    gamelist = ['인 생 영 화','Romance','Action','Horror','Drama','Animation'];
    colorlist = [Color.fromRGBO(233, 243, 158,1),
                 Color.fromRGBO(244, 209, 250,1),
                 Color.fromRGBO(255, 244, 122,1),
                 Color.fromRGBO(242, 152, 135,1),
                 Colors.green[700],Colors.yellow[700]];
    colorlist = [Colors.red[700],
                Color.fromRGBO(244, 209, 250,1),
                Colors.blue[700],
                Colors.purple[400],
                Colors.green[500],Colors.yellow[700]];
    //resultlist = ['레옹','노트북','포드페라리','그랜드부다페스트호텔','?','?'];

    urllist = [
    ];

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

    resultlist = ['','','','','',''];
    //getmovie(movielist);
    //_initMovielist();

  }

  //화면이 사라질때??? ok
  @override
  void dispose() {
    // TODO: implement dispose

    resultlist = [];
    urllist =[];

    super.dispose();
    print('dispose');

  }


  @override
  Widget build(BuildContext context) {

    print('scafolld called');
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),


      body: Container(
        color: Colors.grey[900],
        child: GridView.builder(
          itemCount: movielist.length-1,
          itemBuilder: (context, index) {

            //String url = urllist[index]['url'] == null ? '' : urllist[index]['url'];
            int moviekind = index;
            //print('$index  url  ' );

            List sendlist = movielist;

            //print('sendlist start');
            //print(sendlist);
            //print('sendlist end');
            //print('url $url');
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[900],
                  width: 1,
                ),

                borderRadius: BorderRadius.circular(10),
              ),

              child: Card(
                //shape: ,
                elevation: 3,
                color: Colors.black,
                child:Stack(
                  children: <Widget>[

                    SizedBox.expand(
                      child: InkWell(
                          onTap:(){

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return MyWebview();
                                }));
                            //_showDialogyn(moviekind,sendlist);
                          },
                          child:Image.asset('assets/data/$index.jpg',fit: BoxFit.cover,)

                      ),
                    ),
                    Center(
                      child: Text(movielist[index]['name'], style:
                      TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 5
                          ..color = Colors.black,)),
                    ),
                    Center(child: Text(movielist[index]['name'],style:
                    TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),))
                  ],
                ),

                /*
                Column(
                  children: <Widget>[


                    /*
                    Container(
                      color: Colors.grey[800],
                      child: ListTile(
                        title: Text(movielist[index]['name'], textAlign:TextAlign.center,style: TextStyle(fontSize: 20,),),
                        subtitle: Text('맛잇냐', textAlign:TextAlign.center, style: TextStyle(fontSize: 15,),),
                      ),
                    ),*/
                  ],
                ),
                */

              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //childAspectRatio: .58,
            //childAspectRatio: .57,
          ),
        ),
      ),
    );
  }


  // user defined function
  void _showDialogyn(moviekind,sendlist) {

    if (resultlist[moviekind] == null || resultlist[moviekind] ==''){
      //todo 처음 하면 바로 보내고 아니면 팝업으로 물어보기
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return MovieFightMain(moviekind:moviekind,getmovielist:sendlist);
          }));
    }else{
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("재미있었나요?"),
            content: new Text("다시 하시겠습니까?"),
            backgroundColor:Colors.deepPurple,
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("다시하기"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return MovieFightMain(moviekind:moviekind,getmovielist:sendlist);
                      }));
                },
              ),
              new FlatButton(
                child: new Text("영화정보확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        //return MyWebview(url:urllist[moviekind]['link'],title:resultlist[moviekind]);
                        return MyWebview();
                      }));
                },
              ),
            ],
          );
        },
      );
    }

  }


  void getmovie(List movielist){

    for(int i = 0; i < movielist.length ; i++){
      getmovieinfo(movielist[i]);
      //print(movielist[i]);
    }
  }


  //todo 로딩 끝나면 화면에 유알엘 적용해줘
  //todo 어떤 사이트로 보내야할지도 알려줘

  void getmovieinfo(Map<String,String> movieinfo) async{
    print("Request failed with status: ");

    String strings = movieinfo['name'];
    print("Request $strings");

    var encoded_query = Uri.encodeFull(strings);
    //String query = '%EC%A3%BC%EC%8B%9D';

    //print(decoded);
    //print(strings);

    var year =     (movieinfo['year']== null || movieinfo['year'] == '') ? '' : movieinfo['year'];
    var start =    (movieinfo['start']== null || movieinfo['start'] == '') ? '' : movieinfo['start'];
    var country =  (movieinfo['country']== null || movieinfo['country'] == '') ? '' : movieinfo['country'];
    var display =  (movieinfo['display']== null || movieinfo['display'] == '') ? '' : movieinfo['display'];

    var yearfrom = (movieinfo['yearfrom']== null || movieinfo['yearfrom'] == '') ? '' : movieinfo['yearfrom'];
    var yearto =   (movieinfo['yearto']== null || movieinfo['yearto'] == '') ? '' : movieinfo['yearto'];

    var finalurl = "https://openapi.naver.com/v1/search/movie.json?query=$encoded_query";

    if (start !='')    finalurl +"&start=$start";
    if (display !='')  finalurl +"&display=$display";
    if (country !='')  finalurl +"&country=$country";
    if (yearfrom !='' && yearto !='') finalurl +"&yearfrom=$yearfrom&yearto=$yearto";

    var headers = {"X-Naver-Client-Id": "1c58Nt7nhF38L6BnuiAS", "X-Naver-Client-Secret": "Es9Zr4cOUA" };

    //print("final url: $finalurl");

    // country = 'US';
    //String strings = "저수지의";

    //decodeUtf8(utf8.encode(strings));
    //var encoded_query2 = utf8.encode(strings);
    //var decoded = utf8.decode(encoded_query2);
    //var url = "https://openapi.naver.com/v1/search/movie.json?query=$encoded_query&display=10&start=1&country=US&yearfrom=1990&yearto=2019";

    var response = await http.get(finalurl,headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //var movie_title = jsonResponse['items'].forEach( (x) => x['title']);
      var movie_title = jsonResponse['items'][0]['title'];
      var movie_link = jsonResponse['items'][0]['link'];
      var movie_img_url = jsonResponse['items'][0]['image'];

      //print(movie_title.replaceAll(new RegExp('/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi'),''));

      //int endindx = movie_title.toString().indexOf('</b>');

      //print("Number of books about http: $jsonResponse.");
      //print("movie_title: $movie_title");
      //print('movie_link: ,"link": "$movie_link"');
      //print("movie_img_url: $movie_img_url");

      Map<String,String> mapvar ={'link':movie_link,'image':movie_img_url};
      movieinfo.addAll(mapvar);

    } else {
      //print("Request failed with status: ${response.statusCode}.");
      Map<String,String> mapvar ={'link':'','image':''};
      movieinfo.addAll(mapvar);
    }
  }

}


