import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:asakatsu/provider.dart';


class DateTile extends ConsumerStatefulWidget {
  final int colIndex;
  final DateTime date;
  final bool stamp;

  const DateTile({
    super.key,
    required this.colIndex, required this.date, this.stamp = false
  });

  @override
  ConsumerState<DateTile> createState() => _DateTileState();
}

class _DateTileState extends ConsumerState<DateTile> {
  @override
  Widget build(BuildContext context) {
    final calendarDate = ref.watch(calendarDateProvider);
    int rowIndex = widget.date.weekday;
    bool isSameMonth = (widget.date.month == calendarDate.month);

    dateTileColor() {
      switch (rowIndex){
        case 6:
          return isSameMonth ? Color(0xffCCFFFF) : Color(0xffAADDDD);

        case 7:
          return isSameMonth ? Color(0xffFFCCCC) : Color(0xffDDAAAA);

        default:
          return isSameMonth ? Color(0xffFDFDFD) : Color(0xffDADADA);
      }
    }


    return Container(
      color: dateTileColor(),
      child: Container(
        decoration: widget.stamp ? BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 4,
              color: Colors.green
          ),
        ) : null,
        child: Text(
          "${widget.date.day}",
          style: TextStyle(color: (isSameMonth ? Colors.black : Colors.grey)),
        ),
      ),
    );
  }
}

class Calendar extends ConsumerStatefulWidget {
  const Calendar({super.key});

  @override
  ConsumerState<Calendar> createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  @override
  Widget build(BuildContext context) {
    final calendarDate = ref.watch(calendarDateProvider);
    List<List<DateTime>> generateDateList() {
      List<List<DateTime>> weekList = [];

      DateTime std = DateTime(calendarDate.year, calendarDate.month);
      DateTime start = std.add(Duration(days: - (std.weekday % 7 + 1)));

      for(int i = 0; i < 5; i++){
        List<DateTime> dateList = [];
        for(int j = 0; j < 7; j++){
          dateList.add(start.add(Duration(days: (i * 7) + j + 1)));
        }
        weekList.add(dateList);
      }

      return weekList;
    }

    stampFn(DateTime date){
      var now = DateTime.now();
      var diff = date.difference(DateTime(now.year, now.month, now.day)).inDays;
      return -9 <= diff && diff <= 0;
    }

    List<List<DateTime>> dateList = generateDateList();
    return FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.95,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex:1 ,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      var date = ref.read(calendarDateProvider.notifier).state;
                      ref.read(calendarDateProvider.notifier).state = DateTime(date.year, date.month - 1);
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                    child: Container()
                ),
                Expanded(
                  flex: 4,
                  child: Text("${calendarDate.year}年 ${calendarDate.month}月",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                    flex: 2,
                    child: Container()
                ),
                Expanded(
                  flex: 1 ,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      var date = ref.read(calendarDateProvider.notifier).state;
                      ref.read(calendarDateProvider.notifier).state = DateTime(date.year, date.month + 1);
                    },
                  ),
                ),

              ],
            ),
            SizedBox(height: 5),
            Expanded(
                flex: 7,
                child: Container(
                  color: const Color(0xfff5f5f5),
                  alignment: Alignment.center,
                  child:  Column(children: [
                    for (int i = 0; i < 5; i++) ...{
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            for (int j = 0; j < 7; j++) ...{
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: DateTile(
                                          colIndex: i,
                                          stamp: stampFn(dateList[i][j]),
                                          date: dateList[i][j],
                                      ),
                                    ),
                                  ))
                            }
                          ],
                        ),
                      )
                    }
                  ]),
                )),
            SizedBox(height: 10),
          ],
        ));
  }
}
