import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertBox(String title, String content, BuildContext context){
    return showDialog(
                    context: context,
                    builder: (ctx) => 
                    Platform.isIOS ?
                    CupertinoAlertDialog(
                      title:  Text(title),
                      content:  Text(content),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text("OKAY"),
                        ),
                      ],
                    )
                    :
                    AlertDialog(
                      title:  Text(title),
                      content: Text(content),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text("OKAY"),
                        ),
                      ],
                    )

                  );
}

