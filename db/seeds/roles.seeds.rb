ROLES = %i[teacher student]

ROLES.each do |role|
  Role.create(name: role)
end
