import 'package:flutter/material.dart';

import '../modals/modals.dart';

class DetailsView extends StatelessWidget {
  Product model;

  DetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        model.pname!,
                        style: TextStyle(fontSize: 32),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'دينار',
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(width: 5),
                          Text(
                            model.price!,
                            style: TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        'الوصف',
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        model.discreption!,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
