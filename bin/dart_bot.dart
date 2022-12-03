import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';
import 'package:dart_bot/models.dart';
import 'package:dart_bot/data.dart';

const String telegramApiToken = '5982537010:AAFr0udYAAD9G1Sjv_VMe2mK7-UHAdTHKoo';

void main() async {
  final telegram = Telegram(telegramApiToken);
  final event = Event((await telegram.getMe()).username!);
  final teledart = TeleDart(telegramApiToken, event);

  teledart.start();
  chooseSubject(teledart);
  update(teledart);
}

void chooseSubject(TeleDart teledart) {
  teledart.onCommand('start').listen((event) {
    startMessage(teledart, event);
  });
}

void startMessage(TeleDart teledart, TeleDartMessage event) {
  final List<List<InlineKeyboardButton>> subjects = [
    [
      InlineKeyboardButton(
        text: 'Русский Язык',
        callback_data: 'rus',
      ),
      InlineKeyboardButton(text: 'Математика', callback_data: 'math'),
    ],
    [
      InlineKeyboardButton(text: 'Обществознание', callback_data: 'social'),
      InlineKeyboardButton(text: 'Информатика', callback_data: 'inf'),
    ]
  ];

  final markup = InlineKeyboardMarkup(inline_keyboard: subjects);

  teledart.sendMessage(event.chat.id, 'Выберите предмет', reply_markup: markup);
}

void update(TeleDart teledart) async {
  teledart.onCallbackQuery().listen((event) {
    if (event.data != 'back') {
      final subject = subjects[event.data];
      event.answer(text: subject.toString());
      subject.toString().toLowerCase();
      event.teledartMessage?.reply('Выбранный предмет $subject', reply_markup: getMarkup(event.data!));
    } else {
      startMessage(teledart, event.teledartMessage!);
    }
  });
}

InlineKeyboardMarkup getMarkup(String id) {
  List<List<InlineKeyboardButton>> listButtons = [
    [
      InlineKeyboardButton(text: 'Назад', callback_data: 'back'),
    ]
  ];

  return InlineKeyboardMarkup(inline_keyboard: listButtons);
}
