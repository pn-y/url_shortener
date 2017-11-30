# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  has_many :visits

  def as_json(options={})
    { long_url: long_url, short_url: short_url }
  end
end
