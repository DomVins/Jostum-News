import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jnews/temporary_data/temporary_data.dart';

import '../models/models.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

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
                    "Gallery",
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: galleryProcessor(galleryItems)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

galleryProcessor(List<GalleryObject> items) {
  List<Widget> temp = [];
  for (int i = 0; i < items.length; i++) {
    temp.add(galleryItem(items[i]));
  }
  return temp;
}

Widget galleryItem(GalleryObject item) {
  return Container(
    decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(12)),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: (() {}),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 39, 39, 39)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
