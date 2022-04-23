
class TopRated {
  final String imageLink;

  TopRated({required this.imageLink});

  factory TopRated.fromJson(Map<String, dynamic> json) {
    return TopRated(imageLink: json['backdrop_path'] as String);
  }
}

class UpComing {
  final bool adult;
  final List<dynamic> genreList;
  final String title;
  final String overview;
  final String image;
  final String date;

  UpComing({required this.adult,
    required this.genreList,
    required this.title,
    required this.overview,
    required this.image,
    required this.date});

  factory UpComing.fromJson(Map<String, dynamic> json){
    return UpComing(adult: json['adult'] as bool,
        genreList: json['genre_ids'] as List<dynamic>,
        title: json['title'] as String,
        overview: json['overview'] as String,
        image: json['backdrop_path']??json['poster_path'] as String,
        date: json['release_date'] as String);
  }

}
