package;

import com.raidandfade.haxicord.websocket.WebSocketConnection;
import com.raidandfade.haxicord.types.Message;
import com.raidandfade.haxicord.commands.CommandBot;
import com.raidandfade.haxicord.types.structs.Embed;

class Main extends CommandBot {
    static function main() {
        new Main("hahano",Main,"-"); 
    }

    @Command
    function ping(msg:Message) {
      if (!msg.inGuild()) return;
      msg.reply({
        content: 'Pong!'
      });
    }

    @Command
    function user(msg:Message) {
      if (!msg.inGuild()) return;
        msg.reply({
          embed: {
            title: msg.author.username + '#' + msg.author.discriminator + "'s Information",
            description: '**Username** - ' + msg.author.username + '#' + msg.author.discriminator + '\n**Nickname** - ' + msg.getMember().displayName + '\n**ID** - ' + msg.author.id,
            thumbnail: {
              url: msg.author.avatarUrl
            }
          }
        });
    }

    @Command
    function guild(msg:Message) {
      if (!msg.inGuild()) return;
      /*if (msg.getGuild().verification_level == 3) { 
        var level = '(╯°□°）╯︵ ┻━┻';
      }*/
      msg.reply({
        embed: {
          title: msg.getGuild().name + "'s Information",
          description: '**Name** - ' + msg.getGuild().name + '\n**Owner** - <@' + msg.getGuild().owner_id + '>\n**Region** - ' + msg.getGuild().region + '\n**Verification Level** - ' + msg.getGuild().verification_level + '\n**Bot Joined At** - ' + msg.getGuild().joined_at,
          thumbnail: {
            url: 'https://cdn.discordapp.com/icons/' + msg.getGuild().id + '/' + msg.getGuild().icon + '.png'
          }
        }
      });
    }
}
