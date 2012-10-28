module SluggedResource
  def self.included(base)
    base.class_eval do
      validates_presence_of :name, :slug
      validates_uniqueness_of :slug

      before_validation :generate_slug

      def self.find(id)
        where(:slug => id).first!
      end
    end
  end

  def generate_slug
    self.slug ||= name.to_slug.normalize.to_s
  end

  def to_param
    slug
  end

end
