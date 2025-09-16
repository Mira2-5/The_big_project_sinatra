require 'sinatra'
require_relative 'comment'
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }

  # Page d'accueil
  get '/' do
    @gossips = Gossip.all
    erb :index
  end

  # Formulaire de nouveau potin
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Traitement de nouveau potin
  post '/gossips/new/' do
    gossip = Gossip.new(params["gossip_author"], params["gossip_content"])
    gossip.save
    redirect '/'
  end

  # Page d'un potin spécifique
  get '/gossips/:id/' do
    id = params[:id].to_i
    @gossip = Gossip.find(id)
    @id = id
    @comments = Comment.find_by_gossip_id(id)
    erb :show
  end
  
  get '/gossips/:id/edit/' do
  id = params[:id].to_i
  @gossip = Gossip.find(id)
  @id = id
  erb :edit
end

  # Ajouter un commentaire à un potin
  post '/gossips/:id/comments' do
  id = params[:id].to_i
  author = params["comment_author"]
  content = params["comment_content"]
  comment = Comment.new(id, content, author)
  comment.save
  redirect "/gossips/#{id}/"
end

post '/gossips/:id/edit/' do
  id = params[:id].to_i
  Gossip.update(id, params["gossip_author"], params["gossip_content"])
  redirect "/gossips/#{id}/"
end


post '/gossips/:id/delete/' do
  id = params[:id].to_i
  Gossip.delete(id)            # Supprime le potin
  Comment.delete_by_gossip_id(id)  # Supprime tous les commentaires liés
  redirect '/'
end


end
ApplicationController.run! if __FILE__ == $0
