# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_map = ->
  center = $("#map").data('center') || "United States"

  geocoder = new google.maps.Geocoder();
  geocoder.geocode {address: center}, (results, status) ->
    bounds = results[0].geometry.bounds
    center = results[0].geometry.location

    if bounds
      ne = bounds.getNorthEast()
      sw = bounds.getSouthWest()
      data = { sw: [sw.lat(), sw.lng()], ne: [ne.lat(), ne.lng()]}

    opts = {
      zoom: 4,
      max_zoom: 16,
      center: new google.maps.LatLng(center.lat(), center.lng()),
      scrollwheel: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      MapTypeControlOptions: {
          MapTypeIds: [google.maps.MapTypeId.ROADMAP]
      }
    }
    map = new google.maps.Map(document.getElementById('map'), opts)

    locations = $("#map").data('locations')

    $.each locations, (index, location) ->
      marker = new google.maps.Marker {
        position: new google.maps.LatLng(location.latitude, location.longitude),
        map: map,
        title: location.name
      }

      infowindow = new google.maps.InfoWindow {
        content: "<h5>" + location.name + "</h5>" + location.address + "<br><a href=\"" + location.website + "\">" + location.website + "</a>"
      }

      google.maps.event.addListener marker, 'click', ->
        infowindow.open map, marker

$(document).ready(load_map)