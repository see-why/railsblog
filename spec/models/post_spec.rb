require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post model validations' do
    subject do
      Post.new
    end

    before { subject.save }

    it 'title presence' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not exceed 250 char' do
      subject.title = 'batman' * 251
      expect(subject).to_not be_valid
    end

    it 'comments counter should be integer ' do
      subject.comments_counter = 100.0
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater or equal to 0 ' do
      subject.comments_counter = -15
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be integer ' do
      subject.likes_counter = 133.7
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be greater or equal to 0 ' do
      subject.likes_counter = -12
      expect(subject).to_not be_valid
    end

    it 'fails to update posts_counter of author' do
      subject.author = User.new(name: 'Bruce Wayne', photo: 'image', bio: Faker::Lorem.paragraph, posts_counter: 0)
      subject.update_user_posts_counter
      expect(subject.author.posts_counter).to eq(1)
    end

    describe 'post model method' do
      before { 10.times { |_comment| Comment.create(post_id: subject.id) } }

      it 'rencent comments should be 3' do
        expect(subject.most_recent_comments).to eq(subject.comments.last(3))
      end
    end
  end
end