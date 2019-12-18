const alert = document.getElementById('flash-alert');
const notice = document.getElementById('flash-notice');

if (notice) {
  setTimeout(() => { notice.style.display = 'none' }, 4000);
}

if (alert) {
  setTimeout(() => { alert.style.display = 'none' }, 4000);
}
