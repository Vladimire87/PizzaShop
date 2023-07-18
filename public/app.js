function add_to_cart (id) {
  var key = 'product_' + id
  var x = window.localStorage.getItem(key)
  x = x * 1 + 1
  window.localStorage.setItem(key, x)

  console.log('Items in your cart: ' + cart_get_number_of_items())
  console.log('String: ' + cart_get_orders())
  update_orders_input()
  update_orders_badge()
}

function cart_get_number_of_items () {
  let cnt = 0
  for (let i = 0; i < window.localStorage.length; i++) {
    let key = window.localStorage.key(i)
    let value = window.localStorage.getItem(key)

    if (key.indexOf('product_') == 0) {
      cnt += value * 1
    }
  }
  return cnt
}

function cart_get_orders () {
  let orders = ''
  for (let i = 0; i < window.localStorage.length; i++) {
    let key = window.localStorage.key(i)
    let value = window.localStorage.getItem(key)

    if (key.indexOf('product_') == 0) {
      orders = orders + key + '=' + value + ','
    }
  }
  return orders
}

function update_orders_input () {
  let orders = cart_get_orders()
  document.getElementById('orders_input').value = orders
}

function update_orders_form () {
  let orders = cart_get_orders()
  document.getElementById('orders_form').value = orders
}

function update_orders_badge () {
  let badge = cart_get_number_of_items()
  document.getElementById('item_count').innerText = badge
}

function cart_order_table () {
  let content = []
  for (const [key, value] of Object.entries(localStorage)) {
    console.log(key, value)
    content.push(`
    <tr>
      <td>${key}</td>
      <td>${value}</td>
    </tr>
  `)
  }
  let tbody = document.getElementById('table_body')
  tbody.innerHTML = content.join('')
}

function cancel_order () {
  window.localStorage.clear()
  update_orders_badge()
  return false
}
