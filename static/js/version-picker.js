function setVersion(version) {
  if (/^\d+\.\d+(-develop)?$/.test(version)) {
    var version_label = version.replace('-develop', '');
    $('#version').html('Version ' + version + ' <span class="caret"></span>');
    $('#manual').html('manual ' + version_label);
    $('#manual-link').attr('href', 'manuals/' + version + '/index.html');
    $('#release-notes').html('release notes ' + version_label);
    $('#release-notes-link').attr('href', 'manuals/' + version + '/index.html#Releasenotesfor' + version);
    $('#api-ref').html('api ' + version_label);
    $('#api-ref-link').attr('href', 'api/' + version + '/index.html');
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
