import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hi Urs',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Good Morning',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Container(
            //padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Theme.of(context).primaryColor,
            child: Container(

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                  children:  [
                    itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange),
                    itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.green),
                    itemDashboard('Audience', CupertinoIcons.person_2, Colors.purple),
                    itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                    itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                    itemDashboard('Uploads', CupertinoIcons.add_circled, Colors.teal),
                    itemDashboard('About', CupertinoIcons.question_circle, Colors.blue),
                    itemDashboard('Contacts', CupertinoIcons.phone, Colors.pink.shade300),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,             
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white,),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      );
}
