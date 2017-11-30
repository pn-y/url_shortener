# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  link_id    :integer          not null
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country    :string
#

FactoryBot.define do
  factory :visit do
    link
    ip '127.0.0.1'
  end
end
