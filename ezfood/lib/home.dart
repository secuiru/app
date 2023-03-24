import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'api/post.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

//hakee dataaa API:lta
    getData();
  }

  getData() async {
    posts = await Service().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API in use for showing recipes'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                 Text(
                posts![index].recipename,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 24,
                 fontWeight: FontWeight.bold),
              ),
              Text(
                posts![index].instructions,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12,
                 ),
              ),
              ],
              ),
            );
          },
        ),
      ),
    );
  }
}
