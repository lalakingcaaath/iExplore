import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeAIService {
  final String apiKey = 'AIzaSyBNit_I6C6T3mwzbQETGXYgJFjWXA3RZ1s';
  final String modelLatest = 'gemini-1.5-flash-lastest';
  final String modelPro = 'gemini-1.5-pro';
  late final GenerativeModel model;

  GenerativeAIService() {
    model = GenerativeModel(model: this.modelPro, apiKey: this.apiKey);
  }

  Future<void> promptCommand(String prompt, {bool isJson = false}) async {
    final GenerationConfig genConfig;

    if (!isJson) {
      genConfig = GenerationConfig(responseMimeType: 'application/json');
    } else {
      genConfig = GenerationConfig(responseMimeType: 'application/json');
    }

    try {
      final content = [Content.text(prompt)];
      final response =
          await model.generateContent(content, generationConfig: genConfig);
      String? responseText = response.text;
      print(responseText);
    } catch (e) {
      print(e);
    }
  }
}
