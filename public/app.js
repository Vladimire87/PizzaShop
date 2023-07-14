function something () {
  var x = window.localStorage.getItem('i')
  x = x * 1 + 1
  window.localStorage.setItem('i', x)
  console.log(x)
}

function add_to_cart (id) {
  var key = 'product_' + id
  var x = window.localStorage.getItem(key)
  x = x * 1 + 1
  window.localStorage.setItem(key, x)
  console.log('Items in your cart: ' + cart_get_number_of_items())
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
