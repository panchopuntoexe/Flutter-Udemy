import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/brutalism.jpg')),
          Title(),
          ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: const Text(
              'Laborum dolor nisi labore officia ex magna cupidatat in. Aliqua culpa fugiat minim aliqua anim ad officia exercitation adipisicing qui. Non velit enim dolor labore magna.Laborum dolor nisi labore officia ex magna cupidatat in. Aliqua culpa fugiat minim aliqua anim ad officia exercitation adipisicing qui. Non velit enim dolor labore magna.Laborum dolor nisi labore officia ex magna cupidatat in. Aliqua culpa fugiat minim aliqua anim ad officia exercitation adipisicing qui. Non velit enim dolor labore magna.Laborum dolor nisi labore officia ex magna cupidatat in. Aliqua culpa fugiat minim aliqua anim ad officia exercitation adipisicing qui. Non velit enim dolor labore magna.',
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Mollit is ad ut ullamco in.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Consequat dolor minim minim aute deserunt.',
                  style: TextStyle(color: Colors.blueGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star_border_rounded, color: Colors.blue),
          Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ButtonColumn(color: Colors.blue, icon: Icons.call, label: 'CALL'),
          ButtonColumn(color: Colors.blue, icon: Icons.near_me, label: 'ROUTE'),
          ButtonColumn(color: Colors.blue, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonColumn extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const ButtonColumn({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
