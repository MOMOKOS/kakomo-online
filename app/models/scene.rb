class Scene < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'とにかく盛り上がりたい！' },
    { id: 3, name: 'じっくりお酒を交わしたい' },
    { id: 4, name: 'お祝いに花を添えたい' },
    { id: 5, name: '新しいおつまみを発見したい' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :foods
end
