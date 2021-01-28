function calculation (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    const addTaxPriceValue = Math.ceil(price/10);
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${addTaxPriceValue}`;
    const profitValue = (price - addTaxPriceValue);
    const profit  = document.getElementById("profit");
    profit.innerHTML = `${profitValue}`;
  });
}

window.addEventListener('load', calculation);