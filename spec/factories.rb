FactoryGirl.define do
  sequence :name do |n|
    "name#{n}"
  end

  sequence :id_name do |n|
    "id_name#{n}"
  end

  sequence :password do |n|
    "password#{n}"
  end
end
