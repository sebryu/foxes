class Fox < ActiveRecord::Base
  belongs_to :user

  def adopt user
    self.user = user
    self.save
  end

  def unadopted
    self.user = nil
    self.save
  end
end
