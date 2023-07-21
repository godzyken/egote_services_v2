import 'dart:developer' as developer;

import 'package:comment_box/comment/comment.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/images/list_local.dart';

class AvisBoxPage extends ConsumerStatefulWidget {
  const AvisBoxPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AvisBoxPageState();
}

class _AvisBoxPageState extends ConsumerState<AvisBoxPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': LocalImages.venomJpg,
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];
  Widget avisChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                developer.log('avis clicked');
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: CommentBox.commentImageParser(
                    imageURLorPath: data[i]['pic']
                  ),
                ),
              ),
            ),
            title: Text(data[i]['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(data[i]['message']),
            trailing: Text(data[i]['date'], style: const TextStyle(fontSize: 10),),
          ),)
      ],
    );
  }

  Widget avisPosted()   {
    final privatePostsFuture =
    ref.watch(supabaseClientProvider).from('avis_posts').select<List<Map<String, dynamic>>>();
    return FutureBuilder(
        future: privatePostsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) =>
                ListTile(
                  leading: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: CommentBox.commentImageParser(
                            imageURLorPath: data[index]['pic']
                        ),
                      ),
                    ),
                  ),
                  title: Text(data[index]['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(data[index]['message']),
                  trailing: Text(data[index]['created_at'], style: const TextStyle(fontSize: 10),),
                ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.avisPage),
        backgroundColor: Colors.pink,
      ),
      body: CommentBox(
        userImage: CommentBox.commentImageParser(
            imageURLorPath: LocalImages.venomJpg),
        labelText: context.tr!.comment,
        errorText: context.tr!.canBeBlank,
        withBorder: false,
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            developer.log(controller.text);
            setState(() {
              var value = {
                'name': 'New User',
                'pic': 'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                'message': controller.text,
                'date': '2021-01-01 12:00:00'
              };
              filedata.insert(0, value);
            });
            //ref.read(supabaseClientProvider).from('avis_posts').insert(value);

            controller.clear();
            FocusScope.of(context).unfocus();
          } else {
            developer.log("Not validated");
          }
        },
        formKey: formKey,
        commentController: controller,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        child: avisChild(filedata),
      ),
    );
  }
}
