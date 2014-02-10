jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $(document).ready ->
    $("div.student-form div.row:nth-child(even)").addClass('even')#css('background-color':'black')
    $("div.student-form div.row:nth-child(odd)").addClass('odd')#.css('background-color':'green')


#hover: (e) =>
#  $(e.currentTarget).css("background-color", "#333")
#$('#foo').hover ->
#  $(this).css('background-color', '#333')
#$('html, body').animate(scrollTop: rowToHighlight.offset().top - 200, 200)
###$(document)
  .ready -> $('body') .css -> 'background-color':'black'###

###
(function() {
$(document).ready(function() {
return $('body').css(function() {
return {
'background-color': 'black'
};
});
});

}).call(this);###
