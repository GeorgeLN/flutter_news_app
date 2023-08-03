// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:news_app/src/models/models.dart';

const _URL_NEWS = 'https://newsapi.org/v2';
const _ApiKey = '6e6c309c3b3844fab41b44e6cba6a6d4';

class NewsService with ChangeNotifier {

  List<Article> headLines = [];

  String _selectedCategory = 'entertainment';

  List<Category> categories = [
    Category( FontAwesomeIcons.tv, 'entertainment' ),
    Category( FontAwesomeIcons.building, 'business' ),
    Category( FontAwesomeIcons.addressCard, 'general' ),
    Category( FontAwesomeIcons.headSideVirus, 'health' ),
    Category( FontAwesomeIcons.vials, 'science' ),
    Category( FontAwesomeIcons.volleyball, 'sports' ),
    Category( FontAwesomeIcons.memory, 'technology' ),
  ];

  Map<String, List<Article>> categoryArticle = {};

  NewsService() {
    getTopHeadlines();

    categories.forEach( ( item ) { 
      categoryArticle[item.name] = [];
    });
  }

  get getSelectedCategory => _selectedCategory;

  set setSelectedCategory( String valor ) {
    _selectedCategory = valor;
    
    getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => categoryArticle[_selectedCategory];

  getTopHeadlines() async {
    
    const url = '$_URL_NEWS/top-headlines?apiKey=$_ApiKey&country=us' ;
    //const url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=6e6c309c3b3844fab41b44e6cba6a6d4';
    //final url = Uri.http( 'https://newsapi.org/v2/top-headlines?country=us&apiKey=6e6c309c3b3844fab41b44e6cba6a6d4' );

    final resp = await http.get( Uri.parse( url ) );

    final newsResponse = NewsResponse.fromJson( resp.body );

    headLines.addAll( newsResponse.articles ); //Se añaden todos los artículos.

    notifyListeners();
  }

  getArticlesByCategory( String category ) async {

    if ( categoryArticle[category]!.length > 0 ) {
      return categoryArticle[category];
    }
    
    // final url = '$_URL_NEWS/top-headlines?apiKey=$_ApiKey&country=us&category=$category';
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_ApiKey&category=$category';

    final response = await http.get( Uri.parse( url ) );

    final newsResponse = NewsResponse.fromJson( response.body );

    categoryArticle[category]?.addAll( newsResponse.articles );

    notifyListeners();
  }
}