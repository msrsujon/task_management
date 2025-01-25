import 'package:flutter/material.dart';

import '../Screens/update_profile_screen.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        tileColor: Colors.white,
        title: Text('Title will be here'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description will be here"),
            Text("Date:1/5/25"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "new",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UpdateProfileScreen.name);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
