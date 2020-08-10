window.addEventListener('load', function(){
console.log("test")
  let input_price = document.querySelector(".price-input")
  const addTaxPrice = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")


  input_price.addEventListener('input', function(){
    var price = this.value;
    var add_tax_price = Math.floor(price * 0.1)/ 1;
    var profit_amount = Math.floor(price - add_tax_price)/ 1;
    console.log(add_tax_price)

    document.getElementById("add-tax-price").innerHTML = add_tax_price

    document.getElementById("profit").innerHTML = profit_amount 
  })
})