require "spec_helper"

describe Article do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe "associations"  do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "returns the article title" do
      # создаем объект article
      article = create(:article, title: 'Lorem ipsum')

      # assert, проверка
      expect(article.subject).to eq 'Lorem ipsum'
    end
  end

  describe "#last_comment" do
    it "return the last comment" do
      # создаем статью с комментариями
      article = create(:article_with_comments)

      # проверка
      expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end