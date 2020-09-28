import 'package:flutter/material.dart';
import 'package:flutter_pruebavacant/models/UserInfo.dart';
import 'package:flutter_pruebavacant/services/ApiManager.dart';
import 'package:flutter_pruebavacant/utils/CustomCardShapePainter.dart';
import 'package:flutter_pruebavacant/utils/common_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;
  Future<UserModel> _usersModel;
  List<UserModel> _usersModelList;

  @override
  void initState() {
    _usersModel = APIManager().getUsers();
    _usersModelList = APIManager().getuserModelList();
    //_usersModelList = funcionFuturoToList(_usersModel);
    super.initState();
  }

  ///variables de prueba
  var items = [
    PlaceInfo('Esteban Moreno Castillo', Color(0xff6DC8F3), Color(0xff73A1F9),
        4.4, 'estebanmc2912@gmail.com', '(+57) 3167388801'),
    PlaceInfo('Paula Ximena Donoso Rincón', Color(0xffFFB157),
        Color(0xffFFA057), 3.7, 'Colombia  · Bogotá D.C.', '(+57) 3167388801'),
    PlaceInfo('Sofia Moreno Castillo', Color(0xffFF5B95), Color(0xffF8556D),
        4.5, 'España · Cataluña', '(+57) 3167388801'),
    PlaceInfo('Stella Castillo Rico', Color(0xffD76EF5), Color(0xff8F7AFE), 4.1,
        'Venezuela  · Maracaibo', '(+57) 3167388801'),
    PlaceInfo('Blanca Stella Castillo', Color(0xff42E695), Color(0xff3BB2B8),
        4.2, 'Ecuador · La Paz', '(+57) 316738802'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Container(
        child: FutureBuilder<UserModel>(
          future: _usersModel,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [
                                      items[index].startColor,
                                      items[index].endColor
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: items[index].endColor,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: CustomPaint(
                                size: Size(100, 150),
                                painter: CustomCardShapePainter(
                                    _borderRadius,
                                    items[index].startColor,
                                    items[index].endColor),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icon.png',
                                      height: 64,
                                      width: 64,
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ////Nombre
                                        Text(
                                          items[index].name,
                                          //snapshot.data.username,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Avenir',
                                              fontWeight: FontWeight.w700),
                                        ),

                                        ///COrreo electronico
                                        Text(
                                          items[index].location,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                          ),
                                        ),
                                        Text(
                                          items[index].correo,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Flexible(
                                              child: Text(
                                                items[index].location,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Avenir',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          items[index].rating.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        RatingBar(rating: items[index].rating),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String correo;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.correo);
}

List<UserModel> funcionFuturoToList(Future<UserModel> _usersModel) {
  _usersModel.then((value) => List<UserModel>());
}
