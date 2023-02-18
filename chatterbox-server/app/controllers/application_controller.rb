class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
#   # Add routes
#   GET /messages: returns an array of all messages as JSON, ordered by created_at in ascending order.
  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end
# POST /messages: creates a new message with a body and username from params, and returns the newly created post as JSON.
  post '/messages' do
    new_post = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_post.to_json
  end
# PATCH /messages/:id: updates the body of the message using params, and returns the updated message as JSON.
  patch '/messages/:id' do
    # find the message we want to update
    message = Message.find(params[:id])
    # update the targeted message
    message.update(
      body: params[:body]
    )
    message.to_json
  end
# DELETE /messages/:id: deletes the message from the database.
  delete '/messages/:id' do
    # find the target
    message = Message.find(params[:id])
    # destroy
    message.destroy
    message.to_json
  end
end
