
// Tab1 Screen


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/src/widgets/widgets.dart';
import 'package:news_app/src/services/news_services.dart';

class Tab1Screen extends StatefulWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

//NOTA: El "AutomaticKeepAliveClientMixin", permite mantener el estado redibujado y que éste no se reinicie. Para poder usarlo, se debe establecer un "StateFulWidget"
class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headLines = Provider.of<NewsService>(context).headLines;

    return Scaffold(
      body: ( headLines.length == 0 ) // == 0;
        ? const Center( child: CircularProgressIndicator() )
        : ListNews( noticias: headLines )
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //True permite mantener el estado tal como se dejó.
}