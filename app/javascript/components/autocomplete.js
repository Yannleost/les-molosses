// Why doing it only on dog_address field ?
//  => No autocomplete on user profile creation ?

function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var dogAddress = document.getElementById('dog_address');

    if (dogAddress) {
      var autocomplete = new google.maps.places.Autocomplete(dogAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(dogAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

