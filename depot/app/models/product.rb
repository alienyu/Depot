class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  default_scope :order => 'title'

  validates :description, :image_url, :title, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
            :with => %r{\.(gif|jpg|png)$},
            :message => 'must be a URL for GIF, PNG, JPG image'
  }
end
