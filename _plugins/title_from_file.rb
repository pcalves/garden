# frozen_string_literal: true

class Jekyll::Document
  def populate_title
    data["title"] ||= basename_without_ext
  end
end