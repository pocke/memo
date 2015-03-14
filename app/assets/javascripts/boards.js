(function () {
  "use strict";

  var el_id = '#root';
  if (!document.querySelector(el_id)) {return;}

  new Vue({
    el: el_id,
    methods: {
      AddBoard: function () {
        var board_name = window.prompt("Pleas input board name.");
        if (!board_name) {return;}

        $.ajax({
          url: '/boards/',
          type: 'POST',
          data: {
            name: board_name,
          },
        }).done(function () {
          alert('Done!');
        });
      },
    },
    computed: {},
  });
})();
