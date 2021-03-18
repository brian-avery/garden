# https://talk.jekyllrb.com/t/is-a-generator-for-creating-tag-pages-from-collections-possible/3820/4
module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      tags = site.documents.flat_map { |post| post.data['tags'] || [] }.to_set
      tags.each do |tag|
        site.pages << TagPage.new(site, site.source, tag)
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      substitutedTag=tag
      substitutedTag=substitutedTag.gsub(" ", "-")
      @dir  = File.join('tag', substitutedTag)
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['title'] = "Tag: #{tag}"
    end
  end
end
