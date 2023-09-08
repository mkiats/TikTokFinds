// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '06_wishlist_page.dart';
import 'dart:math';
import 'model/wishlist_model.dart';
import 'model/item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  List<String> hintTextList = ["iPhone 11 pro case", "Travel adapter", ];
  List<WishlistModel> wishlistList = [];
  List<WishlistModel> displayList = [];
  final _random = Random();
  String hintWord = "";
  String searchWord = "";
  bool hintWordSet = false;
  TextEditingController textController = TextEditingController();
  String imageUrl = 'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80';

  void updateList(String value) {
    setState(() {
      displayList = wishlistList.where((element) => 
        element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
    searchWord = value;
  }

  Future<List<WishlistModel>> getWishList() async {
    try {
      var url = Uri.parse('http://10.0.2.2:4000/api/wishList/all');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        final List<WishlistModel> data = responseData
          .map((json) => WishlistModel.fromJson(json))
          .toList();
        
        return data;
      }
      else {
        debugPrint('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return []; // Return an empty list in case of an exception
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getWishList().then((items) {
      setState(() {
        wishlistList = items;
        displayList = List.from(wishlistList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hintWordSet) {
      hintWord = hintTextList[_random.nextInt(hintTextList.length)];
      hintWordSet = true;
    }

    // if(wishlistList.isNotEmpty) {
    //   displayList = List.from(wishlistList);
    // }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30.0, right: 16.0, left: 10.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios), // Back button icon
                  onPressed: () {
                    Navigator.pop(context); // Add navigation logic here
                  },
                ),
                const SizedBox(
                    width: 5.0), // Gap between back button and search bar
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 40.0),
                    child: Center(
                      child: TextField(
                        controller: textController,
                        onChanged: (value) => updateList(value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: searchWord.isNotEmpty ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              textController.clear();
                              updateList('');
                            },
                          ) : null,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.only(top: 5.0),
                          hintText: hintWord,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: const Color.fromARGB(255, 249, 85, 85),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                TextButton(
                    onPressed: () {
                      // debugPrint('Click on Search');
                      // query = '';
                    },
                    child: const Text('Search',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 249, 85, 85))))
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0),
              itemCount: displayList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const WishlistPage(),
                  //   ),
                  // );
                  debugPrint("clicked");
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(
                    displayList[index].name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0, 
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                          // displayList[index].wishListImage!,
                          imageUrl
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      Text(
                        displayList[index].creatorName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    'saveCount'
                  ),
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      imageUrl,
                      // displayList[index].wishListImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
              )  
            ),
          ),
        ],
      ),
    );
  }
}
