import 'package:flutter/material.dart';

import '../../../core/theme/typography_theme.dart';
import '../../../models/genre_model.dart';

class GenreWidget extends StatelessWidget {
  final List<GenreModel>? genres;
  final bool isSelected;
  const GenreWidget({
    super.key,
    required this.genres,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: genres?.length,
              itemBuilder: (context, index) {
                GenreModel genre = genres![index];
                return Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          genre.name!,
                          style: categoryHomeStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: isSelected,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: const Divider(
                              thickness: 2.5,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
