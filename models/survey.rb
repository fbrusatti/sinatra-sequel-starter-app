class Survey < Sequel::Model
    many_to_one :carrer

    one_to_many :responses
end
