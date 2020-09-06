window.addEventListener('load', function(){

const price = document.getElementById("item-price")
const comission = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")

price.addEventListener('input', function(){
const num = document.getElementById("item-price").value
 comission.innerHTML=Math.floor(num * 0.1)
 profit.innerHTML=Math.floor(num * 0.9)
 
})
})