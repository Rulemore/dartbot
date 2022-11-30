import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';
import 'dart:io' as io;
// var file = File();

const String telegramApiToken = '5982537010:AAFr0udYAAD9G1Sjv_VMe2mK7-UHAdTHKoo';

void main() async {
  final telegram = Telegram(telegramApiToken);
  final event = Event((await telegram.getMe()).username!);
  final teledart = TeleDart(telegram, event);
  teledart.start();

  chooseSubject(teledart);
  chooseThemeRussian(teledart);
  chooseThemeMath(teledart);
  chooseThemeInformatics(teledart);
  chooseThemeSocial(teledart);
  botPopMenu(teledart);
}

void chooseSubject(TeleDart teledart) {
  teledart.onCommand('start').listen((message) {
    final List<List<KeyboardButton>> subjetcts = [
      [
        KeyboardButton(text: 'Русский Язык'),
        KeyboardButton(text: 'Математика'),
      ],
      [
        KeyboardButton(text: 'Обществознание'),
        KeyboardButton(text: 'Информатика'),
      ]
    ];

    final markup = ReplyKeyboardMarkup(
      keyboard: subjetcts,
    );

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите предмет',
      reply_markup: markup,
    );
  });
}

void botPopMenu(TeleDart teledart) {
  teledart.onMessage(keyword: 'Назад').listen((message) {
    final List<List<KeyboardButton>> subjetcts = [
      [
        KeyboardButton(text: 'Русский Язык'),
        KeyboardButton(text: 'Математика'),
      ],
      [
        KeyboardButton(text: 'Обществознание'),
        KeyboardButton(text: 'Информатика'),
      ]
    ];

    final markup = ReplyKeyboardMarkup(
      keyboard: subjetcts,
    );

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите предмет',
      reply_markup: markup,
    );
  });
}

void chooseThemeRussian(TeleDart teledart) {
  teledart.onMessage(keyword: 'Русский Язык').listen((message) {
    final List<List<KeyboardButton>> russianThemesButtons = [
      [
        KeyboardButton(text: 'Правописание корней'),
        KeyboardButton(text: 'Тема 2'),
      ],
      [
        KeyboardButton(text: 'Тема 3'),
        KeyboardButton(text: 'Тема 4'),
      ],
      [KeyboardButton(text: 'Назад')]
    ];

    final markup = ReplyKeyboardMarkup(keyboard: russianThemesButtons);

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите тему',
      reply_markup: markup,
    );
  });

  teledart.onMessage(keyword: 'Правописание корней').listen((event) {
    teledart.replyDocument(event, io.File('/home/rulemore/dart_bot/lib/data/russian/ex9.pptx'));
  });
}

void chooseThemeMath(TeleDart teledart) {
  teledart.onMessage(keyword: 'Математика').listen((message) {
    final List<List<KeyboardButton>> russianThemesButtons = [
      [
        KeyboardButton(text: 'Тема 1'),
        KeyboardButton(text: 'Тема 2'),
      ],
      [
        KeyboardButton(text: 'Тема 3'),
        KeyboardButton(text: 'Тема 4'),
      ],
      [KeyboardButton(text: 'Назад')]
    ];

    final markup = ReplyKeyboardMarkup(keyboard: russianThemesButtons);

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите тему',
      reply_markup: markup,
    );
  });
}

void chooseThemeSocial(TeleDart teledart) {
  teledart.onMessage(keyword: 'Обществознание').listen((message) {
    final List<List<KeyboardButton>> russianThemesButtons = [
      [
        KeyboardButton(text: 'Тема 1'),
        KeyboardButton(text: 'Тема 2'),
      ],
      [
        KeyboardButton(text: 'Тема 3'),
        KeyboardButton(text: 'Тема 4'),
      ],
      [KeyboardButton(text: 'Назад')]
    ];

    final markup = ReplyKeyboardMarkup(keyboard: russianThemesButtons);

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите тему',
      reply_markup: markup,
    );
  });
}

void chooseThemeInformatics(TeleDart teledart) {
  teledart.onMessage(keyword: 'Информатика').listen((message) {
    final List<List<KeyboardButton>> russianThemesButtons = [
      [
        KeyboardButton(text: 'Тема 1'),
        KeyboardButton(text: 'Тема 2'),
      ],
      [
        KeyboardButton(text: 'Тема 3'),
        KeyboardButton(text: 'Тема 4'),
      ],
      [KeyboardButton(text: 'Назад')]
    ];

    final markup = ReplyKeyboardMarkup(keyboard: russianThemesButtons);

    teledart.telegram.sendMessage(
      message.chat.id,
      'Выберите тему',
      reply_markup: markup,
    );
  });
}
