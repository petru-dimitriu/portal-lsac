function leadingZero(i) 
{
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
//Adelina
//Set the date we're counting down to

function countTimeFor(what, when)
{
	// Update the count down every 1 second
	var x = setInterval(function() {

	    // Get todays date and time
	    var now = new Date().getTime();
	    // Find the distance between now an the count down date
	    var distance = when - now;
	    
	    // Time calculations for days, hours, minutes and seconds
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	    document.getElementById(what).innerHTML =
	    	leadingZero(days) + " zile " + leadingZero(hours) + " ore "
	    	+ leadingZero(minutes) + " minute " + leadingZero(seconds) + " secunde ";
	    
	    // If the count down is over, write some text 
	    if (distance < 0) {
	        clearInterval(x);
	        document.getElementById("stop").innerHTML = "EXPIRED";
	    }
	}, 1000);
}