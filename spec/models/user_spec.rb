require "rails_helper"

describe User do
  it { is_expected.to allow_value("+48 999 888 777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("aaa +48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 999 888 777\naseasd").for(:phone_number) }

  describe "#top_commenters" do
    subject { described_class.top_commenters }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    let(:movie1) { create(:movie) }
    let(:movie2) { create(:movie) }

    context "there are no comments" do
      it { is_expected.to be_empty }
    end

    context "there are comments" do
      let!(:comment1) { create(:comment, user_id: user1.id, movie_id: movie1.id) }
      let!(:comment2) { create(:comment, user_id: user1.id, movie_id: movie2.id) }
      let!(:comment3) { create(:comment, user_id: user2.id, movie_id: movie2.id) }

      context "there are only new comments" do
        it { is_expected.to eq [user1, user2] }
      end

      context "there are some old comments" do
        let!(:old_comment1) do
          create(:comment, user_id: user3.id,
                           movie_id: movie2.id,
                           created_at: 8.days.ago)
        end

        it { is_expected.to eq [user1, user2] }
      end
    end
  end
end
