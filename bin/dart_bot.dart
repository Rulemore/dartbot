import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';
import 'models.dart';
import 'data.dart';

const String telegramApiToken = '5982537010:AAFr0udYAAD9G1Sjv_VMe2mK7-UHAdTHKoo';

void main() async {
  final telegram = Telegram(telegramApiToken);
  final event = Event((await telegram.getMe()).username!);
  final teledart = TeleDart(telegramApiToken, event);
  teledart.start();
  var query = teledart.onInlineQuery();
  chooseSubject(teledart);
  inliner(query);
}

void chooseSubject(TeleDart teledart) {
  teledart.onCommand('start').listen((event) {
    final List<List<InlineKeyboardButton>> subjects = [
      [
        InlineKeyboardButton(text: 'Русский Язык', callback_data: 'rus'),
        InlineKeyboardButton(text: 'Математика', callback_data: 'math'),
      ],
      [
        InlineKeyboardButton(text: 'Обществознание', callback_data: 'social'),
        InlineKeyboardButton(text: 'Информатика', callback_data: 'inf'),
      ]
    ];

    final markup = InlineKeyboardMarkup(inline_keyboard: subjects);

    teledart.sendMessage(event.chat.id, 'Выберите предмет', reply_markup: markup);
  });
}

Future<void> inliner(dynamic query) async {
  query.
}
