
import 'package:flutter/material.dart';
class detailss extends StatefulWidget {



  String author , title , description , URL ,urlToImage , publishedAt,content;
  detailss(this.author , this.title , this.description,this.URL, this.urlToImage,this.publishedAt,this.content);

  @override
  _detailssState createState() => _detailssState();
}

class _detailssState extends State<detailss>with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Details of the news'),),
      body: Column(

        children: <Widget>[
          drawImage(context),

          TabBar(
            // indicatorPadding: EdgeInsets.only(bottom: 700),
              controller: _tabController,
              //unselectedLabelColor: Colors.white,
              labelColor: Colors.black,



              tabs: [
                Tab(child: new Text('Description',style: TextStyle(
                  inherit: true,
                  fontSize: 20.0,
                  //   color: Colors.black,

                )) ,),
                Tab(child: new Text('Content',style: TextStyle(
                  inherit: true,
                  fontSize: 20.0,
                  //color: Colors.black,

                )) ,),
              ]),

          drawTapView(context),

        ],
      ),
    );

  }

  Widget drawImage(BuildContext context) {
    if(widget.urlToImage=null)
      return Container(
        height: MediaQuery.of(context).size.height*0.35,
        // width: 1500  ,
        width: MediaQuery.of(context).size.width,
        child: Image(image: NetworkImage(widget.urlToImage),
          fit: BoxFit.cover,) ,
      );
    else
      return Container(
          height: MediaQuery.of(context).size.height*0.35,
          // width: 1500  ,
          width: MediaQuery.of(context).size.width,
          //  child:  Image.asset('images/noImage.png'),
          child:  Image(image: ExactAssetImage('images/noImage.png'),fit: BoxFit.cover,
            height: 300,
          )
      );
  }
  Widget drawTapView(BuildContext context){

      return Flexible(child: Container(

        child: TabBarView(
          controller: _tabController,
          children: [
            Container(
                padding: EdgeInsets.only(left: 50,top: 25),
                child: new Text(widget.description,style: TextStyle(
                  inherit: true,
                  fontSize: 20.0,
                  color: Colors.black,

                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 50,top: 25),
                child: new Text(widget.content,style: TextStyle(fontSize: 20),)),

          ],
        ),
      ),) ;



  }
}
