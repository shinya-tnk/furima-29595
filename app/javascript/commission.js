function calculateCommisssion() {
  
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const commission = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    commission.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });
  
};
  window.addEventListener('load', calculateCommisssion)