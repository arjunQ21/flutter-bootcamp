class Candidate {
  String id;
  String name;
  String description;
  String votingId;
  String? image;
  int votes;
  Candidate({
    this.image,
    required this.id,
    required this.name,
    required this.description,
    required this.votingId,
    required this.votes,
  });
  static Candidate fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      votingId: json['voting'],
      votes: json['votes'],
      image: json['image'],
    );
  }
}
