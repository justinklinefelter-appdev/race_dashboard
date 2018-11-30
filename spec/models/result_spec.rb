require 'rails_helper'

RSpec.describe Result, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:race) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
