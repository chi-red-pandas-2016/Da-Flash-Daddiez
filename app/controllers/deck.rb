get '/decks/:deck_id/cards/:card_id' do
  if session[:round_id] == nil
    @user = User.find(session[:user_id])
    @round = Round.create(user_id: @user.id, deck_id: params[:deck_id])
    session[:round_id] = @round.id
  else
    @round = Round.find(session[:round_id])
    @card = Card.find(params[:card_id])
  end
  erb :'/cards/show'
end

post '/cards/:card_id/guesses' do
  p params.inspect
  p session.inspect
  # card = Card.find(params[:card_id])
  # @round = Round.find(session[:round_id])
  # if @round.compare_answer(card, params[:answer])
  #   erb :sup
  # end
end