import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Mero"),)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.grey, // Здесь можно вставить QR-код
              ),
            ),
            SizedBox(height: 20),
            Text("Имя: Иван"),
            Text("Фамилия: Иванов"),
            Text("Отчество: Иванович"),
            Text("Год рождения: 01.01.2000"),
            Text("Команда: AIM APP"),
            SizedBox(height: 20),
            Text("Запись", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 120, // Высота горизонтального списка
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Количество элементов
                itemBuilder: (context, index) {
                  return _buildHorizontalItem("Мастер-класс ${index + 1}", "00:00 - 01:00");
                },
              ),
            ),
            SizedBox(height: 20),
            Text("Очередь", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildMasterClassItem("Название мастер-класса", "00:00 - 01:00"),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalItem(String title, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 150, // Ширина каждого элемента
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center),
            Text(time, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildMasterClassItem(String title, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(time),
          ],
        ),
      ),
    );
  }
}
