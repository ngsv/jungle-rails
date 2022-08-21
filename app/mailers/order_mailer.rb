class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation
    @order = params[:order]
    mail(to: 'gl.steven.ngov@gmail.com', subject: "Order ##{@order.id}")
  end
end
