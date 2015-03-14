(function () {
  "use strict";

  var el_id = '#root';
  if (!document.querySelector(el_id)) {return;}

  new Vue({
    el: el_id,
    data: {
      boards: BOARDS,
      current: null,
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
        }).done(function (board) {
          self.boards.push(board);
          self.show(board.id);
        }).fail(function (xhr) {
          alert(xhr.responseText);
        });
      },

      show: function (id) {
        var self = this;
        $.ajax({
          url: '/boards/' + id,
          type: 'GET',
        }).done(function (board) {
          self.current = board;
        }).fail(function (xhr) {
          alert(xhr.responseText);
        });
      },
    },

    computed: {},
  });

})();
