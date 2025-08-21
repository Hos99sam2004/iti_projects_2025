import 'package:flutter/material.dart';
import 'package:iti_projects/myapps/news/Const.dart';
import 'package:iti_projects/myapps/news/catagory.dart' show CatagoryScreen;

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<Map<String, String>> categories = [
    {
      "title": "General",
      "image":
          "https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_1280.jpg",
    },
    {
      "title": "Sports",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl-miNQ5yxJt_TWlbpRJykkjRkiDIQ1jgw1l7GnRenG99Ol6UTi4RjOQA&s",
    },
    {
      "title": "Business",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxGJ-iL3ELLqlEIkYAhrIb6ZGOfHAj_JrY2ROADM2WiGt3G-liQfgW0b8&s",
    },
    {
      "title": "Technology",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSChHpUA_WLG38-T882rGiQvyxaTJKD2UQpqLNiBJP-sfkG8nlWZt8tgPk&s",
    },
    {
      "title": "Entertainment",
      "image":
          "https://static.vecteezy.com/system/resources/thumbnails/042/624/039/small_2x/entertainment-news-lighting-inscription-graphic-presentation-with-a-dynamic-neon-frame-of-pink-and-blue-colors-on-black-background-entertainment-concept-video.jpg",
    },
    {
      "title": "Health",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcT4hb6arXTQM119SSWdcyma5awcjt5iDyhnOOPp5rNND8Z4PsOSL-qPE&s",
    },
  ];

  final api = Api();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await api.GetData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final apidata = api.model;

    return Scaffold(
      appBar: AppBar(title: Text("News App 📰"), centerTitle: true),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ✅ التصنيفات
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 150,
                      // mainAxisSpacing: 20,
                      // childAspectRatio: 20,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CatagoryScreen(
        category: categories[index]["title"]!, // 👈 نبعت العنوان بدل index
      ),
    ),
  );
},

                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    categories[index]["image"]!,
                                    fit: BoxFit.fill,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                          Icons.image_not_supported,
                                          size: 30,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("${categories[index]["title"]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Divider(),

                // ✅ الأخبار
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: apidata.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      final article = apidata.articles![index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        elevation: 2,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              article.urlToImage ??
                                  "https://via.placeholder.com/150",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: 50),
                            ),
                          ),
                          title: Text(
                            article.title ?? "No title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            article.description ?? "No description",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
