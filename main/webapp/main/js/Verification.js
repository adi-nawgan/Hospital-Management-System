let time = document.querySelector("#time");
let confirm=document.querySelector("#confirm");
  let minutes = 4;
  let seconds = 0;  // Initializing to 0 since `1:00` is equivalent to `0` seconds left.
  let interval = null;

  window.addEventListener("load", () => {
    if (interval) {
      clearInterval(interval); // Clear any previous interval
    }

    interval = setInterval(() => {
      if (minutes === 0 && seconds === 0) {
        clearInterval(interval); // Stop the timer when it reaches 0:00
        time.innerHTML = `${minutes} : ${seconds}`;
      } else {
        // Format the time display with leading zero if seconds are < 10
        let secondsDisplay = seconds < 10 ? `0${seconds}` : seconds;
        time.innerHTML = `${minutes} : ${secondsDisplay}`;
		confirm.style="disabled";

        // Decrement time
        if (seconds === 0) {
          if (minutes >= 0) {
            minutes -= 1;
            seconds = 59; // Reset seconds to 59
          }
        } else {
          seconds -= 1;
        }
      }
    }, 1000);
  });
  
