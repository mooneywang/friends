import 'package:flutter/material.dart';
import 'package:friends/friend.dart';

class FriendViewModel extends ChangeNotifier {

  FriendViewModel() {
    filterFriends = _allFriend;
  }

  TextEditingController searchController = TextEditingController();

  late List<Friend> filterFriends;
  final List<Friend> _allFriend = [
    Friend("Herry", "123-8237"),
    Friend("Lucy", "151-8237"),
    Friend("Lily", "122-8237"),
    Friend("Jack", "110-8237"),
    Friend("Jay", "188-8237"),
    Friend("Jerry", "199-8237"),
    Friend("Mark", "180-8237"),
    Friend("Martin", "144-8237"),
  ];

  searchFieldOnChanged(String value) {
    filterFriends = [];
    for (var friend in _allFriend) {
      if (friend.name.contains(value) || friend.tel.contains(value)) {
        filterFriends.add(friend);
      }
    }
    notifyListeners();
  }
}
