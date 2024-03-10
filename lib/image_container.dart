import 'package:flutter/material.dart';
import 'package:second_app/text_container.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 60),
        const TextContainer(),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 15)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('start quiz'),
        )
      ],
    );
  }
}
