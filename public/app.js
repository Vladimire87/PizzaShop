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
}
document.addEventListener('DOMContentLoaded', function () {
  var itemNumber = 0
  for (const [key, value] of Object.entries(localStorage)) {
    y = Number(value)
    itemNumber += y
  }
  console.log('Total items: ' + itemNumber)

  var item_count = document.getElementById('item_count')
  if (item_count) {
    item_count.textContent = itemNumber
  }
})
