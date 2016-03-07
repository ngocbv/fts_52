var interval;

function time_remaining(total_seconds){
  if (total_seconds == 0) {
    $("form.edit_exam").submit();
    return;
  }else{
    var seconds = total_seconds % 60;
    var minutes = Math.floor(total_seconds / 60) % 60;
    var hours = Math.floor(total_seconds / 3600);
    var duration = $("#subject_duration").data("duration");
    $("#exam_spent_time").attr("value", duration - total_seconds + 1);
    $("#hour").text(hours);
    $("#minute").text(minutes);
    $("#second").text(seconds);
  }
}

var ready_var = function(){
  total_times = $("#time-remaining").data("time-remaining");
  time_remaining(total_times);
  clearInterval(interval);
  interval = setInterval(function() {
    time_remaining(total_times--);}, 1000);
}

$(document).ready(ready_var);
$(document).on("page:load", ready_var);
