module DecisionSupport
  module Common
    class Api401ErrorResponse < Dry::Validation::Contract
      params do
        required(:status).value(eql?: 401)
        required(:message).filled(:string)
        optional(:errors)
      end
    end
  end
end

