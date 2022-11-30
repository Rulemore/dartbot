// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class Document {
  File? file;
  String title;
  String topic;
  Document({
    this.file,
    required this.title,
    required this.topic,
  });
}

class DataBase {
  List<Document> documents = [];
  DataBase({
    required this.documents,
  });
  List<Document> getTopicDocs(String topic) {
    List<Document> tmpdocuments = [];
    for (int i = 0; i < this.documents.length; i++) {
      if (this.documents[i].topic == topic) {
        tmpdocuments.add(this.documents[i]);
      }
    }
    return tmpdocuments;
  }
}
