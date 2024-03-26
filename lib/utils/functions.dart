import 'package:flutter/widgets.dart';
import 'package:front_scaffold_flutter/utils/extensions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

DateTime parseStringToDateTime(String date) {
  List<String> dateParts = date.split('-');

  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);

  DateTime dateParsed = DateTime(year, month, day);

  return dateParsed;
}

String formatValidationMessage(
    String key, List<String> dynamicValues, BuildContext context) {
  String message = context.translate(key);
  dynamicValues.asMap().forEach((index, value) {
    message = message.replaceAll('%$index', value);
  });
  return message;
}

void insertItemsInList<T>({
  required PagingController<int, T> pagingController,
  required List<T> items,
  required int skip,
  required int limit,
  required int total,
}) {
  final fetchedItemsCount = pagingController.itemList?.length ?? 0;
  final bool isLastPage = fetchedItemsCount >= total || items.isEmpty;

  if (isLastPage) {
    pagingController.appendLastPage(items);
  } else {
    final nextPageKey = (skip + limit).toInt();
    pagingController.appendPage(items, nextPageKey);
  }
}

Map<String, dynamic> serializerQueryParams(Map<String, dynamic>? queryParams) {
  Map<String, dynamic> validatedParams = {};
  if (queryParams != null) {
    queryParams.forEach((key, value) {
      if (value != null && value.toString().trim().isNotEmpty) {
        validatedParams[key] = value;
      }
    });
  }
  return validatedParams;
}
