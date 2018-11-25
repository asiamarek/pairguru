require "rails_helper"

describe MoviesHelper do
  describe "#not_commented_by_user?" do
    subject { not_commented_by_user?(user.id, movie.id) }
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }

    context "movie has not been commented by user" do
      it { is_expected.to be true }
    end

    context "movie has been commented by user" do
      let!(:comment) { create(:comment, user_id: user.id, movie_id: movie.id) }
      it { is_expected.to be false }
    end
  end
end
