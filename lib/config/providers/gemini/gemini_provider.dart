import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<void> conGemini() async {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: 'apiKey');

  const prompt = 'Write a story about a magic backpack.';
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  if (kDebugMode) {
    print(response.text);
  }
}
