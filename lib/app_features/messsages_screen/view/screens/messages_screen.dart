import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';


import '../../../../app_core/styles/color.dart';
import '../../../../app_core/widgets/app_bar.dart';
import '../../../../app_core/widgets/bottom_sheet_item.dart';
import '../../../../app_core/widgets/bottom_sheet_savedJob.dart';
import '../../../../app_core/widgets/search_bar.dart';
import '../../model/messageModel.dart';
import '../widgets/message_item.dart';




class MessagesScreen extends StatelessWidget {
   MessagesScreen({Key? key}) : super(key: key);
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Messages", context,leading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomSearchBar(
                    controller: searchController, hintText: 'Search messages....',

                  ),
                ),
                SizedBox(width: 3.w,),
                InkWell(
                  onTap: (){
                    Scaffold.of(context).showBottomSheet<void>(
                          (BuildContext ctx) =>  const CustomBottomSheet(items: [
                        BottomSheetItem('Unread',hasIcon: false,),
                        BottomSheetItem('Spam',hasIcon: false,),
                        BottomSheetItem('Archived',hasIcon: false,),
                      ],
                       isTitled: true,
                       text: 'Message filters',
                          ),
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide( color: AppTheme.neutral3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Icon(Iconsax.setting_4),
                  ),
                ),

              ],
            ),
            SizedBox(height: 3.h,),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) =>
                  MessageItem(messages[index]),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),

          ],
        ),
      ),
    );
  }
}
