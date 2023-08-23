import 'package:flutter/material.dart';

import 'dm.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SafeArea(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 20.0),
                child: Text(
                  "Chats",
                  style: TextStyle(
                      fontFamily: "Alkatra",
                      color: Color.fromARGB(255, 1, 119, 5),
                      fontSize: 26,
                      letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 230, 230, 230),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'User',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1),
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text(
              "Admins",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
        Container(
          height: 120,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 15),
              adminHead("Students Union Jostum", "assets/images/union.jpg"),
              adminHead("Mechanical Engineering Department",
                  "assets/images/union.jpg"),
              adminHead("Electrical Engineering Department",
                  "assets/images/union.jpg"),
              adminHead("Students Union Jostum", "assets/images/union.jpg"),
              adminHead("Students Union Jostum", "assets/images/union.jpg"),
              adminHead("Students Union Jostum", "assets/images/union.jpg"),
            ],
          ),
        ),
        Container(
          height: 1.5,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        const Expanded(
            child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Text(
                "No Chat History yet. Start a chat by tapping on any of the Admins above to chat with."),
          ),
        ))
      ]),
    );
  }

  Widget adminHead(String title, String imageUrl) {
    return GestureDetector(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Chat(
                    title: title,
                  )))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color.fromARGB(255, 230, 230, 230),
              backgroundImage: Image.asset(imageUrl).image,
            ),
            SizedBox(
              width: 80,
              child: Text(
                title,
                maxLines: 3,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
