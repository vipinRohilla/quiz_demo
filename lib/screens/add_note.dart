import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/global/global_variables.dart';
import 'package:quiz_application/model/user_model.dart';
import 'package:quiz_application/screens/get_json.dart';
import 'package:quiz_application/widgets/alert_box.dart';

class AddNote extends StatefulWidget {
  final String json;
  const AddNote({Key? key, required this.json}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _description = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputborder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    // Color blue = Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.json.toUpperCase() + " QUIZ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "You can add some note or description",
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _description,
              decoration: InputDecoration(
                  hintText: "description",
                  border: inputborder,
                  focusedBorder: inputborder,
                  enabledBorder: inputborder,
                  filled: true,
                  contentPadding: const EdgeInsets.all(8)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width - 200, 60)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                //taking care of the empty description and description with blank spaces only
                if (_description.text.trim().isEmpty) {
                  return showAlertBox(
                      "Alert", "Please fill the text field", context);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text("Fill the text field")));

                } else {
                  setState(() {
                    _isLoading = true;
                  });

                  //storing the value of description in user_model and then converting it to json using custom toJson method
                  User user = User(description: _description.text);
                  await FirebaseFirestore.instance
                      .collection("post")
                      .add(user.toJson());

                  //stopping the loading
                  setState(() {
                    _isLoading = false;
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => GetJson(myJson: widget.json),
                    //   ),
                    // );

                    //if loading stops it will redirect you to the QuizScreen
                    navigateToTheOtherScreen(
                        context, GetJson(myJson: widget.json));
                  });
                }
              },

              //if loading is true it will show circularIndicator otherwise it will show Submit text on
              child: _isLoading == true
                  ? Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    )
                  : const Text("Submit"))
        ],
      ),
    );
  }
}
