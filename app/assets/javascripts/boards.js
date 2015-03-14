(function () {
  "use strict";

  var el_id = '#root';
  if (!document.querySelector(el_id)) {return;}

  new Vue({
    el: el_id,
    data: {
      boards: BOARDS,
    },

    methods: {
      AddBoard: function () {
        var board_name = window.prompt("Pleas input board name.");
        if (!board_name) {return;}

        var self = this;
        $.ajax({
          url: '/boards/',
          type: 'POST',
          data: {
            name: board_name,
          },
        }).done(function (data) {
          self.boards.push(data);
          alert('Done!');
        }).fail(function (xhr) {
          alert(xhr.responseText);
        });
      },
    },

    computed: {},
  });

})();
