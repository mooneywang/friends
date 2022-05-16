import 'package:flutter/material.dart';
import 'package:friends/friend.dart';
import 'package:provider/provider.dart';

import 'friend_viewmodel.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  FriendViewModel viewModel = FriendViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Friend"),
          ),
          body: Column(
            children: [
              Container(
                height: 44,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: TextField(
                  onChanged: (newValue) {
                    viewModel.searchFieldOnChanged(newValue);
                  },
                  controller: viewModel.searchController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.search, size: 30),
                      hintText: "name or tel",
                      border: InputBorder.none),
                ),
              ),
              Consumer(
                builder: (
                  BuildContext context,
                  FriendViewModel vm,
                  Widget? child,
                ) {
                  return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            Friend friend = vm.filterFriends[index];
                            return Container(
                              height: 44,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    friend.name,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Text(
                                    friend.tel,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 1,
                              width: double.infinity,
                              color: Colors.black38,
                            );
                          },
                          itemCount: viewModel.filterFriends.length));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
