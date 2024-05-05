import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<void> conGemini() async {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: 'apiKey');

  const prompt = 'Write a story about a magic backpack.';
  final content = [Content.text(prompt)];
  final response = await generateContentResponse(model, content);
  if (kDebugMode) {
    print(response.text);
  }
}

final gmiaProvider = FutureProvider<GenerativeModel>((ref) async {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: 'apiKey');
  final content = [Content.text('text')];
  final response = await generateContentResponse(model, content);
  if (kDebugMode) {
    print(response.text);
  }
  return model;
});

Future<GenerateContentResponse> generateContentResponse(
        GenerativeModel model, List<Content> content) async =>
    await model.generateContent(content);
