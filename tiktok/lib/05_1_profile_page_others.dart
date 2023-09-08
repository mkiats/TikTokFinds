// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';

import '06_1_wishlists_page.dart';
import 'model/user_model.dart';

class ProfilePageOthers extends StatefulWidget {
  const ProfilePageOthers({super.key});

  @override
  State<ProfilePageOthers> createState() => _ProfilePageOthersState();
}

class _ProfilePageOthersState extends State<ProfilePageOthers> {
  UserModel user = const UserModel("Test Name", "Test Handle", ["following"],
      ["followers"], 1233, "abcdefghijkl", "createdAt", "updatedAt", 123321);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GestureDetector(
            onTap: () {
              debugPrint("Username clicked");
            },
            child: Text(
              user.name.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.link_outlined,
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          color: Colors.black,
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.handle,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 20, 5),
                  child: Column(
                    children: [
                      Text(user.following.length.toString(),
                          style: const TextStyle(color: Colors.white)),
                      const Text("Following",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                  child: Column(
                    children: [
                      Text(user.followers.length.toString(),
                          style: const TextStyle(color: Colors.white)),
                      const Text("Followers",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 5, 5),
                  child: Column(
                    children: [
                      Text("789", style: TextStyle(color: Colors.white)),
                      Text("Likes", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("Edit Profile"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("Add Friends"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const WishlistsPage();
                          }),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      child: const Text("Wishlist")),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(20, 20))),
                child: const Text("+ Add Bio",
                    style: TextStyle(
                        fontSize: 12, overflow: TextOverflow.visible)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: OutlinedButton(
                    style: const ButtonStyle(alignment: Alignment.center),
                    onPressed: () {},
                    child: const Row(children: [
                      Icon(Icons.photo),
                      Text("Add Yours", style: TextStyle(fontSize: 12)),
                    ]),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.browse_gallery_outlined)),
                OutlinedButton(
                    onPressed: () {}, child: const Icon(Icons.lock_outline)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.collections_outlined)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.favorite_outline)),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.picture_in_picture_alt_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        child: Text(
                            "Share a fun video you've recorded recently",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
