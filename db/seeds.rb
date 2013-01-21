# Create Admin
admin = User.new \
  email: 'admin@example.com', password: 'admin', password_confirmation: 'admin'
admin.save validate: false
