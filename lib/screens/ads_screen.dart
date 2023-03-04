import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../modals/constants.dart';

class adsScreen extends StatefulWidget {
  @override
  State<adsScreen> createState() => _adsScreenState();
}

final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

bool _saving = false;
String? _adsname;
String? _newprice;
String? _oldprice;
String? _persentage;
double? oldprice;
double? newprice;
double? precentage;
File? _image;
String Url = '';
String? _discreption;
CollectionReference pcolection =
    FirebaseFirestore.instance.collection(kadscollection);

class _adsScreenState extends State<adsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'اضافة اعلان',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Form(
          key: _globalKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم المنتج',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل اسم المنتج';
                        }
                      },
                      onChanged: (value) {
                        _adsname = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'المنتج',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'السعر القديم',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل السعر القديم';
                        }
                      },
                      onChanged: (value) {
                        _oldprice = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'السعر القديم',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'السعر الجديد',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' ادخل السعر الجديد';
                        }
                      },
                      onChanged: (value) {
                        _newprice = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'السعر الجديد',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'الوصف',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل الوصف';
                        }
                      },
                      onChanged: (value) {
                        _discreption = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'الوصف',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'الصورة',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Spacer(flex: 1),
                            IconButton(
                              onPressed: () async {
                                ImagePicker _picker = ImagePicker();
                                var images = await _picker.pickImage(
                                    source: ImageSource.gallery);

                                setState(() {
                                  _image = File(images!.path);
                                });

                                String unqueFileName = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString();
                                Reference referenceRoot =
                                    FirebaseStorage.instance.ref();
                                Reference referenceDirImage =
                                    referenceRoot.child('product_images');
                                Reference referenceUpload =
                                    referenceDirImage.child(unqueFileName);
                                try {
                                  await referenceUpload
                                      .putFile(File(images!.path));
                                  Url = await referenceUpload.getDownloadURL();
                                  print(Url);
                                } catch (e) {}
                              },
                              icon: Icon(
                                Icons.add_a_photo_outlined,
                                size: 45,
                              ),
                            ),
                            Spacer(flex: 1),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
                              child: _image == null
                                  ? Center(
                                      child: Text(
                                      'اختر صورة',
                                      style: TextStyle(fontSize: 32),
                                    ))
                                  : Image.file(_image!),
                              height: 160,
                              width: 160,
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            newprice = double.parse(_newprice!);
                            oldprice = double.parse(_oldprice!);
                            precentage = newprice! / oldprice!;
                            precentage = 1 - precentage!;
                            precentage = 100 * precentage!;
                            setState(() {
                              _persentage = precentage.toString();
                            });

                            print(_persentage);

                            if (_globalKey.currentState!.validate()) {
                              setState(() {
                                _saving = true;
                              });

                              try {
                                await pcolection.add({
                                  kadsname: _adsname,
                                  kadsoldprice: _oldprice,
                                  kadsnewprice: _newprice,
                                  kadsdiscreption: _discreption,
                                  kimageUrl: Url,
                                  kadspersentage: _persentage,
                                }).then((value) {
                                  setState(() {
                                    _saving = false;
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('تمت اضافة الاعلان'),
                                    ),
                                  );
                                });
                              } on FirebaseException catch (e) {
                                setState(() {
                                  _saving = false;
                                });
                                print(e.message!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.message!),
                                  ),
                                );
                                setState(() {
                                  _saving = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            'اضف',
                            style: TextStyle(fontSize: 32),
                          )),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
