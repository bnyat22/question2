import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question2/question.dart';
import 'package:question2/questionProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => QuestionState(index: 0), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Question question = Question(
      questionText: "La capitale de la france est Paris?",
      isCorrect: true,
      reponse: "reponse");

  Question question1 = Question(
      questionText: "Macron est le president?",
      isCorrect: true,
      reponse: "reponse");
  Question question2 = Question(
      questionText: "Pogba porte le numéro 7?",
      isCorrect: false,
      reponse: "reponse");

  @override
  Widget build(BuildContext context) {
    List<Question> list = [question, question1, question2];

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Questions/Réponses"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // horizontal).

          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/vvvv.jpg"),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Text(
                list[Provider.of<QuestionState>(context).index].questionText,
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool b = list[
                              Provider.of<QuestionState>(context, listen: false)
                                  .index]
                          .isCorrect;
                      if (b) {
                        Provider.of<QuestionState>(context, listen: false)
                            .setReponse('votre reponse est correcte');
                      } else {
                        Provider.of<QuestionState>(context, listen: false)
                            .setReponse('votre reponse nest pas correct');
                      }
                    },
                    child: Text("vrai")),
                ElevatedButton(
                    onPressed: () {
                      bool b = list[
                              Provider.of<QuestionState>(context, listen: false)
                                  .index]
                          .isCorrect;
                      if (!b) {
                        Provider.of<QuestionState>(context, listen: false)
                            .setReponse('votre reponse est correcte');
                      } else {
                        Provider.of<QuestionState>(context, listen: false)
                            .setReponse('votre reponse nest pas correct');
                      }
                    },
                    child: Text("faux")),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<QuestionState>(context, listen: false)
                          .next(list.length);
                      print(Provider.of<QuestionState>(context, listen: false)
                          .index);
                    },
                    child:
                        Text("Suivant", style: TextStyle(color: Colors.white))),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(Provider.of<QuestionState>(context).reponse,
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
