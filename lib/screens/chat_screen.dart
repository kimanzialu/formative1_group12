import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
 const ChatScreen({super.key});


 static const Color bgColor = Color(0xFF041C45);
 static const Color cardColor = Color(0xFF0A2A5F);
 static const Color accent = Color(0xFFF6B21A);


 @override
 Widget build(BuildContext context) {
   final chats = [
     {
       "name": "ALU Debate Society",
       "message": "Meeting starts in 10 mins.",
       "time": "09:41",
       "unread": 3,
     },
     {
       "name": "Tech & Innovation Hub",
       "message": "John shared a file.",
       "time": "08:25",
       "unread": 0,
     },
     {
       "name": "Entrepreneurship Club",
       "message": "Pitch Day is tomorrow 🚀",
       "time": "Yesterday",
       "unread": 5,
     },
     {
       "name": "Women In Leadership",
       "message": "Thank you everyone!",
       "time": "Yesterday",
       "unread": 0,
     },
   ];


   return Scaffold(
     backgroundColor: bgColor,


     appBar: AppBar(
       backgroundColor: bgColor,
       elevation: 0,
       title: const Text(
         "Messages",
         style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
         ),
       ),
       actions: const [
         Icon(Icons.more_vert, color: Colors.white),
         SizedBox(width: 10),
       ],
     ),


     floatingActionButton: FloatingActionButton(
       backgroundColor: accent,
       child: const Icon(
         Icons.chat,
         color: Colors.black,
       ),
       onPressed: () {},
     ),


     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(
             horizontal: 16,
           ),
           child: Container(
             height: 50,
             decoration: BoxDecoration(
               color: cardColor,
               borderRadius: BorderRadius.circular(25),
             ),
             child: const TextField(
               style: TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 border: InputBorder.none,
                 prefixIcon: Icon(
                   Icons.search,
                   color: Colors.white54,
                 ),
                 hintText: "Search chats",
                 hintStyle: TextStyle(
                   color: Colors.white54,
                 ),
               ),
             ),
           ),
         ),


         const SizedBox(height: 20),


         SizedBox(
           height: 90,
           child: ListView(
             scrollDirection: Axis.horizontal,
             padding: const EdgeInsets.symmetric(
               horizontal: 16,
             ),
             children: List.generate(
               6,
               (index) => Padding(
                 padding:
                     const EdgeInsets.only(right: 14),
                 child: Column(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(3),
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(
                           color: accent,
                           width: 2,
                         ),
                       ),
                       child: const CircleAvatar(
                         radius: 25,
                         backgroundColor:
                             Colors.white24,
                         child: Icon(
                           Icons.groups,
                           color: Colors.white,
                         ),
                       ),
                     ),
                     const SizedBox(height: 6),
                     const Text(
                       "Group",
                       style: TextStyle(
                         color: Colors.white70,
                         fontSize: 12,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),


         Expanded(
           child: ListView.builder(
             itemCount: chats.length,
             itemBuilder: (context, index) {
               final chat = chats[index];


               return ListTile(
                 contentPadding:
                     const EdgeInsets.symmetric(
                   horizontal: 16,
                   vertical: 4,
                 ),


                 leading: CircleAvatar(
                   radius: 28,
                   backgroundColor: cardColor,
                   child: const Icon(
                     Icons.groups,
                     color: Colors.white,
                   ),
                 ),


                 title: Text(
                   chat["name"] as String,
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight:
                         FontWeight.w600,
                   ),
                 ),


                 subtitle: Text(
                   chat["message"] as String,
                   style: const TextStyle(
                     color: Colors.white60,
                   ),
                   maxLines: 1,
                   overflow:
                       TextOverflow.ellipsis,
                 ),


                 trailing: Column(
                   mainAxisAlignment:
                       MainAxisAlignment.center,
                   children: [
                     Text(
                       chat["time"] as String,
                       style: TextStyle(
                         color:
                             (chat["unread"] as int) > 0
                                 ? accent
                                 : Colors.white54,
                         fontSize: 12,
                       ),
                     ),


                     const SizedBox(height: 5),


                     if ((chat["unread"] as int) > 0)
                       Container(
                         width: 22,
                         height: 22,
                         decoration:
                             const BoxDecoration(
                           color: accent,
                           shape: BoxShape.circle,
                         ),
                         child: Center(
                           child: Text(
                             chat["unread"]
                                 .toString(),
                             style:
                                 const TextStyle(
                               color:
                                   Colors.black,
                               fontWeight:
                                   FontWeight
                                       .bold,
                               fontSize: 11,
                             ),
                           ),
                         ),
                       ),
                   ],
                 ),


                 onTap: () {
                   // Navigate to ConversationScreen
                 },
               );
             },
           ),
         ),
       ],
     ),
   );
 }
}
