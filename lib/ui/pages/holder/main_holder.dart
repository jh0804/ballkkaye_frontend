import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/game_center_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHolder extends StatefulWidget {
  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int selectedIndex = 2;
  List<int> loadPages = [2];

  void selectedBottomMenu(int index) {
    if (!loadPages.contains(index)) {
      loadPages.add(index);
    }

    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex, // 변수가 되어야 한다. -> 상태로 등록
        children: [
          // rebuild에 의해 앞 번호의 화면들이 new 되는 문제 아직 존재.
          loadPages.contains(0) ? const GameCenterPage() : Container(),
          loadPages.contains(1) ? const VisitRecordListPage() : Container(),
          loadPages.contains(2) ? const HomePage() : Container(),
          loadPages.contains(3) ? const ChatRoomListPage() : Container(),
          loadPages.contains(4) ? const UserMatchListPage() : Container(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      currentIndex: selectedIndex,
      onTap: selectedBottomMenu,
      items: [
        BottomNavigationBarItem(
          label: "예측",
          icon: Icon(CupertinoIcons.check_mark_circled),
        ),
        BottomNavigationBarItem(
          label: "직관기록",
          icon: Icon(CupertinoIcons.book),
        ),
        BottomNavigationBarItem(
          label: "홈",
          icon: Icon(CupertinoIcons.home),
        ),
        BottomNavigationBarItem(
          label: "채팅",
          icon: Icon(CupertinoIcons.chat_bubble),
        ),
        BottomNavigationBarItem(
          label: "동행",
          icon: Icon(CupertinoIcons.person_2),
        ),
      ],
    );
  }
}