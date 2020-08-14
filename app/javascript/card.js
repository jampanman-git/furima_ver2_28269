const pay = () => {
  Payjp.setPublicKey("pk_test_2ced4f4aced4d3455eb3eac6");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);


console.log(formData.get("order_address[number]"))
console.log(formData.get("order_address[cvc]"))
console.log(formData.get("order_address[exp_month]"))
console.log(`20${formData.get("order_address[exp_year]")}`)
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    


    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("order_address_number").removeAttribute("name");
        document.getElementById("order_address_cvc").removeAttribute("name");
        document.getElementById("order_address_exp_month").removeAttribute("name");
        document.getElementById("order_address_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        console.log(status)
      }
    });
  });
};

window.addEventListener("load", pay);
