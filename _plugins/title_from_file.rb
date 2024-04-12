# frozen_string_literal: true

class TitleFromFileGenerator < Jekyll::Generator
  def generate(site)
    all_notes = site.collections['notes'].docs

    all_notes.each do |note|
      note.data['title'] = note.basename_without_ext
    end
  end
end