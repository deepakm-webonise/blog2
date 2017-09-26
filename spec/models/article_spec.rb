# spec/models/article_spec.rb
require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'has a valid factory' do
    expect(Article.create).to be_valid
  end
  it 'is invalid without a title' do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end
  it 'is invalid without a text'
  it "returns a contact's full name as a string"
end
