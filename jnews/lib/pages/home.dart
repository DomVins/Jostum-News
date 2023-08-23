import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jnews/temporary_data/temporary_data.dart';

import '../models/models.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 20.0),
                  child: Text(
                    "Jostum News",
                    style: TextStyle(
                        fontFamily: "Alkatra",
                        color: Color.fromARGB(255, 1, 119, 5),
                        fontSize: 26,
                        letterSpacing: 0.5),
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 0, 73, 3),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: homeItemsManager(),
          ))
        ],
      ),
    );
  }
}

homeItemsManager() {
  List<Widget> items = [];
  for (int i = 0; i < news.length; i++) {
    items.add(newsObject(news[i]));
    items.add(Container(
      height: 1,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 25),
      decoration: const BoxDecoration(color: Colors.grey),
    ));
  }

  items.add(didYouKnow(didYouKnows));
  items.add(Container(
    height: 1,
    width: double.maxFinite,
    margin: const EdgeInsets.symmetric(vertical: 25),
    decoration: const BoxDecoration(color: Colors.grey),
  ));

  for (int i = 0; i < news.length; i++) {
    items.add(newsObject(news[i]));
    items.add(Container(
      height: 1,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 25),
      decoration: const BoxDecoration(color: Colors.grey),
    ));
  }

  return items;
}

Widget didYouKnow(DidYouKnow item) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            "assets/images/did.jpg",
            height: 80,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.title,
          style: const TextStyle(
              color: Color.fromARGB(255, 32, 32, 32),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.content,
          // maxLines: 2,
          style: const TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}

Widget newsObject(News item) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: Image.asset(
                item.authorProfileImageUrl,
              ).image,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.authorName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  item.publishDate,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45, blurRadius: 4, spreadRadius: 0.1)
              ]),
          width: double.maxFinite,
          height: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(fit: StackFit.expand, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, bottom: 10, top: 8),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              item.content,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: item.liked
                        ? const Color.fromARGB(255, 238, 20, 4).withAlpha(100)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: item.liked
                            ? Colors.transparent
                            : Colors.grey.shade400)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item.liked
                        ? const Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 238, 20, 4),
                          )
                        : const Icon(
                            Icons.favorite_outline,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${item.loves}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.chat_bubble_outline_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${item.comments}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

/// ******* ////
/*  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 240,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ) */
