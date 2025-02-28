/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:chatview2/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class MessageTimeWidget extends StatelessWidget {
  const MessageTimeWidget({
    Key? key,
    required this.messageTime,
    required this.isCurrentUser,
    this.messageTimeTextStyle,
    this.messageTimeIconColor,
  }) : super(key: key);

  /// Provides message crated date time.
  final DateTime messageTime;

  /// Represents message is sending by current user.
  final bool isCurrentUser;

  /// Provides text style of message created time view.
  final TextStyle? messageTimeTextStyle;

  /// Provides color of icon which is showed when user swipe whole chat for
  /// seeing message sending time
  final Color? messageTimeIconColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: messageTimeIconColor ?? Colors.black,
                ),
              ),
              child: Icon(
                isCurrentUser ? Icons.arrow_forward : Icons.arrow_back,
                size: 10,
                color: messageTimeIconColor ?? Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              messageTime.getTimeFromDateTime,
              style: messageTimeTextStyle ?? const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
