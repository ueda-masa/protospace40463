class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :prototypes
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true #, unless: :was_attached?
  validate :image_presence


  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end





  #def was_attached?
    #self.image.attached?
  #end

