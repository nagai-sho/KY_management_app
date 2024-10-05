class ConstructionType < ActiveHash::Base
  self.data = [
    {id: 0, name: '---' },
    {id: 1, name: '土木工事' },
    {id: 2, name: '建築工事' },
    {id: 3, name: '内装工事' },
    {id: 4, name: '電気工事' },
    {id: 5, name: '空調衛生工事' },
    {id: 6, name: '防災設備工事' },
    {id: 7, name: '通信設備工事' },
    {id: 8, name: '鋼構造物工事' },
    {id: 9, name: '解体工事' },
  ]

  include ActiveHash::Associations
  has_many :ky_sheets
end
