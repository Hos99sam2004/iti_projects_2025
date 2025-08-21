import 'package:flutter/material.dart';
import 'package:iti_projects/myapps/news/Const.dart';

class CatagoryScreen extends StatefulWidget {
  final String category;
  const CatagoryScreen({super.key, required this.category});

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
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
      appBar: AppBar(title: Text("عرض أخبار ${widget.category} هنا 👇")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: apidata.articles?.length ?? 0,
                itemBuilder: (context, index) {
                  final article = apidata.articles![index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
    );
  }
}
