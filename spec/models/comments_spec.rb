require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment model methods' do
    post = Post.new(title: 'post_test', text: 'this is post test', likes_counter: 8)
    subject do
      Comment.new
    end

    before { subject.save }

    it 'title presence' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    describe 'comments model method' do
      it 'should update comments count' do
        post.comments_counter = 2
        post.author_id = 5
        subject.post = post
        subject.update_post_comments_counter
        expect(subject.post.comments_counter).to eq 3
      end
    end
  end
end
