module MyMoip
  class CreditCardPayment
    attr_accessor :credit_card, :tranches

    def initialize(credit_card, tranches = 1)
      @credit_card, @tranches = credit_card, tranches
    end

    def to_json
      raise "No CreditCard provided" if credit_card.nil?

      json = {
        Forma:        "CartaoCredito",
        Parcelas:     @tranches,
        CartaoCredito: {
          Numero:           credit_card.card_number,
          Expiracao:        credit_card.expiration_date,
          CodigoSeguranca:  credit_card.security_code,
          Portador: {
            Nome:           credit_card.owner_name,
            DataNascimento: credit_card.owner_birthday.strftime("%d/%m/%Y"),
            Telefone:       credit_card.owner_phone,
            Identidade:     credit_card.owner_rg
          }
        }
      }

      json[:Instituicao] = {
        american_express: "American Express",
        diners:           "Diners",
        hipercard:        "Hipercard",
        mastercard:       "Mastercard",
        visa:             "Visa"
      }.fetch credit_card.logo

      if cash?
        json[:Recebimento] = "AVista"
      end

      json
    end

    def cash?
      @tranches == 1
    end
  end
end
