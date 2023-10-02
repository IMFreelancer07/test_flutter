import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mvvm/data/response/status.dart';
import 'package:test_flutter/mvvm/res/components/round_button.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:test_flutter/mvvm/viewModal/home_view_viedModal.dart';
import 'package:test_flutter/mvvm/viewModal/services/splash_services.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Home_view_ViewModal home_view_viewModal = Home_view_ViewModal();

  @override
  void initState() {
    home_view_viewModal.fetMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final userPref = Provider.of<UserViewModal>(context);

    final height = MediaQuery
        .of(context)
        .size
        .height * 1;

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              userPref.removeUser().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
                Utils.toastMessage("Logged out.");
              }).onError((error, stackTrace){

                Utils.flushBarErrorMessages("Error Logging Out. Try again!", context);
                if(kDebugMode){
                  print("Error Occured"+error.toString());
                }
              });
            },
            child: Center(child: Text("Logout")),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider<Home_view_ViewModal>(
        create: (BuildContext context) => home_view_viewModal,
        child: Consumer<Home_view_ViewModal>(
          builder: (context, value, child) {
            switch(value.moviesList.status){
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              default:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        value.moviesList.data!.movies![index].posterurl!.toString(),
                      errorBuilder: (context, error, stack){
                          return Icon(Icons.error, color: Colors.red,);
                      },
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      title: Text(value.moviesList.data!.movies![index].title!.toString()),
                      subtitle: Text(value.moviesList.data!.movies![index].year!.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                          Icon(Icons.star, color: Colors.yellow,)
                        ],
                      ),
                    ),
                  );
                });
            }
        },
        ),
      ),
    );
  }
}
