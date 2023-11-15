Account.destroy_all

User.create(account_type: 'User', username: 'user1', password: 'password1', balance: 1000)
User.create(account_type: 'User', username: 'user2', password: 'password2', balance: 1500)

Stock.create(account_type: 'Stock', username: 'SSI', password: 'password_stock_s', balance: 5000)
Stock.create(account_type: 'Stock', username: 'HPG', password: 'password_stock_h', balance: 3000)

Team.create(account_type: 'Team', username: 'Team1', password: 'password_team1', balance: 2000)
Team.create(account_type: 'Team', username: 'Team2', password: 'password_team2', balance: 2500)
