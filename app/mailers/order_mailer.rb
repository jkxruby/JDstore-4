class OrderMailer < ApplicationMailer

def notify_order_placed(order)
  @order = order
  @user = order.user
  @product_lists = @order.product_lists
  mail(to: @user.email, subject: "[JDstore]谢谢你完成本次下单，这是您的购物明细#{order.token}")
end
end
