$('ul.dropdown-menu li a').click(function (e) {
  var version = this.innerHTML;
  $('#version').html('Version ' + version + ' <span class="caret"></span>');
  $('#manual').html('manual ' + version);
  $('#manual-link').attr('href', 'manuals/' + version + '/index.html');
  $('#release-notes').html('release notes ' + version);
  $('#release-notes-link').attr('href', 'manuals/' + version + '/index.html#Releasenotesfor' + version);
});
