class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :hometown, :beer, :skill, :password, :password_confirmation, :remember_me
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  
  has_many :participations
  has_many :events, :through => :participations
  
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  has_attached_file :gravatar,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "dansbeerlist/:id/:basename.:extension"
    
    def following?(followed)
      relationships.find_by_followed_id(followed)
    end

    def follow!(followed)
      relationships.create!(:followed_id => followed.id)
    end

    def unfollow!(followed)
      relationships.find_by_followed_id(followed).destroy
    end

    def feed
     Micropost.from_users_followed_by(self)
    end
    
    
end
