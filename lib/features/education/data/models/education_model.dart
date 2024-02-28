import 'package:education_list/features/education/domain/entities/eduation_entity.dart';

class EducationModel extends EducationEntity {
  const EducationModel({
    required int id,
    required bool isPremiumContent,
    String? contentFormat,
    String? name,
    String? slug,
    String? shortContent,
    String? publishedAt,
    String? publishedAtDetail,
    String? image,
    String? thumbnail,
    String? seoTitle,
    String? seoDescription,
    String? seoKeyword,
    String? seoSlug,
    String? seoImageUrl,
    String? category,
    String? categoryIcon,
    String? videoDuration,
  }) : super(
    id: id,
    isPremiumContent: isPremiumContent,
    contentFormat: contentFormat,
    name: name,
    slug: slug,
    shortContent: shortContent,
    publishedAt: publishedAt,
    publishedAtDetail: publishedAtDetail,
    image: image,
    thumbnail: thumbnail,
    seoTitle: seoTitle,
    seoDescription: seoDescription,
    seoKeyword: seoKeyword,
    seoSlug: seoSlug,
    seoImageUrl: seoImageUrl,
    category: category,
    categoryIcon: categoryIcon,
    videoDuration: videoDuration
  );

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json["id"] as int,
      isPremiumContent: json["is_premium_content"] as bool,
      contentFormat: json["content_format"] as String?,
      name: json["name"] as String?,
      slug: json["slug"] as String?,
      shortContent: json["short_content"] as String?,
      publishedAt: json["published_at"] as String?,
      publishedAtDetail: json["published_at_detail"] as String?,
      image: json["image"] as String?,
      thumbnail: json["thumbnail"] as String?,
      seoTitle: json["seo_title"] as String?,
      seoDescription: json["seo_description"] as String?,
      seoKeyword: json["seo_keyword"] as String?,
      seoSlug: json["seo_slug"] as String?,
      seoImageUrl: json["seo_image_url"] as String?,
      category: json["category"] as String?,
      categoryIcon: json["category_icon"] as String?,
      videoDuration: json["video_duration"] as String?
    );
  }
}