import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/global/global_variables.dart';
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
                if (_description.text == "") {
                  return showAlertBox(
                      "Alert", "Please fill the text field", context);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text("Fill the text field")));

                } else {
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> data = {
                    "description": _description.text
                  };
                  await FirebaseFirestore.instance.collection("post").add(data);
                  setState(() {
                    _isLoading = false;
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => GetJson(myJson: widget.json),
                    //   ),
                    // );
                    navigateToTheOtherScreen(
                        context, GetJson(myJson: widget.json));
                  });
                }
              },
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
