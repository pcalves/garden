# frozen_string_literal: true
class CamelCaseTagTitleGenerator < Jekyll::Generator
  def generate(site)
    all_tags = site.collections['tags'].docs

    all_tags.each do |tag|
      title_from_filename = tag.basename_without_ext
       .split("-").map(&:capitalize).join(" ")
       .gsub('Rss', 'RSS')
       .gsub('Drm', 'DRM')
       .gsub('Pkm', 'PKM')
       .gsub('Vc', 'VC')
        tag.data['title'] = title_from_filename
    end
  end
end