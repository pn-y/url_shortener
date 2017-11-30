# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  link_id    :integer          not null
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Visit, type: :model do
  context 'validations' do
    it { should validate_presence_of(:link).with_message(:required) }
  end

  context 'associations' do
    it { should belong_to(:link)}
  end
end
