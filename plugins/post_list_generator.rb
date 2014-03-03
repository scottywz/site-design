module Jekyll
 class PostList < Page
  def initialize(site, base, dir, type, name)
   @site = site
   @base = base
   @dir = dir
   @name = 'index.html'

   self.process(@name)
   self.read_yaml(File.join(base, site.config["layouts"]), 'post-list.html')

   self.data["title"]     = "#{type.capitalize}: #{name}"
   self.data["menu-text"] = name
   self.data[type]        = name
  end
 end

 class PostListGenerator < Generator
  safe true
  
  def generate(site)
   if site.layouts.key? 'post-list'
    [["category", "categories"], ["tag", "tags"]].each do |type|
     type, plural = *type
     dir = site.config["#{type}-dir"] || plural
     site.send(plural).keys.each do |name|
      site.pages << PostList.new(site, site.source, File.join(dir, name), type, name)
     end
    end
   end
  end
 end
end
