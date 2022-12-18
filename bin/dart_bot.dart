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
  teledart.onCommand('start').listen((message) {
    helloMessage(teledart, message);
    pickSubject(teledart, message);
  });
  callbackHandler(teledart);
}

void callbackHandler(TeleDart teledart) async {
  teledart.onCallbackQuery().listen((event) async {
    if (event.data != 'back') {
      if (subjectsList.contains(event.data)) {
        try {
          await teledart.deleteMessage(event.message?.chat.id, event.message!.message_id);
        } catch (e) {}
        await teledart.sendMessage(
            event.message?.chat.id, 'Выбранный предмет: ${subjects[event.data].toString().toLowerCase()}',
            reply_markup: getMarkup(event.data!));
      } else {
        try {
          await teledart.deleteMessage(event.message?.chat.id, event.message!.message_id);
        } catch (e) {}
        await teledart.sendDocument(event.message?.chat.id, files[event.data]);
        pickSubject(teledart, event.teledartMessage!);
      }
    } else if (event.data == 'back') {
      try {
        await teledart.deleteMessage(event.message?.chat.id, event.message!.message_id);
      } catch (e) {}
      pickSubject(teledart, event.teledartMessage!);
    }
  });
}

void helloMessage(TeleDart teledart, TeleDartMessage message) async {
  await teledart.sendMessage(message.chat.id, 'Вас приветствует бот Mospolyschool');
}

void pickSubject(TeleDart teledart, TeleDartMessage message) async {
  final List<List<InlineKeyboardButton>> subjects = [
    [InlineKeyboardButton(text: 'Русский Язык', callback_data: 'rus')],
    [InlineKeyboardButton(text: 'Математика', callback_data: 'math')],
    [InlineKeyboardButton(text: 'Обществознание', callback_data: 'social')],
    [InlineKeyboardButton(text: 'Информатика', callback_data: 'inf')],
    [InlineKeyboardButton(text: 'Английский язык', callback_data: 'english')]
  ];

  await teledart.sendMessage(message.chat.id, 'Выберите предмет',
      reply_markup: InlineKeyboardMarkup(inline_keyboard: subjects));
}

InlineKeyboardMarkup getMarkup(id) {
  final List<List<InlineKeyboardButton>> rusTopics = [
    [InlineKeyboardButton(text: 'Н и НН', callback_data: 'rus_1')],
    [InlineKeyboardButton(text: 'Не и Ни', callback_data: 'rus_2')],
    [InlineKeyboardButton(text: 'Правописание корней', callback_data: 'rus_3')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> mathTopics = [
    [InlineKeyboardButton(text: 'Логарифмические уравнения', callback_data: 'math_1')],
    [InlineKeyboardButton(text: 'Тригонометрические уравнения', callback_data: 'math_2')],
    [InlineKeyboardButton(text: 'Экономические задачи', callback_data: 'math_3')],
    [InlineKeyboardButton(text: 'Тригонометрия', callback_data: 'math_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> infTopics = [
    [InlineKeyboardButton(text: 'Графы', callback_data: 'inf_1')],
    [InlineKeyboardButton(text: 'Информационные модели', callback_data: 'inf_2')],
    [InlineKeyboardButton(text: 'Информационный объем сообщения', callback_data: 'inf_3')],
    [InlineKeyboardButton(text: 'Кодирование информации', callback_data: 'inf_4')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> socialTopics = [
    [InlineKeyboardButton(text: 'Человек и общество 1', callback_data: 'social_1')],
    [InlineKeyboardButton(text: 'Человек и общество 2', callback_data: 'social_2')],
    [InlineKeyboardButton(text: 'Человек и общество 3', callback_data: 'social_3')],
    [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
  ];

  final List<List<InlineKeyboardButton>> englishTopics = [
    [InlineKeyboardButton(text: 'Времена', callback_data: 'english_1')],
    [InlineKeyboardButton(text: 'Грамматика и лексика', callback_data: 'english_2')],
    [InlineKeyboardButton(text: 'Словообразование', callback_data: 'english_3')],
    [InlineKeyboardButton(text: 'Фразовые глаголы', callback_data: 'english_4')],
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

    case 'english':
      return InlineKeyboardMarkup(inline_keyboard: englishTopics);
    default:
      return InlineKeyboardMarkup(inline_keyboard: [
        [InlineKeyboardButton(text: 'Назад', callback_data: 'back')]
      ]);
  }
}
