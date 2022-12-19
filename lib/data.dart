import 'dart:io';

Map<String, String> subjects = {
  'rus': 'Русский Язык',
  'math': 'Математика',
  'social': 'Обществознание',
  'inf': 'Информатика',
  'english': 'Английский язык',
};

List<String> subjectsList = ['rus', 'inf', 'social', 'math', 'english'];

Map<String, File> files = {
  'rus_1': File('./lib/data/russian/Н и НН.pptx'),
  'rus_2': File('./lib/data/russian/Не и Ни.pptx'),
  'rus_3': File('./lib/data/russian/Правописание корней.pptx'),
  //
  'math_1': File('./lib/data/math/Методы решения логарифмических уравнений.pptx'),
  'math_2': File('./lib/data/math/Методы решения тригонометрических уравнений.pptx'),
  'math_3': File('./lib/data/math/Решение экономических задач.pptx'),
  'math_4': File('./lib/data/math/Тригонометрия.pptx'),
  //
  'inf_1': File('./lib/data/informatics/Графы.pptx'),
  'inf_2': File('./lib/data/informatics/Информационные модели.pptx'),
  'inf_3': File('./lib/data/informatics/Информационный объем сообщения.pptx'),
  'inf_4': File('./lib/data/informatics/Кодирование и декодирование информации.pptx'),
  'inf_5': File('./lib/data/informatics/Таблицы истинности.pptx'),
  //
  'social_1': File('./lib/data/social/Человек и общество 1.pptx'),
  'social_2': File('./lib/data/social/Человек и общество 2.pptx'),
  'social_3': File('./lib/data/social/Человек и общество 3.pptx'),
  //
  'english_1': File('./lib/data/english/Времена.pptx'),
  'english_2': File('./lib/data/english/Грамматика и лексика.pptx'),
  'english_3': File('./lib/data/english/Словообразование.pptx'),
  'english_4': File('./lib/data/english/Фразовые глаголы.pptx'),
};
