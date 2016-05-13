class FavouritesController < ApplicationController

  def create
   contact = Contact.find_by_name( params[:contact_id] )
    if favourite = Favourite.find_by( contact: contact, user: current_user )
       favourite.destroy
    else favourite = Favourite.new( contact: contact, user: current_user )
         favourite.save
    end

   redirect_to root_path
 end

end
