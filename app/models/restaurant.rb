# == Schema Information
#
# Table name: restaurants
#
#  id          :bigint           not null, primary key
#  address     :string
#  city        :string
#  description :text
#  name        :string
#  photo_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many :tables
  include PgSearch::Model
  pg_search_scope :search_by_title, against: :title
end
