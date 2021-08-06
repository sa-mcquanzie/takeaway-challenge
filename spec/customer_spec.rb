require 'customer'

describe Customer do
  subject { Customer.new('07700900000') }

  it { is_expected.to respond_to :cart }
  it { is_expected.to respond_to :phone_number }
end
