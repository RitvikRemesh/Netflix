import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix1/application/search/search_bloc.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/domain/core/debounce/debounce.dart';
import 'package:netflix1/presentation/search/widget/search_idle.dart';
import 'package:netflix1/presentation/search/widget/search_result.dart';

// const imageUrl =
//     "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411";

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if(value.isEmpty){
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(
                      context,
                    ).add(searchMovie(movieQuery: value));
                  });
                },
              ),
              kheight,

              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.searchResultList.isEmpty) {
                      return const SearchIdleWidget();
                    } else {
                      return const SearchResultWidget();
                    }
                  },
                ),
              ),
              //const  Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
