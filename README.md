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
Get the latest code and migrate the database:

```ruby
rake db:migrate
```

Create the user (either through the console or the web interface)

Open the rails console and add the admin role to the user:

```ruby
user = User.find(1)
user.add_role :admin
```
(Coming soon) Change the config files to point to your Bitcoin and Litecoin daemons

All done! Start adding categories and products!

TODO
-----
The following is listed in order of priority:

- Integrate the daemon calls with the wallet
- Create an order page
- Link the order to the user's account
- Add test cases for everything completed until this point
- Add an admin interface
- Integrate with PayPal