class Help < ActiveRecord::Base
    validates_presence_of :title
    validates :anchor_id, format: { with: /\A[a-zA-Z_]+\z/, message: "Please only use letters and underscores." }
    validates_presence_of :category
    validates_uniqueness_of :title
end