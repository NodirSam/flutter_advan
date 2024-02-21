import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/post_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../service/HTTP_Service.dart';
import '../service/log_service.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);
  static String id = "network_page";

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {

  var isLoading = false;
  var items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void _apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      setState(() {
        isLoading = false;
        items = Network.parsePostList(response);
      });
    }

  }

  void _apiPostDelete(Post post){
      Network.DEL( Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
        //LogService.i(response.toString()),
        _apiPostList(),
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return itemHomePost(items[index]);
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget itemHomePost(Post post){
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){
              _apiPostDelete(post);
            },
            flex: 3,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text(post.title!.toUpperCase()),
            SizedBox(height: 5,),
            Text(post.body!),
          ],
        ),
      ),
    );
  }
}
