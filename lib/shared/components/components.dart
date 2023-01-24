
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_screen.dart';



Widget buildArticleItem (article,imageUrl,context) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>   WebViewScreen(url: "${article["url"]}" ,),));
  }  ,
  child:   Padding(
  
    padding: const EdgeInsets.all(10.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height: 120,
  
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
  
            image: DecorationImage(image: image(article,imageUrl),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(width: 20,),
  
        Expanded(
  
          child: Container(
  
            height: 120,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    "${article["title"]}",
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow:TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  "${article["publishedAt"]}",
  
                  style: TextStyle(color: Colors.grey,
  
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



Widget myDivider () => Container(
  color: Colors.black12,
  height: 1,
  margin: const EdgeInsets.symmetric(horizontal: 30),
);

ImageProvider image (article, imageUrl){
  String url = "${article["urlToImage"]}";
  ImageProvider img;
  if (url == "null" ) {
    img = NetworkImage(imageUrl);
  }
  else {
    img =  NetworkImage(url);
  }
  return img;
}

Widget articleBuilder ({required list,required context,String? imgUrl}) =>ConditionalBuilder(
  condition: list.isNotEmpty,
  fallback: (context) => const Center(child: CircularProgressIndicator()) ,
  builder: (context) =>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return buildArticleItem(
              list[index],
              imgUrl,
              context
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return myDivider();
        },
      ) ,

);


Widget defaultFormField({
  required Function(String) onChange,
  required String label,
  IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        border: const OutlineInputBorder(),
      ),
    );
