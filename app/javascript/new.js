window.addEventListener('load', function(){

  let input_price = document.querySelectorAll("price-input")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")


  input_price.addEventListener('change', function(){
    var price = document.querySelectorAll("price-input").value;
    var add_tax_price = price * 0.1
    var profit_amount = price - add_tax_price
  }

}