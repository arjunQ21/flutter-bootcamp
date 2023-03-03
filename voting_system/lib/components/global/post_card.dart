import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/screens/global/single_voting_screen.dart';
import 'package:voting_system/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../models/voting.dart';
import '../../providers/user_provider.dart';
import '../../providers/voting_provider.dart';
import '../../screens/admin/edit_post_screen.dart';

class PostCard extends StatelessWidget {
  Voting voting;
  bool isAdmin;

  PostCard({
    Key? key,
    required this.voting,
    this.isAdmin = true,
  }) : super(key: key);

  List<PopupMenuItem<int>> popupItems = const [
    PopupMenuItem(
      value: 0,
      child: Text("View"),
    ),
    PopupMenuItem(
      value: 1,
      child: Text("Edit"),
    ),
    PopupMenuItem(
      value: 2,
      child: Text("Delete"),
    ),
  ];

  List<PopupMenuItem<int>> getPopupItems() {
    List<PopupMenuItem<int>> items = [];
    if (isAdmin) {
      return popupItems;
    } else {
      for (int i = 0; i < popupItems.length; i++) {
        if (i == 0) {
          items.add(popupItems[i]);
        }
      }
      return items;
    }
  }

  void handleView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleVotingPage(
          voting: voting,
        ),
      ),
    );
  }

  void handleEdit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditPostScreen(
          voting: voting,
        ),
      ),
    );
  }

  void handleDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are you sure?"),
        content: Text("This cannot be undone."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).pop();
              var response = await http
                  .delete(Uri.parse("$baseURL/votings/${voting.id}"), headers: {
                'Authorization':
                    "Bearer ${Provider.of<UserProvider>(context, listen: false).user!.token}"
              });

              var decoded = jsonDecode(response.body);

              if (decoded['status'] == 'success') {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Deleted successfully")));
                Navigator.of(context).pop();
                // update provider
                Provider.of<VotingProvider>(context, listen: false)
                    .delete(voting.id);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Could not delete: $decoded")));
              }
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }

  handlePopup(value, BuildContext context) {
    switch (value) {
      case 0:
        handleView(context);
        break;
      case 1:
        handleEdit(context);
        break;
      case 2:
        handleDelete(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        handleView(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: kLightColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF38476D).withOpacity(0.09),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      voting.title,
                      style: const TextStyle(
                        color: kDarkColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.circle,
                      size: 14.0,
                      color: (voting.status == 'hidden')
                          ? kFailureColor
                          : kSuccessColor,
                    )
                  ],
                ),
                PopupMenuButton<int>(
                  tooltip: 'More',
                  onSelected: ((value) => handlePopup(value, context)),
                  itemBuilder: (context) => getPopupItems(),
                ),
              ],
            ),
            const SizedBox(
              height: 0.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  color: kSuccessColor,
                  size: 24.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  dateFormatter.format(voting.from),
                  style: TextStyle(
                    color: kDarkColor.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timer_off,
                  color: kFailureColor,
                  size: 24.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  dateFormatter.format(voting.to),
                  style: TextStyle(
                    color: kDarkColor.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: kDarkColor.withOpacity(0.5),
                  size: 24.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  voting.candidates.length.toString(),
                  style: TextStyle(
                    color: kDarkColor.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
