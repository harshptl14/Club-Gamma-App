class GalleryModel {
  var title;
  var banner;
  var date;
  var type;
  var images;

  GalleryModel(this.title, this.banner, this.date,
      this.type, this.images);

  GalleryModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    banner = data['banner'];
    date = data['date'];
    type = data['event_type'];
    images = data['images'];
  }
}
