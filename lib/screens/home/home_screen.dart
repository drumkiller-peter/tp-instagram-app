// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_instagram_app/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(HomeAddPostRequested());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Column(
              children: [
                Text("Welcome $email"),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                  state.posts[index].title.toString(),
                                ),
                                Text(
                                  "Like Count: ${state.posts[index].likeCount ?? 0}",
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    // BlocProvider.of<HomeBloc>(context).add(HomeDataFetchRequested());
                                    context
                                        .read<HomeBloc>()
                                        .add(HomeLikeEditRequested(
                                          id: state.posts[index].id ?? 0,
                                        ));
                                  },
                                  child: const Icon(Icons.favorite),
                                ),
                                Image.network(state.posts[index].imagePath ??
                                    "https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mike-bird-3729464.jpg&fm=jpg"),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
