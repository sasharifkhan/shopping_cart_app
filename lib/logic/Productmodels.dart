class Productmodels {
  
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Productmodels({required this.userId, required this.id, required this.title, required this.body});


  factory Productmodels.fromJson(Map<String, dynamic> json) => Productmodels(
    userId: json['userId'], 
    id: json['id'], 
    title: json['title'], 
    body: json['body']
    );


  
}