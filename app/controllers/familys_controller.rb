class FamilysController < ApplicationController
  def create
   contact = Contact.find_by_name( params[:contact_id] )
    if family = Family.find_by( contact: contact, user: current_user )
       family.destroy
    else family = Family.new( contact: contact, user: current_user )
         family.save
    end

   redirect_to root_path
 end
end
