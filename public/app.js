function something () {
  var x = window.localStorage.getItem('i')
  x = x * 1 + 1
  window.localStorage.setItem('i', x)
  console.log(x)
}

function add_to_cart (id) {
  alert('id: ' + id)
}
