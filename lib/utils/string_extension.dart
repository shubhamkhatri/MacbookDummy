extension StringExtension on String {
  String capitalize() {
    return this.split(" ").map((element) => "${element[0].toUpperCase()}${element.substring(1)}").join(" ");
  }

  String getInitials() => this.isNotEmpty
      ? this.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}