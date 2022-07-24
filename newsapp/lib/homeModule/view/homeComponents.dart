// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/webViewModule/view/webView.dart';

class AcrticleItem extends StatelessWidget {
  dynamic article;

  AcrticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: article["url"])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${article['urlToImage']}"),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${article['title']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenBuilder extends StatelessWidget {
  List list;
  dynamic state;

  ScreenBuilder(this.state, this.list);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: state is! NewsGetBusinessLoadingState,
      builder: (BuildContext context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => AcrticleItem(list[index]),
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length),
      fallback: (BuildContext context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
