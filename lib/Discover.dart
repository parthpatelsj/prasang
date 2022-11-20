import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('public').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.book),
                            title: Text('Prasang'),
                            subtitle: Text(((doc.data() as dynamic)['body']) ?? ''),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                                TextButton(
                                child: const Icon(Icons.favorite_border),
                                onPressed: () {/* ... */},
                                ),
                                const SizedBox(width: 8),
                            ],
                        ),
                    ]
                    
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}