class Cast {
  List<Actor> actores = new List();

  Cast.fromJsonList( List jsonList ){
    if (jsonList == null) return;
    jsonList.forEach((element) { 
      final actor = Actor.fromJsonMap(element);
      actores.add(actor);
    });
  }
}


class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    gender = json['gender'];
    adult = json['adult'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    department = json['department'];
    job = json['job'];
  }

  getPhotoImg() {
    if(profilePath == null){
      return 'https://www.intra-tp.com/wp-content/uploads/2017/02/no-avatar.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
  }
}

class ActorDetail {
  bool adult;
  List alsoKnownAs;
  String biography;
  String birthday;
  dynamic deathday;
  int gender;
  dynamic homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  ActorDetail({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  ActorDetail.fromJsonMap(Map<String, dynamic> json){
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'];
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  getPhotoImg() {
    if(profilePath == null){
      return 'https://www.intra-tp.com/wp-content/uploads/2017/02/no-avatar.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
  }
}