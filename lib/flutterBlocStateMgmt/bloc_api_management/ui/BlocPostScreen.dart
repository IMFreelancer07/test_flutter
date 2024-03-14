import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_state.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/enums.dart';

class BlocPostScreen extends StatefulWidget {
  const BlocPostScreen({super.key});

  @override
  State<BlocPostScreen> createState() => _BlocPostScreenState();
}

class _BlocPostScreenState extends State<BlocPostScreen> {

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state){
          if(state.status == PostStatus.Loading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state.status == PostStatus.Failure){
            return Center(child: Text(state.message.toString()));
          }
          else {
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search via Email",
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value){
                    context.read<PostBloc>().add(SearchPost(searchString: value));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty ?
                  Center(child: Text(state.searchMessage.toString())) :
                  ListView.builder(
                      itemCount: state.templist.isEmpty ? state.list.length : state.templist.length,
                      itemBuilder: (context, index){

                        if(state.templist.isNotEmpty){
                          final item = state.templist[index];
                          return ListTile(
                            title: Text(item.email.toString()),
                            subtitle: Text(item.body.toString()),
                          );
                        }else{
                          final item = state.list[index];
                          return ListTile(
                            title: Text(item.email.toString()),
                            subtitle: Text(item.body.toString()),
                          );
                        }


                      }
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
