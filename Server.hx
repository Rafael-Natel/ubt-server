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
    
    override function new (name:String) {
        _name = name;
    }
}

class Server {
    private var _player1:Player;
    private var _player2:Player;
    private var _state:State;
    
    static function main() {

    // instancia novo socket s
    var s = new sys.net.Socket();

    // usa o método BIND para começar
    // a escuta na porta e IPs 
    // especificados no parâmetro
    var host = "0.0.0.0";
    var port = 5000;
        
    s.bind(new sys.net.Host("host"), port);
        
        s.listen(1);
//      $host:$port'
        trace("Starting server at ...");
        
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
            
            switch _state {
                    case CONNECT:
                    
                    
            }

            var _PersonagemData: String = '{"Type":"1","Life":"'+_life+'","Mana":"456","Items":["Potion","Sword","Shield","Helm","300 Gold"]}';                
                
            // Envia string 
            _minhaconexao.write(_PersonagemData + "\n");

            // Uma pausa anti-flood, para fins
            // de demonstrção somente.
            Sys.sleep(4);

            }
    }
}
