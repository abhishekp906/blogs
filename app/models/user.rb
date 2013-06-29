class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :email_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false
  validates_confirmation_of :email, :on => :create
  validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
end
