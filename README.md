# Discount at purchase exercise

Add items to a cart and apply the promotions to the selected items.

## Product sample

<table>
  <thead>
    <tr>
      <th>Product code</th>
      <th>Name</th> 
      <th>Price</th>
    </tr>
  </thead>  
  <tbody>
    <tr>
      <td>001</td>
      <td>Travel Card Holder</td> 
      <td>9.25</td>
    </tr>
    <tr>
      <td>002</td>
      <td>Personalized cufflinks</td> 
      <td>45</td>
    </tr>
    <tr>
      <td>003</td>
      <td>Kids T-shirt</td> 
      <td>19.95</td>
    </tr>
  </tbody>  
</table>

## Rules

* In case of two or more items with the given product code change price to the given value
* If the total is greater than x reduce the total by y percent

## Instalation

* clone the project
* install ruby 2.3.1 or a newer version (if you don't have it installed already)
* run bundle install

## Testing

* run bundle exec rspec

## Scanning 
```ruby
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```
