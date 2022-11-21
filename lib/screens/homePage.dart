import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:test_space/api/apiHelper.dart';
import 'package:test_space/models/dataModel.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<dataModel>? posts;
  bool isloaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await apiDecoder().getDataModel();
    setState(() {
      if (posts != null) {
        isloaded = true;
      } else {
        isloaded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              alignment: Alignment.center,
              width: 300,
              height: 500,
              child: Visibility(
                visible: isloaded,
                child: ListView.builder(
                    itemCount: posts?.length,
                    itemBuilder: ((context, index) =>
                        Text(posts![index].age.toString()))),
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
              ))
        ]),
      ),
    );
  }
}
