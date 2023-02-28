// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:voting_system/utils/constants.dart';

class PostCard extends StatelessWidget {
  bool isAdmin;
  String postTitle;
  DateTime startTime;
  DateTime endTime;
  int candiates;
  Function? handleView;
  Function? handleEdit;
  Function? handleDelete;

  PostCard({
    Key? key,
    required this.isAdmin,
    required this.postTitle,
    required this.startTime,
    required this.endTime,
    required this.candiates,
    this.handleView,
    this.handleEdit,
    this.handleDelete,
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

  handlePopup(value) {
    switch (value) {
      case 0:
        handleView!();
        break;
      case 1:
        handleEdit!();
        break;
      case 2:
        handleDelete!();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    postTitle,
                    style: const TextStyle(
                      color: kDarkColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 14.0,
                    color: kFailureColor,
                  )
                ],
              ),
              PopupMenuButton<int>(
                tooltip: 'More',
                onSelected: ((value) => handlePopup(value)),
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
                startTime.toString(),
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
                endTime.toString(),
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
                candiates.toString(),
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
    );
  }
}
