class Content{
  int id; 
  String title; 
  String description; 
  String main_contents; 
  double rate; 
  String content_img; 
  String content_video; 
  String content_type;
  String content_date;
  int user_id;

  Content({this.id, this.title, this.description, this.main_contents, this.rate,
          this.content_img, this.content_video, this.content_type, this.content_date, user_id});

  factory Content.fromJson(Map<String, dynamic> json){
    return Content(
      id: json['id'], 
      title: json['title'],
      description: json['description'], 
      main_contents: json['main_contents'],
      rate: json['rate'],
      content_img: json['content_img'],
      content_video: json['content_video'],
      content_type: json['content_type'], 
      content_date: json['content_date'], 
      user_id: json['user_id']
    );
  }
  
}