import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorReviewsTab extends StatelessWidget {
  const DoctorReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: _mockReviews.length,
      separatorBuilder:
          (context, index) =>
              Divider(color: ColorsManager.lighterGray, height: 32.h),
      itemBuilder: (context, index) {
        final review = _mockReviews[index];
        return _ReviewCard(review: review);
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final _ReviewData review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: ColorsManager.superLightGray2,
              child: Icon(Icons.person, size: 20.r, color: ColorsManager.gray),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.name, style: TextStyles.font14DarkBlueBold),
                ],
              ),
            ),
            Text(review.date, style: TextStyles.font12GrayMedium),
          ],
        ),
        verticalSpace(8),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color:
                  index < review.rating
                      ? Colors.amber
                      : ColorsManager.lighterGray,
              size: 20.r,
            ),
          ),
        ),
        verticalSpace(8),
        Text(review.comment, style: TextStyles.font14GrayRegular),
      ],
    );
  }
}

class _ReviewData {
  final String name;
  final String date;
  final int rating;
  final String comment;

  const _ReviewData({
    required this.name,
    required this.date,
    required this.rating,
    required this.comment,
  });
}

const List<_ReviewData> _mockReviews = [
  _ReviewData(
    name: 'Jane Cooper',
    date: 'Today',
    rating: 5,
    comment:
        'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
  ),
  _ReviewData(
    name: 'Robert Fox',
    date: 'Today',
    rating: 5,
    comment:
        'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.',
  ),
  _ReviewData(
    name: 'Jacob Jones',
    date: 'Today',
    rating: 5,
    comment:
        'This app makes healthcare so convenient. The interface is clean and easy to use, and the doctors are very professional. I highly recommend it to anyone looking for quality healthcare.',
  ),
];
