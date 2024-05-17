import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        CircleAvatar(
          radius: 72,
          backgroundColor: Colors.grey.withOpacity(0.6),
          child: const CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7UNI8A1UaZR-NaJQLrsLIXc4a5Gg8-YIW4U0s28gXTw&s',
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
