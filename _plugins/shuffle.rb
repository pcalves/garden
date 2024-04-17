# frozen_string_literal: true

module Jekyll
    module ShuffleFilter
      def shuffle(array)
        array.shuffle
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::ShuffleFilter)