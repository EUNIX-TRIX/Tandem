require 'test_helper'

class TweetTest < ActiveSupport::TestCase
 test "should be valid" do
    assert @tweet.valid?
  end

  test "user id should be present" do
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end
  test "content should be present" do
      @tweet.content = " "
      assert_not @tweet.valid?
  end
  test "content should be at most 100 characters" do
      @tweet.content = "a" * 101
      assert_not @tweet.valid?
  end
  test "order should be most recent first" do
      assert_equal tweets(:most_recent), Tweet.first
  end
end
