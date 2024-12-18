import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "My Chat",
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  Provider.of<AuthUProvider>(context).user!.photoURL!),
            ),
            IconButton(
                onPressed: () {
                  Provider.of<AuthUProvider>(context, listen: false)
                      .signOut(context);
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        const Divider(),
      ],
    );
  }
}