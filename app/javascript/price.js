window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener('input', () => {
    const inputValue = itemPrice.value;
    
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(inputValue * 0.1);

    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - salesCommission.innerHTML);
  })
})
