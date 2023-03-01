//  {
//       "_id": "6369d41432caa833a24a2211",
//       "title": "President of india",
//       "description": "asdf",
//       "status": "shown",
//       "from": "2022-11-01T18:15:00.000Z",
//       "to": "2022-11-07T18:15:00.000Z",
//       "createdAt": "2022-11-08T03:59:16.034Z",
//       "updatedAt": "2022-11-09T06:12:11.054Z",
//       "candidates": [
//         {
//           "_id": "636a7624767f7063a396b84b",
//           "name": "Haro ram",
//           "description": "asdf",
//           "voting": "6369d41432caa833a24a2211",
//           "createdAt": "2022-11-08T15:30:44.004Z",
//           "updatedAt": "2022-11-09T06:06:16.436Z",
//           "__v": 0,
//           "image": "http://voting.padxu.com/images/candidate_636a7624767f7063a396b84b_1667973976426.jpg",
//           "votes": 3
//         },
//         {
//           "_id": "636b30e492a4025690896397",
//           "name": "Shyam Karki",
//           "description": "asdaf",
//           "voting": "6369d41432caa833a24a2211",
//           "createdAt": "2022-11-09T04:47:32.802Z",
//           "updatedAt": "2022-11-09T04:47:43.575Z",
//           "__v": 0,
//           "image": "http://voting.padxu.com/images/candidate_636b30e492a4025690896397_1667969263554.jpg",
//           "votes": 0
//         },
//         {
//           "_id": "636b437ecf790380d67febc1",
//           "name": "Bigyan Bista",
//           "description": "343434",
//           "voting": "6369d41432caa833a24a2211",
//           "createdAt": "2022-11-09T06:06:54.612Z",
//           "updatedAt": "2022-11-09T06:07:03.224Z",
//           "__v": 0,
//           "image": "http://voting.padxu.com/images/candidate_636b437ecf790380d67febc1_1667974023199.jpg",
//           "votes": 1
//         }
//       ]
//     },

class Voting {
  String id;
  String title;
  String description;
  String status;
  DateTime from;
  DateTime to;

  Voting({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.from,
    required this.to,
  });

  static Voting fromJson(Map<String, dynamic> json) {
    return Voting(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
    );
  }
}
