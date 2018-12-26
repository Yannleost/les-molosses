class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message. Nous le traiterons dans les meilleurs délais !'
    else
      flash.now[:error] = 'Nous ne parvenons pas à envoyr votre message.'
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
