## Self-made store on laravel

### Currencies

The site has the ability to specify the price of the product in 1 of the installed currencies, when displaying the product on the site, the price
is converted to the default currency or the one selected by the user

### Cart

A session is used to store the user's cart

**Session data format**

```
[
    "uiid" => [
        "product_id" => product_id
        "attributes" => [ attribute_id => value_id ]
        "count" => count
    ]
]
```

#### Example

```
[
    "13c7047f-7ebd-43b3-a0a0-29b71faefcca" => [
        "product_id" => 7
        "attributes" => []
     "count" => 2
    ]
    "e16edc37-242c-4d48-817e-60129e053242" => [
        "product_id" => 10
        "attributes" => [ 4 => 25 ]
        "count" => 1
    ]
]
```

### Telegram bot

The application provides for work with 2 telegram bots

- The bot-shop displays product categories and the products themselves, as well as contacts and information about delivery and payment (takes
  information from the fields in the settings).
- Bot for informing the Admin about new orders.

To register bots, you will need to run the command "php artisan telegraph:new-bot" and then enter the bot token

**You also need to specify bot tokens in .env**

- TELEGRAM_MAIN_BOT_TOKEN="bot:token"
- TELEGRAM_ORDERS_BOT_TOKEN="bot:token"

### New mail

The cart has a search for a New mail branch. First, in the 1st field, the user enters the name of the settlement,
when the user has entered 3 or more characters, an ajax request is sent to the backend and then a request to the New mail API, where a search for a suitable settlement is performed. The options are returned to the form as a drop-down list (the user
needs to select their settlement)
After the user selects a settlement, an ajax request is sent to the backend (where we receive a list of branches from
our database in the selected settlement) and a drop-down list of branches in the selected locality.

### CRON

- Exchange rate update https://you-site.com/update-currencies (it is recommended to call every day, updated
  from https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5 )
- Nova Poshta update areas https://you-site.com/np/update?type=areas (Updates areas, you need to call 1 time when starting the application )
- Nova Poshta update areas https://you-site.com/np/update?type=districts (Updates districts, but to update
  all districts, 1 run may not be enough, call several times when starting the application )
- Nova Poshta update areas https://you-site.com/np/update?type=settlements (Updates settlements,
  it is advisable to call with a frequency of 5 minutes at night )
- Nova Poshta update areas https://you-site.com/np/update?type=offices ( Updates departments, call with
  a periodicity of 5 minutes, preferably at night)

### Library bugs

- Problem with displaying thumbnails in the media editor https://github.com/thedevdojo/voyager/issues/5743

- Unable to add BREAD to table with multiple indexes for Voyager 1.8 https://github.com/thedevdojo/voyager/issues/5936

- Relationship problem for Voyager 1.8 /vendor/tcg/voyager/resources/views/tools/bread/edit-add.blade.php line ~625
