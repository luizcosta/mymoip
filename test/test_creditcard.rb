require 'helper'

class TestCreditCard < Test::Unit::TestCase

  def test_initialization_and_setters
    subject = MyMoip::CreditCard.new(
      logo: :visa,
      card_number: "4916654211627608",
      expiration_date: "06/15",
      security_code: "000",
      owner_name: "Juquinha da Rocha",
      owner_birthday: Date.new(1984, 11, 3),
      owner_phone: "(51)3040-5060",
      owner_rg: "1010202030"
    )

    assert_equal :visa, subject.logo
    assert_equal "4916654211627608", subject.card_number
    assert_equal "06/15", subject.expiration_date
    assert_equal "000", subject.security_code
    assert_equal "Juquinha da Rocha", subject.owner_name
    assert_equal Date.new(1984, 11, 3), subject.owner_birthday
    assert_equal "(51)3040-5060", subject.owner_phone
    assert_equal "1010202030", subject.owner_rg
  end

end
