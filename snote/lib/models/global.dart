import 'package:flutter/material.dart';

Color backgroundColor = new Color(0xFFECDFCF);
Color darkBackgroundColor = new Color(0xFFe3d7ca);
Color btnBackgroundColor = new Color(0xFF187CBD);

String font = 'Avenir';

double smallSize = 15; 
double mediumSize = 20; 

TextStyle labelStyle = TextStyle(color: Color(0xFF187CBD),
                                fontSize: smallSize,
                                fontFamily: font);

TextStyle signUpStyle = TextStyle(color: Color(0xFF187CBD),
                                fontSize: mediumSize, 
                                fontFamily: font,
                                fontWeight: FontWeight.bold);

TextStyle addContentStyle = TextStyle(fontSize: mediumSize, 
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold);

TextStyle addANewNoteStyle = TextStyle(fontFamily: font,
                                       fontSize: mediumSize,
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold);

TextStyle btnSaveLabelStyle = TextStyle(fontFamily: font,
                                        fontSize: mediumSize,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold); 

TextStyle btnBrowseLabelStyle = TextStyle(fontFamily: font,
                                          color: Colors.white, 
                                          fontWeight: FontWeight.bold);

Text addANewNote = Text("Add A New Note", style: addANewNoteStyle);

Text btnSaveLabel = Text("Save", style: btnSaveLabelStyle); 

Text btnBrowseLabel = Text("Browse", style: btnBrowseLabelStyle);