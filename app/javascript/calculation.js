function calculation (){
	const form = document.getElementById("item-price");
	form.addEventListener("input", () => {
		const price = form.value;
		const fee = price * 0.1;
		const profit = price * 0.9;
		const fee_price = document.getElementById("add-tax-price");
		const profit_price = document.getElementById("profit");
		fee_price.textContent = Math.floor(fee);
		profit_price.textContent = Math.floor(profit); 
	});
}
window.addEventListener("load", calculation);