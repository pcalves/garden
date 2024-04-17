# Filename: __plugins/compile_tags.rb
# Jekyll post_write hook to run the page generator script
# Source: https://gist.github.com/rfong/9e7a9e99a1295deaa58f81548eaf66d6
Jekyll::Hooks.register [:notes], :post_write do
  # system("python3 _plugins/compile_tags.py")
end