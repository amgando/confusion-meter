;(function(){
  var buttons = document.getElementsByClassName('button');

  var index = buttons.length

  while(index--) {
    buttons[index].addEventListener('click', function(e){
      incrementFrequency(e.target.id);
    })
  }


  function incrementFrequency(id) {

    var xhReq = new XMLHttpRequest();

    xhReq.open("GET", "/questions/" + id, false);
    xhReq.send(null);

    var serverResponse = JSON.parse(xhReq.responseText);

    if(serverResponse.errors) {
      alert(serverResponse.errors);

    } else {
      updateFrequency(serverResponse)
    }
  }

  function updateFrequency(data) {
    var button = document.getElementById(data.question);
    var frequency = button.nextSibling.nextSibling;

    frequency.innerHTML = data.frequency;
  }

}())