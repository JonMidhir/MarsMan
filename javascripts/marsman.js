// Generated by CoffeeScript 1.4.0
(function() {
  var Buggy, GameWorld, Mound;

  Buggy = (function() {

    function Buggy() {
      this.color = '#00f';
      this.world_reference = this.world_constructor();
      this.physics = {
        'y-velocity': 10,
        'density': 1000
      };
    }

    Buggy.prototype.world_constructor = function() {
      return $('<div class="buggy"></div>');
    };

    return Buggy;

  })();

  GameWorld = (function() {

    function GameWorld(canvas) {
      this.canvas = canvas;
      this.then = null;
      this.mounds = [];
      this.oxygen = 0;
    }

    GameWorld.prototype.render = function() {};

    GameWorld.prototype.update = function(modifier) {};

    GameWorld.prototype.main = function() {
      var delta, now;
      now = Date.now();
      delta = now - this.then;
      this.update(1000);
      this.render();
      this.then = now;
      return true;
    };

    GameWorld.prototype.run = function() {
      var callback;
      this.then = Date.now();
      callback = this.main.bind(this);
      return setInterval(callback, 1);
    };

    GameWorld.prototype.add = function(object) {
      this.canvas.div.prepend(object.world_reference);
      return object.world_reference.box2d(object.physics);
    };

    return GameWorld;

  })();

  $(document).ready(function() {
    var buggy, canvas, gameWorld;
    canvas = {
      div: $('#world'),
      height: $('#world').height(),
      width: $('#world').width()
    };
    gameWorld = new GameWorld(canvas);
    gameWorld.run();
    canvas.div.live('click', function(e) {
      var mound;
      mound = new Mound(e.pageX, e.pageY);
      return gameWorld.add(mound);
    });
    buggy = new Buggy();
    gameWorld.add(buggy);
    $('body').keypress(function() {
      return console.log(">");
    });
    return $("#floor").box2d({
      'x-velocity': -10,
      'y-velocity': 10,
      'static': true
    });
  });

  Mound = (function() {

    function Mound(x, y) {
      this.x = x;
      this.y = y;
      this.height = 10;
      this.width = 10;
      this.color = '#f00';
      this.oxygen = 10;
      this.world_reference = this.world_constructor();
      this.physics = {
        'y-velocity': 100
      };
    }

    Mound.prototype.world_constructor = function() {
      return $('<div class="mound"></div>');
    };

    return Mound;

  })();

}).call(this);
