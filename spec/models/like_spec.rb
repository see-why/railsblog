require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new
  post = Post.new(title: 'post_test', text: 'this is post test', author: user)
  subject do
    Like.new
  end

  before { subject.save }
  describe 'likes model method' do
    it 'should update likes count' do
      post.likes_counter = 2
      subject.post = post
      subject.update_post_likes_counter
      expect(subject.post.likes_counter).to eq 3
    end
  end
end
