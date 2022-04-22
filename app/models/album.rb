class Album < ApplicationRecord
    validates :title, :description, :cover_image, :all_tags,:images, presence: true
    has_one_attached :cover_image
    has_many_attached :images
    has_and_belongs_to_many :tags
    belongs_to :user

    def all_tags=(names)
        self.tags = names.split(',').map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
    def all_tags
        tags.map(&:name).join(", ")
    end
end
