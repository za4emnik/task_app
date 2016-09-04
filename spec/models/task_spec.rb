require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { build :task }
   describe 'validations' do
     it { is_expected.to validate_presence_of :name   }
     it { should validate_inclusion_of(:status).
      in_array(['new', 'in_process', 'done']) }
   end

   describe 'associations' do
     it { is_expected.to belong_to :project }
  end
end
