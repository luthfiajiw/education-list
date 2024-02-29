import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_list/config/theme/palette.dart';
import 'package:education_list/core/resources/string_extension.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EducationTile extends StatelessWidget {
  final EducationEntity entity;

  const EducationTile({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Palette.neutral
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///
          /// CONTAINER
          ///
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${entity.contentFormat!.capitalize()} • ${entity.category}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                    bottom: 8
                  ),
                  child: Text(
                    entity.shortContent!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Text(
                  entity.publishedAt!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          ///
          /// THUMBNAIL
          ///
          Container(
            width: 88,
            height: 88,
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CachedNetworkImage(
                      imageUrl: entity.thumbnail!.isNotEmpty
                      ? entity.thumbnail!
                      : entity.image!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).splashColor.withOpacity(.3),
                          highlightColor: Colors.white10,
                          child: Container(
                            width: 88,
                            height: 88,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              
                  /// OVERLAY VIDEO
                  if (entity.contentFormat == 'video') Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 32.8,
                            width: 32.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)
                            ),
                          ),
                          Icon(
                            Icons.play_circle_rounded,
                            size: 40,
                            color: Colors.black.withOpacity(.70),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}