import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';
import 'package:dart_bot/data.dart';

const String telegramApiToken = '5982537010:AAFr0udYAAD9G1Sjv_VMe2mK7-UHAdTHKoo';

void main() async {
  final telegram = Telegram(telegramApiToken);
  final event = Event((await telegram.getMe()).username!);
  final teledart = TeleDart(telegramApiToken, event);

  teledart.start();
  chooseSubject(teledart);
}

void chooseSubject(TeleDart teledart) async {
  teledart.onCommand('start').listen((message) {
    startMessage(teledart, message);

    teledart.onCallbackQuery().listen((event) async {
      if (event.data != 'back') {
        if (subjectsList.contains(event.data)) {
          await teledart.editMessageText(
            'Выбранный предмет: ${subjects[event.data].toString().toLowerCase()}',
            message_id: event.message?.message_id,
            chat_id: event.message?.chat.id,
            reply_markup: getMarkup(event.data!),
          );
        } else {
          await teledart.deleteMessage(event.message?.chat.id, event.message!.message_id);
          await teledart.sendDocument(event.message?.chat.id, files[event.data]);
          startMessage(teledart, message);
        }
      } else {
        await teledart.deleteMessage(event.message?.chat.id, event.message!.message_id);
        startMessage(teledart, event.teledartMessage!);
      }
    });
  });
}

void startMessage(TeleDart teledart, TeleDartMessage message) {
  final List<List<InlineKeyboardButton>> subjects = [
    [
      InlineKeyboardButton(text: 'Русский Язык', callback_data: 'rus'),
      InlineKeyboardButton(text: 'Математика', callback_data: 'math')
    ],
    [
      InlineKeyboardButton(text: 'Обществознание', callback_data: 'social'),
      InlineKeyboardButton(text: 'Информатика', callback_data: 'inf')
    ]
  ];

  final markup = InlineKeyboardMarkup(inline_keyboard: subjects);

  teledart.sendMessage(message.chat.id, 'Выберите предмет', reply_markup: markup);
}

InlineKeyboardMarkup getMarkup(id) {
  final List<List<InlineKeyboardButton>> rusTopics = [
    [InlineKeyboardButton(text: 'Тема 1', callback_data: 'rus_1')],
    [InlineKeyboardButton(text: 'Тема 2', callback_data: 'rus_2')],
    [InlineKeyboardButton(text: 'Тема 3', callback_data: 'rus_3')],
    [InlineKeyboardButton(text: 'Тема 4', callback_data: 'rus_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> mathTopics = [
    [InlineKeyboardButton(text: 'Тема 1', callback_data: 'math_1')],
    [InlineKeyboardButton(text: 'Тема 2', callback_data: 'math_2')],
    [InlineKeyboardButton(text: 'Тема 3', callback_data: 'math_3')],
    [InlineKeyboardButton(text: 'Тема 4', callback_data: 'math_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> infTopics = [
    [InlineKeyboardButton(text: 'Тема 1', callback_data: 'inf_1')],
    [InlineKeyboardButton(text: 'Тема 2', callback_data: 'inf_2')],
    [InlineKeyboardButton(text: 'Тема 3', callback_data: 'inf_3')],
    [InlineKeyboardButton(text: 'Тема 4', callback_data: 'inf_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> socialTopics = [
    [InlineKeyboardButton(text: 'Тема 1', callback_data: 'social_1')],
    [InlineKeyboardButton(text: 'Тема 2', callback_data: 'social_2')],
    [InlineKeyboardButton(text: 'Тема 3', callback_data: 'social_3')],
    [InlineKeyboardButton(text: 'Тема 4', callback_data: 'social_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  switch (id) {
    case 'rus':
      return InlineKeyboardMarkup(inline_keyboard: rusTopics);

    case 'inf':
      return InlineKeyboardMarkup(inline_keyboard: infTopics);

    case 'math':
      return InlineKeyboardMarkup(inline_keyboard: mathTopics);

    case 'social':
      return InlineKeyboardMarkup(inline_keyboard: socialTopics);

    default:
      return InlineKeyboardMarkup(inline_keyboard: [
        [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
      ]);
  }
}
