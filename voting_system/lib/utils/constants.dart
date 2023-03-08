import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kLightColor = Color(0xFFFFFFFF);
const kDarkColor = Color(0xFF000000);
const kPrimaryColor = Color(0xFF3674BD);
const kFailureColor = Color(0xFFF64E60);
const kSuccessColor = Color(0xFF50CD89);
const kNeutralColor = Color(0xFFF3F6F9);
const kIconColor = Color(0xFF667085);

String baseURL = 'https://voting.padxu.com';

final DateFormat dateFormatter = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);

List<Color> votingResultColors = [
  Colors.amber,
  Colors.pink,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.blueGrey,
  Colors.green,
  Colors.grey,
];
