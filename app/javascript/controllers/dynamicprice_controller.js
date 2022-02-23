import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "price" ]

  connect() {
    updatePrice()
  }

  updatePrice() {
    // this.priceTarget.innerText = this.startdateTarget.value
    let btn = document.getElementById("rent-btn");
    let startdate = document.getElementById("rental_start_time");
    startdate = Date.parse(startdate.value);
    let enddate = document.getElementById("rental_end_time");
    enddate = Date.parse(enddate.value)
    let priceperday = document.getElementById("priceperday");
    priceperday = Number(priceperday.innerText);
    let price = (((enddate - startdate)/86400000)+1)*priceperday
    price = (Math.round(price * 100) / 100).toFixed(2);
    // console.log(((Date.parse(enddate.value) - Date.parse(startdate.value))/86400000)+1)
    if (enddate < startdate) {
      this.priceTarget.innerText = "Invalid dates"
      btn.disabled = true
    } else {
      this.priceTarget.innerText = price + " €"
      btn.disabled = false
    }
  }
}
