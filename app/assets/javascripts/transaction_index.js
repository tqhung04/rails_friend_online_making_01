var x = document.getElementById("demo");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  $.ajax({
    type: "POST",
    url: "/transactions",
    data: { local: { latitude: position.coords.latitude,
      longitude: position.coords.longitude } },
  })
}
