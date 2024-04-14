import frontmatter
import glob
import os

POST_DIR = '_notes/'
TAG_DIR = '_tags/'

# Collect all tags from all posts.
all_tags = []
for fname in glob.glob(POST_DIR + '**/*.md', recursive=True):
  with open(fname, 'r') as f:
    note = frontmatter.load(f)
  all_tags += note['tags']

all_tags = sorted(list(set(all_tags)))
# Remove old tag pages
old_tags = glob.glob(TAG_DIR + '*.md')
for tag in old_tags:
  os.remove(tag)

# Create tag directory if it does not exist
if not os.path.exists(TAG_DIR):
  os.makedirs(TAG_DIR)

# Write new tag pages.
TAG_PAGE_TEMPLATE = '''---
layout: tag
tag: {tag}
robots: noindex
---'''
for tag in all_tags:
  with open(TAG_DIR + tag + '.md', 'a') as f:
    f.write(TAG_PAGE_TEMPLATE.format(tag=tag))