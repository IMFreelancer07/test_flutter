import 'package:flutter/material.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("WhatsApp"),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt),
              ),
              Tab(
                child: Text("Chats"),
              ),
              Tab(
                child: Text("Status"),
              ),
              Tab(
                child: Text("Calls"),
              ),
            ],
          ),
          actions: [
            Icon(Icons.camera_alt),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(value: 1, child: Text("New group")),
                PopupMenuItem(value: 2, child: Text("New broadcast")),
                PopupMenuItem(value: 3, child: Text("Linked devices")),
                PopupMenuItem(value: 4, child: Text("Starred messages")),
                PopupMenuItem(value: 5, child: Text("Settings")),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Text("Camera"),
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                    ),
                    title: Text("Syed Shahbaz"),
                    subtitle: Text("Hi there! How you doing?"),
                    trailing: Text("7:35 PM"),
                  );
                }),
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Container(
                            child: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                  "https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                            ),
                          ),
                          title: Text("My Status"),
                          subtitle: Text("Tap to add status update"),
                        ),
                        Text("Recent updates"),
                      ],

                    );
                  } else if (index > 0) {
                    return
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.green, width: 3)),
                              child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    "https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                              ),
                            ),
                            title: Text("Syed Shahbaz"),
                            subtitle: Text("05 min ago"),
                          ),
                        ],
                      ),
                    );
                  }
                }),
            ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                    ),
                    title: Text("Syed Shahbaz"),
                    subtitle: Text(index / 2 == 0
                        ? "You missed a video call"
                        : "You missed an audio call"),
                    trailing:
                        Icon(index / 2 == 0 ? Icons.video_call : Icons.phone),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
