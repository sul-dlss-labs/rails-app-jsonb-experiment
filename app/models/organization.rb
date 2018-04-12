class Organization < ApplicationRecord
  scope :universities, -> do
    where("data ->> 'type' = :type", type: 'ROOT')
  end

  scope :schools, -> do
    where("data ->> 'type' = :type", type: 'SCHOOL')
  end

  scope :divisions, -> do
    where("data ->> 'type' = :type", type: 'DIVISION')
  end

  scope :subdivisions, -> do
    where("data ->> 'type' = :type", type: 'SUB_DIVISION')
  end

  scope :departments, -> do
    where("data ->> 'type' = :type", type: 'DEPARTMENT')
  end

  def parent
    self.class.where("data ->> 'id' = :parent_id", parent_id: data['parent']).first
  end

  def children
    self.class.where("data ->> 'parent' = :parent_id", parent_id: data['id'])
  end
end
