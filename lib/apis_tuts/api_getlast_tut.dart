import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modals/getComplexapi_modal.dart';

class getApiLastTut extends StatefulWidget {
  const getApiLastTut({super.key});

  @override
  State<getApiLastTut> createState() => _getApiLastTutState();
}

class _getApiLastTutState extends State<getApiLastTut> {
  Future<GetComplexapiModal> getProductsApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/73acd5b2-7fde-453c-b015-5daf03de49b8"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GetComplexapiModal.fromJson(data);
    } else {
      return GetComplexapiModal.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("getApiVeryComplex"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<GetComplexapiModal>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading...!");
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(snapshot.data!.data![index].shop!.name.toString()),
                              subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * 1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data!.data![index].images!.length,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height *
                                            .25,
                                        width:
                                            MediaQuery.of(context).size.width * .5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                          image: NetworkImage(snapshot.data!
                                              .data![index].images![position].url
                                              .toString()),
                                        )),
                                      ),
                                    );
                                  }),
                            ),
                            Icon(snapshot.data!.data![index].inWishlist == true ? Icons.favorite : Icons.favorite_border_outlined),
                          ],
                        );
                      });
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
