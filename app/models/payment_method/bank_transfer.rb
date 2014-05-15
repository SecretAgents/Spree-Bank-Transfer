class PaymentMethod::BankTransfer < Spree::PaymentMethod

  def payment_profiles_supported?
    false
  end

  def actions
    %w{capture void}
  end

  # Indicates whether its possible to capture the payment
  def can_capture?(payment)
    ['invoice'].include?(payment.state)
  end
  
  # Indicates whether its possible to void the payment.
  def can_void?(payment)
    payment.state != 'void'
  end
  
  def capture(*args)
    ActiveMerchant::Billing::Response.new(true, "", {}, {})
  end
  
  def void(*args)
    ActiveMerchant::Billing::Response.new(true, "", {}, {})
  end
  
  def source_required?
    false
  end

end

