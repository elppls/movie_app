import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/Screens/home.dart';
import 'package:movie_app/Screens/movies.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => moviesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('TV Shows'),
            ),
          ],
        ),
      ),
    );
  }
}
