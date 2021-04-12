import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Workshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workshop Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("WorkshopLayout"),
        ),
        body: ListView(
          children: <Widget>[
            headerSection,
            titleSection,
            Divider(),
            buttonSection,
            courseSection
          ],
        ),
      ),
    );
  }
}

Widget headerSection = Container(
  child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,
      image: 'https://images.unsplash.com/photo-1618071147329-803bf99d9746?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),);

Widget titleSection = Container(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Awesome Company Co., Ltd',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Bankok, Thailand',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Icon(
          Icons.thumb_up,
          color: Colors.blue,
        ),
        SizedBox(
          width: 10,
        ),
        Text("1")
      ],
    ),
  ),
);
Widget buttonSection = Container(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(icon: Icons.thumb_up, label: "Like"),
        _buildButton(icon: Icons.comment, label: "Comment"),
        _buildButton(icon: Icons.share, label: "Share"),
      ],
    ),
  ),
);

Widget _buildButton({IconData icon, String label}) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.grey[500],
      ),
      Container(
        margin: EdgeInsets.all(10.0),
        child: Text("$label"),
      ),
    ],
  );
}

Widget courseSection = Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Mobile course", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCardList(
                'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
            _buildCardList(
                'https://images.unsplash.com/photo-1618143709566-a69daa528376?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
            _buildCardList(
                'https://images.unsplash.com/photo-1618141411216-96de9f2bd309?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
            _buildCardList(
                'https://images.unsplash.com/photo-1618111415065-c20b4e1afd41?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
            _buildCardList(
                'https://images.unsplash.com/photo-1617906641165-c7d0117c18ca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80')
          ],
        ),
      )
    ],
  ),
);

Card _buildCardList(String url) {
  return Card(
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage, image: url)
  );
}
