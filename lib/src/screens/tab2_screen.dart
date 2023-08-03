
//Tab2 Screen

import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_services.dart';
import 'package:news_app/src/themes/dark_theme.dart';
import 'package:news_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            const _ListaCategorias(),

            Expanded(
              child: ListNews( noticias:  newsService.getArticulosCategoriaSeleccionada! ),
            ),

          ], //Children[]
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 85,

      child: ListView.builder(
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
    
        itemBuilder: (context, index) {
    
          final categoryName = categories[index].name;
    
          return SizedBox(
            //width: 110,
            child: Padding(
              padding: const EdgeInsets.all( 10 ),
              
              child: Column(
                children: [
                  _CategoryButton( categoria: categories[index] ),
                  const SizedBox( height: 5 ),
                  Text( '${ categoryName[0].toUpperCase() }${ categoryName.substring( 1 ) }' ), //Colocar primera letra en Mayúsculas.
                ],//Children[]
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category categoria;
  
  const _CategoryButton({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>( context, listen: false );

        newsService.setSelectedCategory = categoria.name;


      },

      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric( horizontal: 10 ),
        
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
    
        child: Icon(
          categoria.icon,
          color: ( newsService.getSelectedCategory == categoria.name )
              ? darkTheme.primaryColor
              : Colors.black54
        ),
      ),
    );
  }
}