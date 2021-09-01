class ReportsController < ApplicationController

  #GET RENDER
  def new
    flash.discard
  end
  #POST
  def send_report
    # for now just notify that the message was sent correctly
    flash[:success] = "The message was sent correctly, remember that you will be notified in a period of 1-3 business days"
    redirect_to report_form_path
  end

end
