import 'package:mac_dt/features/finder/data/finder_item_type.dart';

class FinderItemInterface {
  final String title;
  final FinderItemType type;
  final String link;
  final bool isClickable;
  final String extension;

  FinderItemInterface({
    required this.title,
    required this.type,
    this.link="",
    this.isClickable = false,
    this.extension = "",
  });
}
