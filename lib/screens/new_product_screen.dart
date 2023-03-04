import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../modals/constants.dart';

class newPeoductscreen extends StatefulWidget {
  @override
  State<newPeoductscreen> createState() => _newPeoductscreenState();
}

final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

bool _saving = false;
String? _carmoldel;
String? _cartype;
String? _year;
String? _category;
String? _pname;
String? _price;
String? _contry;
File? _image;
String Url = '';
String? _discreption;
CollectionReference pcolection =
    FirebaseFirestore.instance.collection('collection');

class _newPeoductscreenState extends State<newPeoductscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'اضافة المنتجات',
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
                      'نوع السيارة',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'ادخل نوع السيارة';
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(),
                          hintText: 'نوع السيارة',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                              child: Text('هيونداي'), value: 'هيونداي'),
                          DropdownMenuItem(child: Text('كيا'), value: 'كيا'),
                          DropdownMenuItem(
                              child: Text('بي ام دبليو'), value: 'بي ام دبليو'),
                          DropdownMenuItem(
                              child: Text('تويوتا'), value: 'تويوتا'),
                          DropdownMenuItem(child: Text('جيب'), value: 'جيب'),
                          DropdownMenuItem(
                              child: Text('مرسيدس'), value: 'مرسيدس'),
                          DropdownMenuItem(
                              child: Text('هوندا'), value: 'هوندا'),
                          DropdownMenuItem(child: Text('اودي'), value: 'اودي'),
                          DropdownMenuItem(child: Text('اخرى'), value: 'اخرى'),
                        ],
                        onChanged: (value) {
                          _carmoldel = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Text(
                      'الموديل',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل موديل السيارة';
                        }
                      },
                      onChanged: (value) {
                        _cartype = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'الموديل',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'سنة الصنع',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'ادخل السنة';
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(),
                          hintText: 'اختر السنة',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(child: Text('2023'), value: '2023'),
                          DropdownMenuItem(child: Text('2022'), value: '2022'),
                          DropdownMenuItem(child: Text('2022'), value: '2022'),
                          DropdownMenuItem(child: Text('2020'), value: '2020'),
                          DropdownMenuItem(child: Text('2019'), value: '2019'),
                          DropdownMenuItem(child: Text('2018'), value: '2018'),
                          DropdownMenuItem(child: Text('2017'), value: '2017'),
                          DropdownMenuItem(child: Text('2016'), value: '2016'),
                          DropdownMenuItem(child: Text('2015'), value: '2015'),
                          DropdownMenuItem(child: Text('2014'), value: '2014'),
                          DropdownMenuItem(child: Text('2013'), value: '2013'),
                          DropdownMenuItem(child: Text('2012'), value: '2012'),
                          DropdownMenuItem(child: Text('2011'), value: '2011'),
                          DropdownMenuItem(child: Text('2010'), value: '2010'),
                          DropdownMenuItem(child: Text('2009'), value: '2009'),
                          DropdownMenuItem(child: Text('2008'), value: '2008'),
                          DropdownMenuItem(child: Text('2007'), value: '2007'),
                          DropdownMenuItem(child: Text('2006'), value: '2006'),
                          DropdownMenuItem(child: Text('2005'), value: '2005'),
                          DropdownMenuItem(child: Text('2004'), value: '2004'),
                          DropdownMenuItem(child: Text('2003'), value: '2003'),
                          DropdownMenuItem(child: Text('2002'), value: '2002'),
                          DropdownMenuItem(child: Text('2001'), value: '2001'),
                          DropdownMenuItem(child: Text('2000'), value: '2000'),
                          DropdownMenuItem(child: Text('1999'), value: '1999'),
                          DropdownMenuItem(child: Text('1998'), value: '1998'),
                          DropdownMenuItem(child: Text('1997'), value: '1997'),
                          DropdownMenuItem(child: Text('1996'), value: '1996'),
                          DropdownMenuItem(child: Text('1995'), value: '1995'),
                          DropdownMenuItem(child: Text('1994'), value: '1994'),
                          DropdownMenuItem(child: Text('1993'), value: '1993'),
                          DropdownMenuItem(child: Text('1992'), value: '1992'),
                          DropdownMenuItem(child: Text('1991'), value: '1991'),
                          DropdownMenuItem(child: Text('1990'), value: '1990'),
                          DropdownMenuItem(child: Text('اخرى'), value: 'اخرى'),
                        ],
                        onChanged: (value) {
                          _year = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Text(
                      'الصنف',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'ادخل نوع الصنف';
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(),
                          hintText: 'نوع الصنف',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                              child: Text('اكسسوارات العناية'),
                              value: 'اكسسوارات العناية'),
                          DropdownMenuItem(
                              child: Text('اكسسوارات داخلية'),
                              value: 'اكسسوارات داخلية'),
                          DropdownMenuItem(
                              child: Text('الاضاءة والمصابيح'),
                              value: 'الاضاءة والمصابيح'),
                          DropdownMenuItem(
                              child: Text('الزيوت'), value: 'الزيوت'),
                          DropdownMenuItem(
                              child: Text('الادوات'), value: 'الادوات'),
                          DropdownMenuItem(
                              child: Text('ديسكوات'), value: 'ديسكوات'),
                          DropdownMenuItem(
                              child: Text('محركات'), value: 'محركات'),
                          DropdownMenuItem(
                              child: Text('كمبيوات'), value: 'كمبيوات'),
                          DropdownMenuItem(
                              child: Text('منظومة المحرك'),
                              value: 'منظومة المحرك'),
                          DropdownMenuItem(
                              child: Text('منظومة الوقود'),
                              value: 'منظومة الوقود'),
                          DropdownMenuItem(
                              child: Text('منظومة الكهرباء'),
                              value: 'منظظومة الكهرباء'),
                          DropdownMenuItem(
                              child: Text('منظومة التكييف والتبريد'),
                              value: 'منظومة التكييف والتبريد'),
                          DropdownMenuItem(
                              child: Text('منظومة الفرامل'),
                              value: 'منظومة الفرامل'),
                          DropdownMenuItem(
                              child: Text('منظومة العادم'),
                              value: 'منظومة العادم'),
                          DropdownMenuItem(
                              child: Text('الصالة'), value: 'الصالة'),
                          DropdownMenuItem(
                              child: Text('الهيكل الخارجي'),
                              value: 'الهيكل الداخلي'),
                          DropdownMenuItem(
                              child: Text('الهيكل الداخلي'),
                              value: 'الهيكل الخارجي'),
                          DropdownMenuItem(
                              child: Text('الاطارات'), value: 'الاطارات'),
                        ],
                        onChanged: (value) {
                          _category = value;
                          setState(() {});
                        },
                      ),
                    ),
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
                        _pname = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'اسم المنتج',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'بلد الصنع',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'ادخل بلد الصنع';
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(),
                          hintText: 'بلد الصنع',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                              child: Text('الصين'), value: 'الصين'),
                          DropdownMenuItem(
                              child: Text('كوريا'), value: 'كوريا'),
                          DropdownMenuItem(
                              child: Text('اليابان'), value: 'اليابان'),
                          DropdownMenuItem(
                              child: Text('تايوان'), value: 'تايوان'),
                          DropdownMenuItem(
                              child: Text('المانيا'), value: 'المانيا'),
                          DropdownMenuItem(
                              child: Text('امريكا'), value: 'امريكا'),
                          DropdownMenuItem(child: Text('اخرى'), value: 'اخرى'),
                        ],
                        onChanged: (value) {
                          _contry = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Text(
                      'السعر',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل السعر';
                        }
                      },
                      onChanged: (value) {
                        _price = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: 'السعر',
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
                            if (_globalKey.currentState!.validate()) {
                              setState(() {
                                _saving = true;
                              });

                              try {
                                await pcolection.add({
                                  kcarmodal: _carmoldel,
                                  kcartype: _cartype,
                                  kyear: _year,
                                  kcategory: _category,
                                  kname: _pname,
                                  kprice: _price,
                                  kdiscreption: _discreption,
                                  kimageUrl: Url,
                                  kcontry: _contry,
                                }).then((value) {
                                  setState(() {
                                    _saving = false;
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('تمت اضافة العنصر'),
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
