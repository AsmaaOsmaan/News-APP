import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/models/artical.dart';
import 'package:news_app/screens/details.dart';
import 'package:news_app/shared_ui/nav_drawer.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
class Bitcoin extends StatefulWidget {
  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  NewsApi newsApi=NewsApi();
  int page =5;
  bool loading=true;
  int currentPage=1;
  List <Artical>Articals=[];
  ScrollController scrollController= ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
    scrollController.addListener((
        ){
      if (scrollController.position.pixels==scrollController.position.maxScrollExtent){
        fetchNews();
      }
    });
  }
fetchNews(){
  newsApi.FetchArticalsBitcoin(currentPage).then((futureArticals){
    Articals.addAll(futureArticals);

    print('*******************************');
    print(Articals);
    setState(() {
      loading=false;
      if (currentPage!=page){
        currentPage++;
      }

    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('All articles about Bitcoin'),
      ),
      drawer: NavDrawer(),
    /*  body: Container(
        child: loading?Center(child: CircularProgressIndicator(),):
        Container(

          child: Padding(padding:EdgeInsets.only(top: 24,left: 8,right: 8) ,
            child: GridView.builder(
                itemCount: Articals.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing:18 ,
                  childAspectRatio: 0.55,
                ),

                itemBuilder:(context,position){
                  return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Details(Articals[position].author , Articals[position].title, Articals[position].description,
                            Articals[position].url,Articals[position].urlToImage,Articals[position].publishedAt,Articals[position].content);
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 150,
                            child:(Articals[position].urlToImage!=null)? Image(image: NetworkImage(Articals[position].urlToImage,),fit: BoxFit.cover):Container()),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(Articals[position].title,textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(Articals[position].author.toString(),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  );

                }
            ),
          ),),

      ),*/

      body:  Container(
          child: loading?Center(child: CircularProgressIndicator(),):ListView.builder(
              controller: scrollController,

              itemCount: Articals.length+1
              ,itemBuilder:(BuildContext Context,int position){

            if (position==Articals.length){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Details(Articals[position].author , Articals[position].title, Articals[position].description,
                      Articals[position].url,Articals[position].urlToImage,Articals[position].publishedAt,Articals[position].content);
                }));
              },
              child: Card(

                child: Container(
                  height: 200,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(Articals[position].title,style: TextStyle(color: Colors.white,fontSize: 18,backgroundColor: Colors.black),),
                    ),


                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image:  DecorationImage(
                      image: (Articals[position].urlToImage!=null)? NetworkImage(Articals[position].urlToImage): ExactAssetImage('Images/noImage.png'),
                      fit: BoxFit.cover,
                    ),
                    /*  border: Border.all(
                 color: Colors.black,
                 width: 8,
               ),*/
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            );
          })),

      /* body:  Container(
     child: loading?Center(child: CircularProgressIndicator(),):ListView.builder(
     itemCount: Articals.length,itemBuilder:(BuildContext Context,int position){
       return Card(
         child: ListTile(
           title: Text(Articals[position].title),
         ),
       );
     })),*/
    );

  }
}
