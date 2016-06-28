//	Técnico em Programação de Jogos Eletrônicos
//	Unidade Curricular: Infraestrutura de Redes e Sistemas
//	Prof: Gregório Cacciari
//
//	Arquivo Server.hx
//	Implementação básica de um servidor TCP/IP
//	Adaptado do código fonte original em:
//	"Writing a Client/Server Tutorial"
// 	URL: http://old.haxe.org/doc/neko/client_server
// 	Última atualização em 16/09/2015

// modulo haxe.Json necessita ser importado
// para trabalhar com parsagem
import haxe.Json;


enum State{
    CONNECT;
    SELECT;
    SYNC;
    PLAY;
}

class Player {
    var _name:String;
	var _character:String;
	var x:Int;
	var y:Int;

    public function new (name:String) {
        _name = name;
    }

	public function GetX():Int { return x; }
	public function GetY():Int { return y; }

	public function Name():String {
		return _name;
	}

	public function setCharacter(name:String) {
		_character = name;
	}
}

class Server {
    static function main() {
		var _player1:Player = null;
		var _player2:Player = null;
		var _state:State;

		var s = new sys.net.Socket();

		// usa o método BIND para começar
		// a escuta na porta e IPs
		// especificados no parâmetro
		var host = "192.168.1.9";
		var port = 5000;

		s.bind(new sys.net.Host(host), port);

        s.listen(1);
//      $host:$port'
        trace("Starting server at ...");

		while (true) {
			th
        var _minhaconexao: sys.net.Socket = s.accept();

        trace("Client connected");

        _state = CONNECT;
        var curPlayer:Player = null;

        if(_player1 == null) {
            _player1 = new Player("player1");
            curPlayer = _player1;
        } else {
            _player2 = new Player("player2");
			curPlayer = _player2;
        }

        while(true) {
			switch (_state) {
				case CONNECT:
					var data:String = '{"player": "' + curPlayer.Name() + '", "status": "OK"}';

					_minhaconexao.write(data+"\n");
					_state = SELECT;
				case SELECT:
					trace("waiting for select");
					var data:String = _minhaconexao.input.readLine();

					var selectObject:Dynamic = Json.parse(data);

					trace("received:", selectObject.character);
					curPlayer.setCharacter(selectObject.character);
					_state = SYNC;

				case SYNC:
					trace("waiting for sync");
					var data:String = _minhaconexao.input.readLine();

					var selectObject:Dynamic = Json.parse(data);

					trace("received:", selectObject.character);
					otherPlayer.setCharacter(selectObject.character);
					_state = PLAY;
				case PLAY:
					try {
						_minhaconexao.write("{\"x\": " + otherPlayer.GetX() + ", \"y\": " + otherPlayer.GetY() + "}\n");
					} catch(msg:String) {
						trace("Error", msg);
					}
			}

            Sys.sleep(4);

		}
		}
    }
}
