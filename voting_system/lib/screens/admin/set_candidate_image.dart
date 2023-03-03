import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/providers/voting_provider.dart';
import 'package:voting_system/utils/constants.dart';

class SetCandidateImage extends StatefulWidget {
  final Candidate candidate;
  const SetCandidateImage({super.key, required this.candidate});

  @override
  State<SetCandidateImage> createState() => _SetCandidateImageState();
}

class _SetCandidateImageState extends State<SetCandidateImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Candidate Image'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: pickedImage != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(pickedImage!.path)),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child:
            pickedImage == null ? Center(child: Text("Choose an image")) : null,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Text("Choose New Image"),
              ),
            ),
            if (pickedImage != null) SizedBox(width: 10.0),
            if (pickedImage != null)
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    var url = Uri.parse(
                        '$baseURL/votings/${widget.candidate.votingId}/candidates/${widget.candidate.id}/setImage');
                    var req = http.MultipartRequest('POST', url);
                    req.files.add(
                      await http.MultipartFile.fromPath(
                        'image',
                        pickedImage!.path,
                        contentType:
                            MediaType.parse(lookupMimeType(pickedImage!.path)!),
                      ),
                    );

                    var res = await req.send();
                    final resBody = await res.stream.bytesToString();

                    if (res.statusCode >= 200 && res.statusCode < 300) {
                      var jsonDecoded = jsonDecode(resBody);
                      if (jsonDecoded['status'] == 'success') {
                        Candidate updatedCandidate =
                            Candidate.fromJson(jsonDecoded['data']);

                        Provider.of<VotingProvider>(context, listen: false)
                            .editCandidate(updatedCandidate);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Updated image."),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text((jsonDecoded['message'] ?? jsonDecoded)
                              .toString()),
                        ));
                      }
                    } else {
                      print(res.reasonPhrase);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload),
                      SizedBox(width: 10.0),
                      Text("Upload"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
