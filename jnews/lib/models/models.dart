class News {
  String title;
  String publishDate;
  String imageUrl;
  String content;
  String authorName;
  String authorProfileImageUrl;
  bool liked;
  int loves;
  int comments;

  News(
      this.title,
      this.publishDate,
      this.imageUrl,
      this.content,
      this.authorName,
      this.authorProfileImageUrl,
      this.liked,
      this.loves,
      this.comments);
}

class DidYouKnow {
  String title;
  String content;
  String imageUrl;

  DidYouKnow(this.title, this.content, this.imageUrl);
}

class GalleryObject {
  String title;
  String imageUrl;

  GalleryObject(this.title, this.imageUrl);
}
