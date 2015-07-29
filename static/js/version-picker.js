function setVersion(version) {
  if (/^\d+\.\d+$/.test(version)) {
    $('#version').html('Version ' + version + ' <span class="caret"></span>');
    $('#manual').html('manual ' + version);
    $('#manual-link').attr('href', 'manuals/' + version + '/index.html');
    $('#release-notes').html('release notes ' + version);
    $('#release-notes-link').attr('href', 'manuals/' + version + '/index.html#Releasenotesfor' + version);
  }
}

$(document).ready(function() {
  var version = window.location.hash.substring(1);

  if (version) {
    setVersion(version);
  }
});

$('ul.dropdown-menu li a').click(function (e) {
  setVersion(this.innerHTML);
});
