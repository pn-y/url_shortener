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

require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    subject { FactoryBot.create(:link) }
    it { should validate_presence_of(:long_url) }
    it { should validate_presence_of(:short_url) }
    it { should validate_uniqueness_of(:short_url) }
  end

  context 'associations' do
    it { should have_many(:visits)}
  end
end
