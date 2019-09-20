class Article < ApplicationRecord

    enum status:{ created: 0,completed: 1,published: 2,recomposed: 3,republished: 4,unpublished: 5,rejected: 6}

    validates :status, inclusion: { in: %w(created completed published recomposed republished unpublished rejected),
            message: "%{value} is not a valid article_type" }

            # has_many :medias, as: :mediable
            # has_one :thumbnail, as: :thumbnailable
            # has_many :comments, as: :commentable

end
