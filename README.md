# DartMUDlet  -  Pato Edition &#129414;
![DartMUD_website_banner](https://github.com/user-attachments/assets/b5e6a89b-7c74-4afa-8d42-a59ef2a38da0)
&nbsp;
## Screenshots
![DartMUDlet_screenshot](https://github.com/user-attachments/assets/06848f17-434d-40ec-86a4-ed44af8e1fd1)
&nbsp;
![repeat_example_cropped](https://github.com/user-attachments/assets/5cd282c7-ea0c-41b6-b86d-7c078fe23644)
&nbsp;
![allocs_example_cropped](https://github.com/user-attachments/assets/eeba2503-3f57-45a1-8362-2a4aa3de4c6d)
&nbsp;
## Features
DartMUDlet has many useful features to make your DartMUD experience more efficient and enjoyable. Features that include upgrades to the user interface, automation, and reporting are all included. It includes a conversation window across the top as well as a character information panel in the bottom right next to the command window. DartMUDlet automatically counts and reports skill improves for both you and your pets, and will attempt to autocorrect when a skill rolls to the next level. DartMUDlet will also block and queue up commands while you are performing interruptable actions (e.g. spells, books, scrolls), then release them afterwards when the action is complete.

&nbsp;
## Installation
1. &nbsp;Visit the project [release page](https://github.com/Pato-elf/dartmudlet/releases) and download the latest dartmudlet.zip under Assets.
2. &nbsp;Launch [Mudlet](https://www.mudlet.org/) and connect to your [DartMUD](http://ferdarchi.com) profile.
3. &nbsp;Open the Mudlet Package Manager, click "Install new package" and select the package you downloaded.
4. &nbsp;Type `/setup` on the command line to get things set up.
5. &nbsp;Type `/help` for a full list of commands.

&nbsp;
## How to use?
In addition to the automatic features described above, there are a number of things you can control by typing commands:

```
   Critical Commands
   /setup            - Initialize variables, customize display, start improve tracking
   /block            - Block and queue new commands from being sent to DartMUD
   /unblock          - Resume sending commands to DartMUD, including queued ones first
   /help <topic>     - Get detailed help for most DartMUDlet commands
```
```
   Skill Announce System
   /announce on            - Announce improves in standard mode (skill name+)
   /announce brief         - Announce improves in brief mode (plus only, no skill name)
   /announce verbose       - Announce improves in verbose mode (skill and actual value)
   /announce off           - No announcement of improves
```
```
   Channelling System
   /chan <num>                      - Manually channel amount to the channelling system
   /chan info                       - Display full channelling stats on screen
   /chan pause on|off               - Pause powercast to wait for full concentration
   /chan share on|off|brief         - Change settings of the channel share button
   /chan sound on|off               - Play notification sound before powercast
```
```
   Inscribe System
   /inscribe <spell> <power>        - Start practice inscribing a spell
   /inscribe power <power>          - Change power you are using for practice inscribe
   /inscribe off                    - Stop practice inscribing a spell
```
```
   Skill Display System
   /info <who> <skill>              - Show current improves/level for a skill
   /share <who> <skill>             - OOC share current improves/level for a skill
   /insert <who> <skill> <improves> - Manually insert a new skill into database
   /update <who> <skill> <improves> - Manually set improves for you|pet's skill
```
```
   Other Commands
   /alloc clear <num>               - Clear the contents of an allocation set
   /alloc copy <num> <num>          - Copy one allocation set over to another
   /cast power <power>              - Change the autocast power via keyboard command
   /date <now> <+|-><num><h|d>      - Show game dates for the past, now, or future
   /levels                          - Display a list of skill levels
   /random <num>                    - Generate a random number between 1 and a number
   /random <value,value,value>      - Pick a random value from a list of values
   /repeat clear <num>              - Clear the contents of a repeat set
   /repeat copy <num> <num>         - Copy one repeat set over to another
   /repeat echo on|off              - Echo repeat commands to the screen (default off)
   /track <option>                  - Command line control of the tracking system
   #num <command>                   - Basic repeat commands (e.g. #3 say hi)
   #Wnum <command>                  - Delay command for num seconds (e.g. #W4 smoke pipe)
```
```
   The /set command allows several defaults to be set
   Use /help set <option> for more information. Current settings include:
   alignment      announce       antispam       aura           conc
   contents       focus          fontsize       keypad         who
```
&nbsp;
## Credits
- The core of this package began as zMud scripts authored by Gaborn and shared with the player community.
- Special thanks to Ogma for providing the detailed date/time logic behind several in-game date/time systems.
- The zMud scripts were converted to a Mudlet package by Gaborn and shared as DartMUDlet.
- These were refactored into modular LUA and brought to GitHub by [missionz3r0](https://github.com/missionz3r0).
- The Pato versions of DartMUDlet are a fork from [daviesow](https://github.com/daviesow) DartMUDlet release.
- Code for the adjustable tab windows originally written by [Edru](https://github.com/Edru2).
- Bug testers: Castlehoff, Rikter, Tudor
