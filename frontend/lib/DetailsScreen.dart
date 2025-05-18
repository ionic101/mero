import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mero/Icons.dart';

List<Map<String, dynamic>> masterClasses = [];

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> classInfo;
  final String heroTag;

  const DetailsScreen({
    super.key,
    required this.classInfo,
    required this.heroTag,
  });


  @override
  DetailsScreenState createState() =>
      DetailsScreenState(classInfo: classInfo, heroTag: heroTag);
}

class DetailsScreenState extends State<DetailsScreen> {
  final Map<String, dynamic> classInfo;
  final String heroTag;

  DetailsScreenState({
    required this.classInfo,
    required this.heroTag,
  });

  Padding _ButtonStyle(Map<String, dynamic> classInfo) {
    if (classInfo["register"] == true) {
      return Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xff00CE00),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                onPressed: () => setState(() {
                      classInfo["register"] != classInfo["register"];
                      print("STATE");
                    }),
                child: Text(
                  "Отменить запись",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff00CE00),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
              onPressed: () => setState(() {
                    classInfo["register"] != classInfo["register"];
                    print("STATE");
                  }),
              child: Text(
                "Записаться",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: Material(
            color: Colors.transparent,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff252525),
                    border: Border.all(
                      color: Color(0xff00CE00),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxHeight),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        const BackButton(
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Детали мастер-класса',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                'Время: ${classInfo['time']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                'Свободно мест: ${classInfo['spots']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 25),
                              child: const Text(
                                'Здесь можно разместить подробное описание мастер-класса, расписание, контакты и другую информацию.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: classInfo["register"] == true ? Color(0xff252525) : Color(0xff00CE00),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color:Color(0xff00CE00),width: 2.0)
                                  ),
                                  child: TextButton(
                                      onPressed: () => setState(() {
                                            classInfo["register"] =
                                                !classInfo["register"];
                                            if(classInfo["register"] == true){
                                              masterClasses.add(classInfo);
                                              classInfo["index"] = masterClasses.length -1;
                                            }
                                            if(classInfo["register"] == false){
                                              masterClasses.removeAt(classInfo["index"]);
                                            }
                                            print("STATE");
                                          }),
                                      child: Text(
                                        classInfo["register"] == true ? "Отписаться" : "Записаться",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: quastionImage,
            label: '',
          ),
          BottomNavigationBarItem(icon: mapImage, label: ''),
          BottomNavigationBarItem(icon: mainPageSelectedImage, label: ''),
          BottomNavigationBarItem(icon: chatImage, label: ''),
          BottomNavigationBarItem(icon: userImage, label: ''),
        ],
      ),
    );
  }
}
