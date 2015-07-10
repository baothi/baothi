# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class window.Home
  constructor: ->
    @clickOnbookingbtn()


  clickOnbookingbtn: ->
    $(document).on "click", "#btn_booking", ->
      seat_num = $("#booking_seater_number").val()
      booking_address = $("#booking_address").val()
      if seat_num.length > 0
        if $.isNumeric(seat_num) != true 
          alert "Seater number must be number."
          return false
        else if seat_num != "4" and seat_num != "7"
          alert "Seater number must be 4 or 7."
          return false
        else if booking_address.length < 1
          alert "Your current address can't be blank"
          return false
      else
        alert "Seater number can't be blank."
        return false
