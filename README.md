# DartMUDlet  -  Pato Edition &#129414;

&nbsp;
## Screenshots
![DartMUDlet_screenshot_v1.4.1](https://github.com/user-attachments/assets/09d5b69f-57a1-4338-8055-5088e13c95e4)
&nbsp;
![DartMUDlet_screenshot_v1.2](https://github.com/user-attachments/assets/80b1c2f1-cd70-40f7-866a-aae7df62825b)
&nbsp;
## Features
DartMUDlet has many useful features to make your DartMUD experience more efficient and enjoyable. Features that include upgrades to the user interface, automation, and reporting are all included. It includes a conversation window across the top as well as a character information panel in the bottom right next to the command window. DartMUDlet automatically counts and reports skill improves for both you and your pets, and will attempt to autocorrect when a skill rolls to the next level. DartMUDlet will also block and queue up commands while you are performing interruptable actions(e.g. spells, books, scrolls), then release them afterwards when the action is complete.

&nbsp;
## Installation
1. &nbsp;Visit the project [release page](https://github.com/Pato-elf/dartmudlet/releases) and download the latest dartmudlet.zip under Assets.
2. &nbsp;Launch [Mudlet](https://www.mudlet.org/) and connect to your [DartMUD](http://dartmud.com) profile.
3. &nbsp;Open the Mudlet Package Manager, click "Install new package" and select the package you downloaded.
4. &nbsp;Type `/setup` on the command line to get things set up.
5. &nbsp;Type `/announce on` to turn on improve announcements.
6. &nbsp;Type `/help` for a full list of commands.

&nbsp;
## How to use?
In addition to the automatic features described above, there are a number of things you can control by typing commands:

```
/setup   - Initialize variables, customize the display, start improve tracking database.
/unsetup - Remove timers and triggers, deactivate display customizations.
/resetup - Remove then reinitialize timers, etc.  Use to make updated DartMUDLet code active.
```
Some of the rest are:
```
/announce on      - Announce improvements in standard mode (skill name+)
/announce brief   - Announce improvements in brief mode (+ only, no skill name)
/announce verbose - Announce improvements in verbose mode (skill name+, and actual skill number)
/announce off     - No announcement of improvements
```
```
/block   - Start blocking new commands from being sent to the MUD, queue them to be sent later.
           Typically blocking is initiated automatically when you begin an interruptable action.
/unblock - Resume sending commands to the MUD starting with any that were queued while blocking.
           For when you MUST interrupt your previous action (e.g. to run from that dragon NOW).
```
```
/cast ! <spell> @ <power> <spell args> - Repeat practice casting a spell
/cast ! off                            - Stop practicing; remember spell and power
/cast ! resume [<spell>]               - Resume practing last/named spell at the previous power
/cast ! status [of <spell>]            - Show power used for last/named spell
```
```
/chan info                       - Display full channelling stats on screen
/chan pause on|off               - Pause powercast to wait for full concentration
/chan share on|off|brief         - Change settings of the channel share button
/chan sound on|off               - Play notification sound before powercast
```
```
/inscribe ! <spell> @ <power>     - Repeat practice inscribing a spell at the given power 
/inscribe ! off                   - Stop practice inscribing 
/inscribe ! resume [<spell>]      - Resume practice inscribing the last/named spell at last power 
/inscribe ! adjust power <power>  - Change the power you are using for each practice
/inscribe ! status [of <spell>]   - Show power used for last/named spell
```
```
/update <who> <skill> <improves> - Set improves for your (or pet's) skill to given total
/insert <who> <skill> <improves> - Manually insert a new skill into the database
/info <who> <skill>              - Show current improves/level for a skill
/conc on|off|full                - Show concentration on screen (none, bright only, all)
/who on|off                      - Auto check the who list every 5 minutes
/antispam on|off                 - suppress repeated lines
/random <num>                    - Generate a random number between 1 and a number
/random <value,value,value>      - Pick a random value from a list of values
#num repeat                      - Repeat commands from the command line (e.g. #3 say hi)
/levels                          - Display a list of skill levels
/help                            - Display a list of available commands
```

&nbsp;
## Credits
- The core of this package began as zMud scripts authored by Gaborn and shared with the player community.
- Special thanks to Ogma for providing the detailed date/time logic behind several in-game date/time systems.
- The zMud scripts were converted to a Mudlet package by Gaborn and shared as DartMUDlet.
- These were exensively refactored into modular LUA and brought to GitHub by [missionz3r0](https://github.com/missionz3r0).
- The Pato versions of DartMUDlet are a fork from [daviesow](https://github.com/daviesow) DartMUDlet release.
- Code for the adjustable tab windows originally written by [Edru2](https://github.com/Edru2).
