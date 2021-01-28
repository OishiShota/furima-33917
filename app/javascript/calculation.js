function calculation (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPriceValue = itemPrice.value/10;
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${addTaxPriceValue}`;
    const profitValue = (itemPrice.value/10*9);
    const profit  = document.getElementById("profit");
    profit.innerHTML = `${profitValue}`;
  });
}

window.addEventListener('load', calculation);