import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/themes/dark_theme.dart';

class ListNews extends StatelessWidget {

  final List<Article> noticias;
   
  const ListNews({Key? key, required this.noticias}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,

      itemBuilder: (context, index) {
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar( noticia: noticia, index: index ),
        
        _TarjetaTitulo( noticia: noticia ),

        _TarjetaImagen( noticia: noticia ),

        _TarjetaBody( noticia: noticia ),

        _TarjetaBotones(),

        const SizedBox( height: 10 ),

        const Divider(),

      ], //Children[]
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;
  
  const _TarjetaTopBar({
    super.key, required this.noticia, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      //margin: const EdgeInsets.only(  bottom: 5 ),

      child: Row(
        children: [
          Text( '${ index + 1 }. ', style: TextStyle( color: darkTheme.primaryColor )),
          Text( '${ noticia.source.name }.' ),
        ], //Children[]
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),

      child: Text(
        noticia.title,

        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 10 ),

      child: ClipRRect(
        borderRadius: const BorderRadius.only( topLeft: Radius.circular( 50 ), bottomRight: Radius.circular( 50 ) ),
        child: Container(
          padding: const EdgeInsets.symmetric( horizontal: 15 ),
          //margin: const EdgeInsets.only(  bottom: 20 ),
          
          child: ( noticia.urlToImage != null )
            ? FadeInImage(
                placeholder: const AssetImage( 'assets/img/giphy.gif' ),
                image: NetworkImage( noticia.urlToImage! ),
              )
            : const Image(image: AssetImage( 'assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Text( ( noticia.description != null ) ? noticia.description! : '' ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          RawMaterialButton(
            fillColor: darkTheme.primaryColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 20 ),
            ),

            onPressed: () {
              
            },

            child: const Icon( Icons.star ),
          ),

          const SizedBox( width: 10 ),

          RawMaterialButton(
            fillColor: Colors.blue,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 20 ),
            ),

            onPressed: () {
              
            },

            child: const Icon( Icons.more ),
          ),
        ], //Children[]
      ),
    );
  }
}