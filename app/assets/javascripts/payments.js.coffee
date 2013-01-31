# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

jQuery ->
  $("#card_number").blur ->
    if CreditCard.validNumber(@value)
      $("#credit_card_number_error").text("")
    else
      $("#credit_card_number_error").text("Invalid credit card number.")

payment =
  setupForm: ->
    $('#new_payment').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        payment.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      name: $('#payment_name').val()
      address_line1: $('#address_line1').val()
      address_zip: $('#address_zip').val()
      address_state: $('#address_state').val()
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#payment_stripe_card_token').val(response.id)
      $('#new_payment')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

CreditCard =
  cleanNumber: (number) -> number.replace /[- ]/g, ""
  
  validNumber: (number) ->
    total = 0
    number = @cleanNumber(number)
    for i in [(number.length-1)..0]
      n = +number[i]
      if (i+number.length) % 2 == 0
        n = if n*2 > 9 then n*2 - 9 else n*2
      total += n
    total % 10 == 0


