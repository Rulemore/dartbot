import 'package:dart_bot/models.dart';
import 'dart:io';

Map<String, String> subjects = {
  'rus': 'Русский Язык',
  'math': 'Математика',
  'social': 'Обществознание',
  'inf': 'Информатика'
};

DataBase dataBase = DataBase(
  documents: [
    Document(
        title: 'Правописание корней', topic: 'rus', file: File('/home/rulemore/dart_bot/lib/data/russian/ex9.pptx')),
  ],
);
