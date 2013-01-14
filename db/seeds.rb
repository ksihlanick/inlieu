# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.find_by_email("kevin@inlieugiving.net")

  unless @user
    @user = User.create do |u|
    u.name = "Kevin Sihlanick"
    u.email = "kevin@inlieugiving.net"
    u.password_digest = "$2a$10$3PtGPjueYFXd/TsSEnvNi.qF.lShdysqz/uRlVmHJ5NWOksgmVMqy"
    u.admin = true
  end

  @user.save(:validate => false)

end