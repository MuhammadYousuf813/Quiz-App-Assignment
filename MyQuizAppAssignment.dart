import 'dart:math';
import 'dart:io';


void main() {
  QuizApp quizApp = QuizApp();
  quizApp.startQuiz();
}

class QuizApp {
  Map<String, Map<String, String>> questionsMap = {
    '1': {
      'question': 'Qno: 1 Which Pakistani city is given the title of “city of colleges”?',
      'choices': 'A. Quetta, B. Okara, C. Faisalabad, D. Lahore',
      'answer': 'D',
    },
    '2': {
      'question': 'Qno: 2 How Many Major Cities Of Pakistan?',
      'choices': 'A. 3, B. 5, C. 7, D. 9',
      'answer': 'C',
    },
    '3': {
      'question': 'Qno: 3 Qno: 3 Which Pakistani city is given the title of “City of Greeneries”?',
      'choices': 'A. Islamabad, B. Swat Valley, C. Peshawar, D. Lahore',
      'answer': 'A',
    },
    '4': {
      'question': 'Qno: 4 Qno: 4 Which Pakistani city is given the title of “City of Textiles”?',
      'choices': 'A. Peshawar, B. Faisalabad, C. Lahore, D. Karachi',
      'answer': 'B',
      },
      '5': {
        'question': 'Qno: 5 Qno: 5 Which of the following country is given the title of “Land of the Pure',
        'choices': 'A. Saudi Arabia, B. Turkey, C. Pakistan, D. Afghanistan',
        'answer': 'C',
        },
        '6': {
          'question': 'Qno: 6 Which Pakistani mountain is given the title of “Killer Mountain of the world”?',
          'choices': 'A. Nanga Parbat, B. K2, C. Broad Peak, D. Kanchenjunga',
        'answer': 'A',
        },
        '7': {
        	'question': 'Qno: 7 Which Pakistani city is given the title of “Manchester of Pakistan”?',
        'choices': 'A. Karachi, B. Quetta, C. Faisalabad, D. Lahore',
        'answer': 'C',
        },
        '8': {
        	'question': 'Qno: 8 Which Pakistani city is given the title of “Gateway of Invaders”?',
        'choices': 'A. Peshawar Pass, B. Khunjerab Pass, C. Bolan Pass, D. Khyber Pass',
        'answer': 'D',
        },
        '9': {
        	'question': 'Qno: 9 Which Pakistani state is known as the “land of five rivers”?',
        'choices': 'A. KPK, B. Sindh, C. Baluchistan, D. Punjab',
        'answer': 'D',
        },
        '10': {
        	'question': 'Qno: 10 Which Pakistani city is given the title of “Switzerland of Pakistan”?',
        'choices': 'A. Karachi, B. Lahore, C. Peshawar, D. Swat',
        'answer': 'D',
        },
        '11': {
        	'question': 'Qno: 11 Which Pakistani city is given the title of “Pearl of the Himalaya”?',
        'choices': 'A. Swat Valley, B. Peshawar Valley, C. Bolan Valley, D. Kaghan Valley',
        'answer': 'D',
        },
        '12': {
        	'question': 'Qno: 12 Which Pakistani city is given the title of “City of lightning”?',
        'choices': 'A. Lahore, B. Karachi, C. Faisalabad, D. Quetta',
        'answer': 'B',
        },
        '13': {
        	'question': 'Qno: 13 Which Pakistani city is given the title of “Gateway of Pakistan”?',
        'choices': 'A. Quetta, B. Karachi, C. Faisalabad, D. Lahore',
        'answer': 'B',
        },
        '14': {
        	'question': 'Qno: 14 Which Pakistani city is given the title of “Brasilia of Pakistan”?',
        'choices': 'A. Lahore, B. Quetta, C. Faisalabad, D. Islamabad',
        'answer': 'D',
        },
        '15': {
        	'question': 'Qno: 15 Which Pakistani province is given the title of “Breadbasket of Pakistan”?',
        'choices': 'A. KPK, B. Punjab, C. Sindh, D. Islamabad',
        'answer': 'B',
        },
        '16': {
        	'question': 'Qno: 16 Which Pakistani city is given the title of “City of Flowers”?',
        'choices': 'A. Faisalabad, B. Lahore, C. Peshawar, D. Karachi',
        'answer': 'C',
        },
        '17': {
        	'question': 'Qno: 17 Which of the following is the highest dam in Pakistan?',
        'choices': 'A. Darawat Dam, B. Kala Bagh Dam, C. Tarbela Dam, D. Mangla Dam',
        'answer': 'D',
        },
          '18': {
        	'question': 'Qno: 18 Which of the following is the highest military award given by the Pakistani Govt.?',
        'choices': 'A. Victoria Cross, B. Nishan-e-Haider, C. Hilal-i-Jurat, D. Medal of Honor',
        'answer': 'B',
        },
          '19': {
        	'question': 'Qno: 19 Which of the following is the hottest place in Pakistan?',
        'choices': 'A. Layyah, B. Larkana, C. Karachi, D. Jacobabad',
        'answer': 'D',
        },
        '20': {
        	'question': 'Qno: 20 Which of the following is the oldest fort in Pakistan?',
        'choices': 'A. Ramkot Fort, B. Derawar Fort, C. Ranikot Fort, D. Kalat Fort',
        'answer': 'B',
        },
  };

  void startQuiz() {
    int totalQuestions = questionsMap.length;
    int correctAnswers = 0;

  
    // Create an instance of Random
    Random random = Random();

    while (questionsMap.isNotEmpty) {
      String randomKey = questionsMap.keys.elementAt(random.nextInt(questionsMap.length));
      Map<String, String> selectedQuestionMap = questionsMap[randomKey] ?? {};
      String selectedQuestion = selectedQuestionMap['question'] ?? "Question not found";
      String selectedChoices = selectedQuestionMap['choices'] ?? "Choices not found";
      print('\n');
      print('\x1B[32mRandomly selected question 👇\x1B[0m');
      print(selectedQuestion);
      print('\nAnswer Choices: $selectedChoices');
      String? userAnswer = stdin.readLineSync();

      if (userAnswer != null) {
        String correctAnswer = selectedQuestionMap['answer'] ?? "";
        if (userAnswer.toUpperCase() == correctAnswer) {
          correctAnswers++;
        }
      }

      // Remove the asked question to avoid duplicates
      questionsMap.remove(randomKey);
    }

    double percentage = (correctAnswers / totalQuestions) * 100;
    print("\nQuiz finished!");
    print("Total number of correct answers: $correctAnswers/$totalQuestions");
    print("Percentage of correct answers: $percentage%");

    if (percentage > 50) {
      print("Congratulations! You passed the quiz!");
    }

    askToRestartQuiz();
  }

  void askToRestartQuiz() {
    print("Do you want to restart the quiz? (yes/no)");
    String? choice = stdin.readLineSync()?.toLowerCase();

    if (choice == "yes") {
      // Reset questionsMap if the user wants to restart
      questionsMap = {
       '1': {
      'question': 'Which Pakistani city is given the title of “city of colleges”?',
      'choices': 'A. Quetta, B. Okara, C. Faisalabad, D. Lahore',
      'answer': 'D',
    },
    '2': {
      'question': 'How Many Major Cities Of Pakistan?',
      'choices': 'A. 3, B. 5, C. 7, D. 9',
      'answer': 'C',
    },
    '3': {
      'question': 'Which Pakistani city is given the title of “City of Greeneries”?',
      'choices': 'A. Islamabad, B. Swat Valley, C. Peshawar, D. Lahore',
      'answer': 'A',
    },
    '4': {
      'question': 'Which Pakistani city is given the title of “City of Textiles”?',
      'choices': 'A. Peshawar, B. Faisalabad, C. Lahore, D. Karachi',
      'answer': 'B',
      },
      '5': {
        'question': 'Which of the following country is given the title of “Land of the Pure',
        'choices': 'A. Saudi Arabia, B. Turkey, C. Pakistan, D. Afghanistan',
        'answer': 'C',
        },
        '6': {
          'question': 'Which Pakistani mountain is given the title of “Killer Mountain of the world”?',
          'choices': 'A. Nanga Parbat, B. K2, C. Broad Peak, D. Kanchenjunga',
        'answer': 'A',
        },
        '7': {
        	'question': 'Which Pakistani city is given the title of “Manchester of Pakistan”?',
        'choices': 'A. Karachi, B. Quetta, C. Faisalabad, D. Lahore',
        'answer': 'C',
        },
        '8': {
        	'question': 'Which Pakistani city is given the title of “Gateway of Invaders”?',
        'choices': 'A. Peshawar Pass, B. Khunjerab Pass, C. Bolan Pass, D. Khyber Pass',
        'answer': 'D',
        },
        '9': {
        	'question': 'Which Pakistani state is known as the “land of five rivers”?',
        'choices': 'A. KPK, B. Sindh, C. Baluchistan, D. Punjab',
        'answer': 'D',
        },
        '10': {
        	'question': 'Which Pakistani city is given the title of “Switzerland of Pakistan”?',
        'choices': 'A. Karachi, B. Lahore, C. Peshawar, D. Swat',
        'answer': 'D',
        },
        '11': {
        	'question': 'Which Pakistani city is given the title of “Pearl of the Himalaya”?',
        'choices': 'A. Swat Valley, B. Peshawar Valley, C. Bolan Valley, D. Kaghan Valley',
        'answer': 'D',
        },
        '12': {
        	'question': 'Which Pakistani city is given the title of “City of lightning”?',
        'choices': 'A. Lahore, B. Karachi, C. Faisalabad, D. Quetta',
        'answer': 'B',
        },
        '13': {
        	'question': 'Which Pakistani city is given the title of “Gateway of Pakistan”?',
        'choices': 'A. Quetta, B. Karachi, C. Faisalabad, D. Lahore',
        'answer': 'B',
        },
        '14': {
        	'question': 'Which Pakistani city is given the title of “Brasilia of Pakistan”?',
        'choices': 'A. Lahore, B. Quetta, C. Faisalabad, D. Islamabad',
        'answer': 'D',
        },
        '15': {
        	'question': 'Which Pakistani province is given the title of “Breadbasket of Pakistan”?',
        'choices': 'A. KPK, B. Punjab, C. Sindh, D. Islamabad',
        'answer': 'B',
        },
        '16': {
        	'question': 'Which Pakistani city is given the title of “City of Flowers”?',
        'choices': 'A. Faisalabad, B. Lahore, C. Peshawar, D. Karachi',
        'answer': 'C',
        },
        '17': {
        	'question': 'Which of the following is the highest dam in Pakistan?',
        'choices': 'A. Darawat Dam, B. Kala Bagh Dam, C. Tarbela Dam, D. Mangla Dam',
        'answer': 'D',
        },
          '18': {
        	'question': 'Which of the following is the highest military award given by the Pakistani Govt.?',
        'choices': 'A. Victoria Cross, B. Nishan-e-Haider, C. Hilal-i-Jurat, D. Medal of Honor',
        'answer': 'B',
        },
          '19': {
        	'question': 'Which of the following is the hottest place in Pakistan?',
        'choices': 'A. Layyah, B. Larkana, C. Karachi, D. Jacobabad',
        'answer': 'D',
        },
        '20': {
        	'question': 'Which of the following is the oldest fort in Pakistan?',
        'choices': 'A. Ramkot Fort, B. Derawar Fort, C. Ranikot Fort, D. Kalat Fort',
        'answer': 'B',
        },
      };
      startQuiz();
    } else {
      print("Thank you for playing the quiz app. Goodbye!");
    }
  }
}
