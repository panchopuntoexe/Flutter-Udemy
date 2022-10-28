import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("avatars"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
            maxRadius: 110,
            backgroundImage: NetworkImage(
                'https://thefader-res.cloudinary.com/private_images/c_limit,w_1024/c_crop,h_269,w_517,x_0,y_69/w_400,c_limit,f_auto,q_auto:eco/517px-Efrim_Manuel_Manuck_02_mhuq4z/517px-Efrim_Manuel_Manuck_02_mhuq4z.jpg')),
      ),
    );
  }
}
