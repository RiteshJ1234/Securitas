import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:securitas/common/enums/message_enum.dart';
import 'package:securitas/common/utils/utils.dart';
import 'package:securitas/features/chat/controller/chat_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField({
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = true;
  final TextEditingController _messageController = TextEditingController();

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            _messageController.text.trim(),
            widget.recieverUserId,
          );
      setState(() {
        _messageController.text = '';
      });
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.recieverUserId,
          messageEnum,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
            child: TextFormField(
              controller: _messageController,
              onChanged: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    isShowSendButton = true;
                  });
                } else {
                  setState(() {
                    isShowSendButton = true;
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // prefixIcon: SizedBox(
                //   width: 100,
                //   child: Row(
                //     children: [
                //       IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.emoji_emotions,
                //           color: Colors.grey,
                //         ),
                //       ),
                //       IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.gif,
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: selectImage,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.purple.shade200,
                        ),
                      ),
                      IconButton(
                        onPressed: selectVideo,
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.purple.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Type a message!',
                hintStyle: GoogleFonts.inder(),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(186, 104, 200, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(186, 104, 200, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, right: 10),
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 20,
            child: GestureDetector(
              child: Icon(
                isShowSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onTap: sendTextMessage,
            ),
          ),
        ),
      ],
    );
  }
}
