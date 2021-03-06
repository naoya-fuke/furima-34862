class RecordAddress
    include ActiveModel::Model
    attr_accessor :user_id, :product_id, :postcode, :prefecture_id, :municipality, :address, :buildingname, :phonenumber, :token

    with_options presence: true do
        validates :user_id
        validates :product_id
        validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
        validates :municipality
        validates :address
        validates :phonenumber, format:{with: /\A[0-9]+\z/, message: "Input only number"}, length: { maximum: 11, message: 'out of range' }
        validates :token
    end

    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    
    def save
        record = Record.create(user_id: user_id, product_id: product_id)
        Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, buildingname: buildingname, phonenumber: phonenumber, record_id: record.id)
    end
end