module Slugifiable

    def slug
        self.name.gsub(/\W+/, '-').downcase
    end

    def find_by_slug(slug)
        self.all.find {|item| item.slug == slug}
    end

end