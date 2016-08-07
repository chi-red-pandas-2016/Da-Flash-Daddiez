get '/decks/:deck_id/cards/:card_id' do
  if session[:user_id] == nil
    redirect '/login'
  end
  session[:card_array] = []
  if session[:card_array].empty?
    @user = User.find(session[:user_id])
    @round = Round.create(user_id: @user.id, deck_id: params[:deck_id])
    session[:card_array] = @round.cards.shuffle
    @card = Card.find(params[:card_id])
  else
    @card = Card.find(session[:card_array][0])
  end
  erb :'/cards/show'
end

post '/cards/:card_id/guesses' do

  @card = Card.find(params[:card_id])
  @round = Round.last  #doesn't work if more than one person are playing :(
  @user = User.find(session[:user_id])
  deck = Deck.find(@card.deck_id)

  if @round.answer_is_true(@card, params[:answer])
    @guess = Guess.create(correct: 1, card_id: @card.id, user_id: @user.id, round_id: @round.id)
  else
    @guess = Guess.create(card_id: @card.id, user_id: @user.id, round_id: @round.id)
  end

  if session[:card_array].length == @round.cards.length
    session[:card_array].delete_if{|card| card.id == 1}
  else
    session[:card_array].shift
  end

  if session[:card_array].empty?
   redirect "/rounds/#{@round.id}/users/#{@user.id}"
  else
    card = session[:card_array][0].id
    redirect "/decks/#{deck.id}/cards/#{card}"
  end

end