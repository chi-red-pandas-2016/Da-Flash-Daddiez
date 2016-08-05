class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck
  has_many :guesses, through: :cards

  def shuffle
    @cards = self.cards.to_a.shuffle
  end

  # def show_card
  #   @cards[0].question
  # end

  def compare_answer(card, user_answer)
    card.answer.downcase == user_answer.downcase
  end


  # if check_answer(user_answer)

  # # def correct?
  # end

end
