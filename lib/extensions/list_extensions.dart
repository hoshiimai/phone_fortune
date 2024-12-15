import 'package:get/get.dart';
import 'package:callmobile/core/model/enum/order_by.dart';
import 'package:callmobile/core/model/response/model/user.dart';

extension CreatorListExtension on List<User>? {
  void sortByRating({required bool isAscending}) {
    return this?.sort((creator1, creator2) => isAscending
        ? (creator1.averageRating ?? 0).compareTo(creator2.averageRating ?? 0)
        : (creator2.averageRating ?? 0).compareTo(creator1.averageRating ?? 0));
  }

  void sortByFavorite({required bool isAscending}) {
    return this?.sort((creator1, creator2) => isAscending
        ? (creator1.likeCount ?? 0).compareTo(creator2.likeCount ?? 0)
        : (creator2.likeCount ?? 0).compareTo(creator1.likeCount ?? 0));
  }

  void sortByPointConsumption({required bool isAscending}) {
    // TODO: sort by point consumption
    return this?.sort((creator1, creator2) => isAscending
        ? (creator1.callFeePerTiming ?? 0).compareTo(creator2.callFeePerTiming ?? 0)
        : (creator2.callFeePerTiming ?? 0).compareTo(creator1.callFeePerTiming ?? 0));
  }

  void sortBy({required OrderBy sortBy, required bool isAscending}) {
    switch (sortBy) {
      case OrderBy.star:
        {
          sortByRating(isAscending: isAscending);
          break;
        }
      case OrderBy.favorite:
        {
          sortByFavorite(isAscending: isAscending);
          break;
        }
      case OrderBy.point:
        {
          sortByPointConsumption(isAscending: isAscending);
          break;
        }
    }
  }

  void removeCreator(User creatorToRemove) {
    return this?.removeWhere((creator) => creator.id == creatorToRemove.id);
  }

  List<User>? removeCreatorAndSort(User creator, {required OrderBy sortBy}) {
    return this?.toList()
      ..removeCreator(creator)
      ..sortBy(sortBy: sortBy, isAscending: false);
  }

  List<User>? addCreatorAndSort(
    User creator, {
    required OrderBy sortBy,
    bool checkLiked = false,
    bool checkManagedByAgent = false,
  }) {
    final newCreators = this?.toList();
    if (this?.firstWhereOrNull((e) => e.id == creator.id) != null) {
      return this;
    }
    if (newCreators?.firstWhereOrNull((e) => e.id == creator.id) == null &&
        (checkLiked ? creator.isLikedCreator() : true) &&
        (checkManagedByAgent ? creator.isManagedByThisAgent : true)) {
      newCreators?.add(creator);
    }
    return newCreators..sortBy(sortBy: sortBy, isAscending: false);
  }
}
