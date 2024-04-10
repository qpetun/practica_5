import 'dart:io' show Platform; // Импорт библиотеки для определения платформы
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Импорт библиотеки для веб-платформы

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кроссплатформенное приложение',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Функция для определения цвета фона в зависимости от платформы
  Color getBackgroundColor(BuildContext context) {
    if (kIsWeb) {
      return Colors.yellow;
    } else if (Platform.isWindows) {
      return Colors.blueGrey;
    } else {
      return Colors.green;
    }
  }

  // Функция для получения описания платформы
  String getPlatformDescription() {
    if (kIsWeb) {
      return 'Веб: Платформа для создания веб-приложений.';
    } else if (Platform.isWindows) {
      return 'Windows: Широко используемая операционная система для персональных компьютеров.';
    } else {
      return 'Android: Мобильная операционная система, разработанная Google.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String platformText;
    if (kIsWeb) {
      platformText = 'Веб';
    } else if (Platform.isWindows) {
      platformText = 'Windows';
    } else {
      platformText = 'Android';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: getBackgroundColor(context), // Установка цвета фона заголовка
        title: Text(
          'Кроссплатформенное приложение',
          style: TextStyle(
            color: Colors.white, // Установка цвета текста заголовка
          ),
        ),
      ),
      body: Container(
        color: getBackgroundColor(context), // Установка цвета фона контейнера
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Платформа: $platformText',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white, // Установка цвета текста
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  getPlatformDescription(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Установка цвета текста
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}