//	Técnico em Programação de Jogos Eletrônicos
//	Unidade Curricular: Infraestrutura de Redes e Sistemas
//	Prof: Gregório Cacciari
//
//	Arquivo Client.hx
//	Implementação básica de um cliente TCP/IP
//	Adaptado do código fonte original em: 
//	"Writing a Client/Server Tutorial"
// 	URL: http://old.haxe.org/doc/neko/client_server
// 	Última atualização em 16/09/2015

// necessita do import para trabalhar com parsagens
import haxe.Json;

// file Client.hx
class Client {
    static function main() {
        
        var s = new sys.net.Socket();
        
        s.connect(new sys.net.Host("127.0.0.1"), 5000);
        
        while( true ) {     
	       //String de recebimento _PersonagemData.
	       //Recebe uma linha da entrada do socket "s" e grava
	       var _PersonagemData : String = s.input.readLine();

	       // Objeto dinamico _PersonagemObject
	       // É montado de acordo com a parsagem da string _PersonagemData
	       var _PersonagemObject : Dynamic = Json.parse(_PersonagemData);

	       // Agora podemos referenciar os objetos dinamicos
	       trace("Mana:" + _PersonagemObject.Mana);
	       trace("Life:" + _PersonagemObject.Life);
	
            // Inclusive seus vetores
            trace("Items:\n");
            trace("     " + _PersonagemObject.Items[0]);
            trace("     " + _PersonagemObject.Items[1]);
            trace("     " + _PersonagemObject.Items[2]);
	   }
    }
}











