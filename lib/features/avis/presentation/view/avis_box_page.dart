import 'dart:developer' as developer;

import 'package:comment_box/comment/comment.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/avis/presentation/view/domain/entities/feedback/providers/feedback/feedback_provider.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/images/list_local.dart';

class AvisBoxPage extends ConsumerStatefulWidget {
  const AvisBoxPage({super.key, required this.avisId});

  final String avisId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AvisBoxPageState();
}

class _AvisBoxPageState extends ConsumerState<AvisBoxPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'photo_url': 'https://picsum.photos/100/30',
      'message': 'I love to code',
      'created_at': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'photo_url':
          'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'created_at': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'photo_url': 'https://picsum.photos/200/30',
      'message': 'Very cool',
      'created_at': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'photo_url': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'created_at': '2021-01-01 12:00:00'
    },
  ];

  Widget avisChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
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
                        imageURLorPath: data[i]['photo_url']),
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(
                data[i]['created_at'],
                style: const TextStyle(fontSize: 10),
              ),
            ),
          )
      ],
    );
  }

  Widget avisPosted() {
    final privatePostsFuture = ref.watch(feedbackProvider);
    return privatePostsFuture.when(
      data: (data) {
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final feedback = data[index];
              return ListTile(
                leading: GestureDetector(
                  onTap: () {},
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
                          imageURLorPath: feedback.photoUrl),
                    ),
                  ),
                ),
                title: Text(feedback.name!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(feedback.message),
                trailing: Text(
                  feedback.createdAt.toIso8601String(),
                  style: const TextStyle(fontSize: 10),
                ),
              );
            });
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.tr?.avisPage}'),
        backgroundColor: Colors.pink,
      ),
      body: CommentBox(
        userImage: CommentBox.commentImageParser(
            imageURLorPath: LocalImages.foxFaceMeshTexture),
        labelText: context.tr!.comment,
        errorText: context.tr!.canBeBlank,
        withBorder: false,
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            sendAvis(context);
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

  void sendAvis(BuildContext context) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    setState(() {
      var value = controller.text;

      ref
          .read(feedbackProvider.notifier)
          .submitFeedback(value, user!.isAnonymous);

      filedata.insert(0, value);
    });

    controller.clear();
    FocusScope.of(context).unfocus();
  }
}
