class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck
  has_many :guesses, through: :cards

  def shuffle
   @shuffled_cards = self.cards.to_a.shuffle
  end

  def answer_is_true(card, user_answer)
    card.answer.downcase == user_answer.downcase
  end

  def score
    # Round.last.guesses.map(&:correct).reduce(:+)
    last_round = self.id
    guesses = Round.last.guesses.to_a.find_all { |guess| guess.round_id == last_round}
    guesses.map(&:correct).reduce(:+)
  end


end
