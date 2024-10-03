class ConstructionType < ActiveHash::Base
  self.data = [
    {id: 0, name: '---' },
    {id: 1, name: '1. ほぼない' },
    {id: 2, name: '2. たまに起きる' },
    {id: 3, name: '3. 起きやすい' },
  ]

  include ActiveHash::Associations
  has_many :ky_sheets
end