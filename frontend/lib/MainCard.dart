import 'package:flutter/material.dart';
import 'package:mero/DetailsScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> classes = List.generate(
    15,
        (index) => {
          'index': index,
      'title': 'Мастер-класс $index',
      'time': '00:00 - 01:00',
      'spots': '10 свободных мест',
          'register': false,
    },
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb252525),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final classInfo = classes[index];
            return Hero(
              tag: 'card_$index',
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        reverseTransitionDuration:
                        const Duration(milliseconds: 350),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailsScreen(
                            classInfo: classInfo,
                            heroTag: 'card_$index',
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          );
                          return FadeTransition(
                            opacity: curvedAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff252525),
                        border: Border.all(
                          color: Color(0xff00CE00),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Card(
                      color: const Color(0xff252525),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              classInfo['title']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              classInfo['time']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              classInfo['spots']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}