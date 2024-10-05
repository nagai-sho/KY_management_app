class RiskLevel < ActiveHash::Base
  self.data = [
    {id: 0, name: '---' },
    {id: 1, name: '1. 軽度' },
    {id: 2, name: '2. 中度' },
    {id: 3, name: '3. 重度' },
    {id: 4, name: '4. 致命的' },
  ]

  include ActiveHash::Associations
  has_many :ky_sheets
end