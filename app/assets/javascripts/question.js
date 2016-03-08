$(document).ready(function(){
  $(document).on("change", ".select-box", function(){
    if($(this).val() == "text"){
      $(".choise").hide();
      $(".text").show();
    }else{
      $(".choise").show();
      $(".radio_answer").attr("checked", false);
      $(".text").hide();
    }
  });

  $(document).on("click", ".radio_answer", function(){
    if($(".select-box").val() == "single"){
      $(".radio_answer").not(this).attr("checked", false);
      $(this).attr("checked", true);
    }
  });
});
