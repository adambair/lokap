
// Sending something to Google Analytics is known as a 'hit'

// EVENT
// ----------------------------------------------------------------------------

ga('send', 'event', 'cruise_control', 'button_clicked', 'fast lane clicked')

ga(

  'send',   // REQUIRED, never changes
  type,     // REQUIRED, (usually event), pageview, screenview, transaction, item, social, exception, timing
  category, // REQUIRED, Typically the object that was interacted with (e.g. 'Video')
  action,   // REQUIRED, The type of interaction (e.g. 'play')

  label,    // optional, Useful for categorizing events (e.g. 'Fall Campaign')
  value     // optional, A numeric value associated with the event (e.g. 42)

)

// SCREENVIEW
// ----------------------------------------------------------------------------

ga('send', 'screenview', {
  
  'appName':    'Internal Onramp', // REQUIRED, name of the application
  'screenName': 'Pay at the Shop'  // REQUIRED, name of the screen

});





// WEB-5435 Add GA event for tracking when the "pay with Openbay" button is clicked
// ----------------------------------------------------------------------------

// Events before I knew what I was doing
// ----------------------------------------------------------------------------
ga('send', 'event', 'Pay at the shop', 'show options')
ga('send', 'event', 'Pay at the shop', 'clicked')


// Events AFTER I knew what I was doing
// ----------------------------------------------------------------------------
ga('send', {
  hitType:       'event',
  eventCategory: 'Pay at the Counter',
  eventAction:   'render',
  eventLabel:    'Show payment choices'
});

ga('send', {
  hitType:       'event',
  eventCategory: 'Pay at the Counter',
  eventAction:   'click',
  eventLabel:    'click "Pay at the shop"'
});

ga('send', {
  hitType:       'event',
  eventCategory: 'Pay at the Counter',
  eventAction:   'click',
  eventLabel:    'click "Pay through Openbay"'
});

ga('send', {
  hitType:       'event',
  eventCategory: 'Pay at the Counter',
  eventAction:   'render',
  eventLabel:    'Show "Pay at the shop" pop-up text'
});

ga('send', {
  hitType:       'event',
  eventCategory: 'Pay at the Counter',
  eventAction:   'render',
  eventLabel:    'Show "Book-it" page'
});






















