require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model validations' do
    subject do
      User.new
    end

    before { subject.save }

    it 'name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'bio presence' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'posts counter should be integer ' do
      subject.posts_counter = 15.1
      expect(subject).to_not be_valid
    end

    it 'posts counter should be greater or equal to 0 ' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    describe 'User model method' do
      before { 10.times { |_post| Post.create(author: subject) } }

      it 'rencent posts should be 3' do
        expect(subject.most_recent_posts).to eq(subject.posts.last(3))
      end
    end
  end
end