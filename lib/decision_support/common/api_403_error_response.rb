module DecisionSupport
  module Common
    class Api403ErrorResponse < Dry::Validation::Contract
      params do
        required(:status).value(eql?: 403)
        required(:message).filled(:string)
        optional(:errors)
      end
    end
  end
end

