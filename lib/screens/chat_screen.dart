import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const Color bgColor = Color(0xFF041C45);
  static const Color cardColor = Color(0xFF0A2A5F);
  static const Color accent = Color(0xFFF6B21A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/200?img=5",
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "AI Workshop Group",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "32 members",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                IncomingMessage(
                  sender: "Fatima",
                  image:
                      "https://i.pravatar.cc/200?img=32",
                  message:
                      "Hey team! Don't forget our session tomorrow at 9am.\nSee you there! 🚀",
                  time: "9:15 AM",
                  reaction: "❤️ 4",
                ),

                SizedBox(height: 12),

                IncomingMessage(
                  sender: "David",
                  image:
                      "https://i.pravatar.cc/200?img=15",
                  message:
                      "Got it! I'll bring my laptop.",
                  time: "9:18 AM",
                  reaction: "👍 2",
                ),

                SizedBox(height: 12),

                OutgoingMessage(
                  message: "Can't wait! 🔥",
                  time: "9:20 AM",
                ),

                SizedBox(height: 12),

                FileMessage(
                  sender: "Jean",
                  image:
                      "https://i.pravatar.cc/200?img=25",
                  fileName: "Workshop Materials.pdf",
                  fileSize: "2.4 MB • PDF",
                  time: "9:22 AM",
                ),
              ],
            ),
          ),

          const MessageComposer(),
        ],
      ),
    );
  }
}

class IncomingMessage extends StatelessWidget {
  final String sender;
  final String image;
  final String message;
  final String time;
  final String reaction;

  const IncomingMessage({
    super.key,
    required this.sender,
    required this.image,
    required this.message,
    required this.time,
    required this.reaction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(image),
        ),

        const SizedBox(width: 10),

        Flexible(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF17376E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment:
                          Alignment.bottomRight,
                      child: Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),

              Text(
                reaction,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OutgoingMessage extends StatelessWidget {
  final String message;
  final String time;

  const OutgoingMessage({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 260,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: ChatScreen.accent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FileMessage extends StatelessWidget {
  final String sender;
  final String image;
  final String fileName;
  final String fileSize;
  final String time;

  const FileMessage({
    super.key,
    required this.sender,
    required this.image,
    required this.fileName,
    required this.fileSize,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(image),
        ),

        const SizedBox(width: 10),

        Container(
          width: 250,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF17376E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Icon(
                    Icons.insert_drive_file,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          fileSize,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MessageComposer extends StatelessWidget {
  const MessageComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        20,
      ),
      color: ChatScreen.bgColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius:
                    BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Type a message...",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.white54,
                  )
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: ChatScreen.accent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
