AKart
==============

About
-----
An open source shopping cart that supports cryptocurrencies. Currently, the initial release will support Bitcoins and Litecoins

Warning:
------
THIS IS NOT COMPLETE AND SHOULD NOT BE USED IN A PRODUCTION ENVIRONMENT

Getting Started
-----
1. Get the latest code and migrate the database:

```ruby
rake db:migrate
```

2. Create the user (either through the console or the web interface)

3. Open the rails console and add the admin role to the user:

```ruby
user = User.find(1)
user.add_role :admin
```

4. (Coming soon) Change the config files to point to your Bitcoin and Litecoin daemons

5. All done! Start adding categories and products!

TODO
-----
The following is listed in order of priority:

1. Model the wallets
2. Integrate the daemon calls with the wallet
3. Create an order page
4. Link the order to the user's account
5. Add test cases for everything completed until this point
6. Add an admin interface
7. Integrate with PayPal