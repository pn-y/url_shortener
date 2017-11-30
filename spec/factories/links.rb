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

FactoryBot.define do
  factory :link do
    long_url 'http://example.com'
    short_url '5aYxsq'
  end
end
