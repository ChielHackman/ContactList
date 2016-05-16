class FriendsController < ApplicationController
  def create
   contact = Contact.find_by_name( params[:contact_id] )
    if friend = Friend.find_by( contact: contact, user: current_user )
       friend.destroy
    else friend = Friend.new( contact: contact, user: current_user )
         friend.save
    end

   redirect_to root_path
 end
end
