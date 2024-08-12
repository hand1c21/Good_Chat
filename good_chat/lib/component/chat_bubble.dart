import 'package:flutter/material.dart';
import 'package:good_chat/theme/light_mode.dart';
import 'package:good_chat/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget{
  // ThemeData _themeData=lightMode;
  // ThemeData get ThemeData=>ThemeData

  final String message ;
  final bool isCurrentUser;

  const ChatBubble({required this.message,required this.isCurrentUser,});

  Widget build(BuildContext context){
    bool isDarkMode=Provider.of<ThemeProvider>(context,listen: false).isDarkMode;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 25),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(12),
        color: isCurrentUser
        ?(isDarkMode?Colors.green.shade600:Colors.green.shade600)
        :(isDarkMode?Colors.grey.shade900:Colors.grey.shade200)
         ),
         child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white : (isDarkMode ? Colors. white : Colors.black)
        ),
      ),
    );
  }
}