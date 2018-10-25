class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookmarks, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark 

  def liked(bookmark)
    if bookmark
      likes.where(bookmark_id: bookmark.id).first
    end
  end
end
